class NestingTableViewController < UITableViewController
  
  # Override the default initialization method
  def initializeWithData(data)
    if !data['tableStyle'].nil? && data['tableStyle'] == "grouped"
      initWithStyle(UITableViewStyleGrouped)
    else
      init
    end
    @tableData = data
    self
  end

  def viewDidLoad
    self.title = @tableData['title'] if @tableData['title']
    view.dataSource = view.delegate = self
    view.reloadData
  end
      
  # UITableViewDelegate methods  
  def numberOfSectionsInTableView(tableView)
    @tableData['sections'].size
  end
    
  def tableView(tableView, titleForHeaderInSection:section)
    if @tableData['sections'][section]['title'].nil?
      ""
    else
      @tableData['sections'][section]['title']
    end
  end

  def tableView(tableView, titleForFooterInSection:section)
    if @tableData['sections'][section]['footer'].nil?
      ""
    else
      @tableData['sections'][section]['footer']
    end
  end
  
  def tableView(tableView, numberOfRowsInSection:section) 
    @tableData['sections'][section]['rows'].size
  end
  
  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    item = @tableData['sections'][indexPath.section]['rows'][indexPath.row]

    # Build the cell
    @reuseIdentifier ||= "CELL_IDENTIFIER"

    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier:@reuseIdentifier)
    end

    if item['sections'].nil?
      cell.accessoryType = UITableViewCellAccessoryNone
      cell.selectionStyle = UITableViewCellSelectionStyleNone
    else
      cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator
      cell.selectionStyle = UITableViewCellSelectionStyleGray
    end

    #clear this out in case the next built cell doesn't have one
    cell.detailTextLabel.text = nil
    if item.is_a?( String )
      # If the item is a string and not an object, use the item as the title
      cell.textLabel.text = item
    else
      # Otherwise, set the title and subtitle (if it exists)
      cell.textLabel.text = item['title']
      unless item['subtitle'].nil?
        cell.detailTextLabel.text = item['subtitle'] 
      end

    end

    cell    
  end

  # This is where the magic happens!
  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    # We need a mutable copy here because the iOS API returns an immutable object
    item = @tableData['sections'][indexPath.section]['rows'][indexPath.row].mutableCopy

    if item['sections'].nil?
      # Don't allow the item to be selected
      return false
    end

    # Persist table style throughout the entire app
    if @tableData['tableStyle']
      item['tableStyle'] = @tableData['tableStyle']
    end

    # Create the child view and initialize it with the selected item's children
    childView = NestingTableViewController.alloc.initializeWithData( item )
    self.navigationController.pushViewController(childView, animated:true)

  end

end
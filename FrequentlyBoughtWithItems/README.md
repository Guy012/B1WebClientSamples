# SAP Business One Web Client Extension Sample
## Prequently Bought With Items

This is a sample for extending SAP Business One Web Client.
After running this extension:
1. A new tab "Prequently Bought With Items" will be added to the Item detail page.
2. The new tab will contain a grid of items that are frequently bought with the currently viewable item.
   This grid will have a checkbox for each such item.
3. A new button will be added to this tab "Create Order" that will add a new order with the current item and selected items.

### Preconditions

#### 1. Edit "prepare_addon.sh" so it can connect to your B1 system, and Run it in a Bash console.
#### 2. Check that the UDO "RelatedItem" was added to your system, and add some data to it (use valid item codes).
#### 2. Register the extension to Extension Manager - Use the URL <TBD>

Please click the Register button and paste the URL you copied from previous step<br>

#### 3. Run Extension in Web Client

If the extension is running properly, the following should work:
* Check if a new tab "Prequently Bought With Items" was added to the Items detail page.<br>
* The data inside the new Grid, it comes from the "RelatedItem" UDO.
* Click the "Create Order" button



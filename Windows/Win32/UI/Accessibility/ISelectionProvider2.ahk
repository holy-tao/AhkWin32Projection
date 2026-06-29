#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISelectionProvider.ahk" { ISelectionProvider }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRawElementProviderSimple.ahk" { IRawElementProviderSimple }

/**
 * Extends the ISelectionItemProvider interface to provide information about selected items.
 * @remarks
 * This interface is implemented by a Microsoft UI Automation provider.
 * 
 * Providers should raise an event of type <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">UIA_Selection_InvalidatedEventId</a> when a selection in a container has changed significantly.
 * 
 * 
 * When selecting from a list or 2D grid there are primary pieces of information that ATs would like to better read to their end users.  Using Excel as a primary example, there are 4 main pieces of information necessary for the AT to provide a good experience:  
 * 
 * <ul>
 * <li>The first cell in the selection</li>
 * <li>The last cell in the selection</li>
 * <li>The current item as you select</li>
 * <li>The total count</li>
 * </ul>
 * <img alt="Image of an Excel spreadsheet showing multiple cells selected. Selection starts in the upper right on cell F5 and ends in the lower left on cell D7." src="./images/ISelectionPattern2.png"/>
 * The above image illustrates the end state of a 2D selection:
 * 
 * 
 * <ul>
 * <li>The user started in cell F5 (note this is where focus input stays because if you type that is where data lands)</li>
 * <li>The user selects down the column to cell F7</li>
 * <li>The user then selects left to cell D7</li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-iselectionprovider2
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct ISelectionProvider2 extends ISelectionProvider {
    /**
     * The interface identifier for ISelectionProvider2
     * @type {Guid}
     */
    static IID := Guid("{14f68475-ee1c-44f6-a869-d239381f0fe7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISelectionProvider2 interfaces
    */
    struct Vtbl extends ISelectionProvider.Vtbl {
        get_FirstSelectedItem   : IntPtr
        get_LastSelectedItem    : IntPtr
        get_CurrentSelectedItem : IntPtr
        get_ItemCount           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISelectionProvider2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IRawElementProviderSimple} 
     */
    FirstSelectedItem {
        get => this.get_FirstSelectedItem()
    }

    /**
     * @type {IRawElementProviderSimple} 
     */
    LastSelectedItem {
        get => this.get_LastSelectedItem()
    }

    /**
     * @type {IRawElementProviderSimple} 
     */
    CurrentSelectedItem {
        get => this.get_CurrentSelectedItem()
    }

    /**
     * @type {Integer} 
     */
    ItemCount {
        get => this.get_ItemCount()
    }

    /**
     * Gets the first item in a group of selected items.
     * @returns {IRawElementProviderSimple} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iselectionprovider2-get_firstselecteditem
     */
    get_FirstSelectedItem() {
        result := ComCall(6, this, "ptr*", &retVal := 0, "HRESULT")
        return IRawElementProviderSimple(retVal)
    }

    /**
     * Gets the last item in a group of selected items.
     * @returns {IRawElementProviderSimple} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iselectionprovider2-get_lastselecteditem
     */
    get_LastSelectedItem() {
        result := ComCall(7, this, "ptr*", &retVal := 0, "HRESULT")
        return IRawElementProviderSimple(retVal)
    }

    /**
     * Gets the currently selected item.
     * @returns {IRawElementProviderSimple} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iselectionprovider2-get_currentselecteditem
     */
    get_CurrentSelectedItem() {
        result := ComCall(8, this, "ptr*", &retVal := 0, "HRESULT")
        return IRawElementProviderSimple(retVal)
    }

    /**
     * Gets the number of selected items.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iselectionprovider2-get_itemcount
     */
    get_ItemCount() {
        result := ComCall(9, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    Query(iid) {
        if (ISelectionProvider2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_FirstSelectedItem := CallbackCreate(GetMethod(implObj, "get_FirstSelectedItem"), flags, 2)
        this.vtbl.get_LastSelectedItem := CallbackCreate(GetMethod(implObj, "get_LastSelectedItem"), flags, 2)
        this.vtbl.get_CurrentSelectedItem := CallbackCreate(GetMethod(implObj, "get_CurrentSelectedItem"), flags, 2)
        this.vtbl.get_ItemCount := CallbackCreate(GetMethod(implObj, "get_ItemCount"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_FirstSelectedItem)
        CallbackFree(this.vtbl.get_LastSelectedItem)
        CallbackFree(this.vtbl.get_CurrentSelectedItem)
        CallbackFree(this.vtbl.get_ItemCount)
    }
}

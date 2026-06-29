#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRawElementProviderSimple.ahk" { IRawElementProviderSimple }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to individual child controls of containers that implement IGridProvider.
 * @remarks
 * Implemented on a UI Automation provider that must support the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementinggriditem">GridItem</a> <i>control pattern</i>.
 *    			
 * 
 * Controls that implement <b>IGridItemProvider</b> can typically be traversed 
 *             (that is, a UI Automation client can move to adjacent controls) by using the keyboard.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-igriditemprovider
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IGridItemProvider extends IUnknown {
    /**
     * The interface identifier for IGridItemProvider
     * @type {Guid}
     */
    static IID := Guid("{d02541f1-fb81-4d64-ae32-f520f8a6dbd1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGridItemProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_Row            : IntPtr
        get_Column         : IntPtr
        get_RowSpan        : IntPtr
        get_ColumnSpan     : IntPtr
        get_ContainingGrid : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGridItemProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Row {
        get => this.get_Row()
    }

    /**
     * @type {Integer} 
     */
    Column {
        get => this.get_Column()
    }

    /**
     * @type {Integer} 
     */
    RowSpan {
        get => this.get_RowSpan()
    }

    /**
     * @type {Integer} 
     */
    ColumnSpan {
        get => this.get_ColumnSpan()
    }

    /**
     * @type {IRawElementProviderSimple} 
     */
    ContainingGrid {
        get => this.get_ContainingGrid()
    }

    /**
     * Specifies the ordinal number of the row that contains this cell or item.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-igriditemprovider-get_row
     */
    get_Row() {
        result := ComCall(3, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Specifies the ordinal number of the column that contains this cell or item.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-igriditemprovider-get_column
     */
    get_Column() {
        result := ComCall(4, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Specifies the number of rows spanned by this cell or item.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-igriditemprovider-get_rowspan
     */
    get_RowSpan() {
        result := ComCall(5, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Specifies the number of columns spanned by this cell or item.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-igriditemprovider-get_columnspan
     */
    get_ColumnSpan() {
        result := ComCall(6, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Specifies the UI Automation provider that implements IGridProvider and represents the container of this cell or item.
     * @returns {IRawElementProviderSimple} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-igriditemprovider-get_containinggrid
     */
    get_ContainingGrid() {
        result := ComCall(7, this, "ptr*", &pRetVal := 0, "HRESULT")
        return IRawElementProviderSimple(pRetVal)
    }

    Query(iid) {
        if (IGridItemProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Row := CallbackCreate(GetMethod(implObj, "get_Row"), flags, 2)
        this.vtbl.get_Column := CallbackCreate(GetMethod(implObj, "get_Column"), flags, 2)
        this.vtbl.get_RowSpan := CallbackCreate(GetMethod(implObj, "get_RowSpan"), flags, 2)
        this.vtbl.get_ColumnSpan := CallbackCreate(GetMethod(implObj, "get_ColumnSpan"), flags, 2)
        this.vtbl.get_ContainingGrid := CallbackCreate(GetMethod(implObj, "get_ContainingGrid"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Row)
        CallbackFree(this.vtbl.get_Column)
        CallbackFree(this.vtbl.get_RowSpan)
        CallbackFree(this.vtbl.get_ColumnSpan)
        CallbackFree(this.vtbl.get_ContainingGrid)
    }
}

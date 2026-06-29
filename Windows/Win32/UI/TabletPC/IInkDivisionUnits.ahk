#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IInkDivisionUnit.ahk" { IInkDivisionUnit }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Contains a collection of IInkDivisionUnit objects that are contained in an IInkDivisionResult object.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut15/nf-msinkaut15-iinkdivisionresult-resultbytype">ResultByType</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut15/nn-msinkaut15-iinkdivisionresult">IInkDivisionResult</a> object returns the requested structural elements of the analysis results in a <b>DivisionUnits</b> collection.
 * 
 * For more information about collections in Automation, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
 * 
 * If you define a class that implements this interface, the new class will not interact correctly with the Tablet PC application programming interfaces (APIs).
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut15/nn-msinkaut15-iinkdivisionunits
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct IInkDivisionUnits extends IDispatch {
    /**
     * The interface identifier for IInkDivisionUnits
     * @type {Guid}
     */
    static IID := Guid("{1bb5ddc2-31cc-4135-ab82-2c66c9f00c41}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInkDivisionUnits interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Count    : IntPtr
        get__NewEnum : IntPtr
        Item         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInkDivisionUnits.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * Gets the number of objects or collections contained in a collection. (IInkDivisionUnits.get_Count)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut15/nf-msinkaut15-iinkdivisionunits-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &Count := 0, "HRESULT")
        return Count
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &_NewEnum := 0, "HRESULT")
        return IUnknown(_NewEnum)
    }

    /**
     * Retrieves the IInkDivisionUnit object at the specified index within the IInkDivisionUnits collection.
     * @remarks
     * An error occurs if the index doesn't match any existing member of the collection.
     * @param {Integer} Index The zero-based index of the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut15/nn-msinkaut15-iinkdivisionunit">IInkDivisionUnit</a> object to get.
     * @returns {IInkDivisionUnit} When this method returns, contains a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut15/nn-msinkaut15-iinkdivisionunit">IInkDivisionUnit</a> object at the specified index within the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut15/nn-msinkaut15-iinkdivisionunits">IInkDivisionUnits</a> collection.
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut15/nf-msinkaut15-iinkdivisionunits-item
     */
    Item(Index) {
        result := ComCall(9, this, "int", Index, "ptr*", &InkDivisionUnit := 0, "HRESULT")
        return IInkDivisionUnit(InkDivisionUnit)
    }

    Query(iid) {
        if (IInkDivisionUnits.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.Item := CallbackCreate(GetMethod(implObj, "Item"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.get__NewEnum)
        CallbackFree(this.vtbl.Item)
    }
}

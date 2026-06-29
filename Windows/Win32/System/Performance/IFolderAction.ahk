#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\FolderActionSteps.ahk" { FolderActionSteps }

/**
 * Specifies the actions that the data manager is to take on each folder under the data collector set's root path if both conditions (age and size) are met. To get this interface, call the IFolderActionCollection::CreateFolderAction method.
 * @remarks
 * To create the object from a script, use the Pla.FolderAction program identifier.
 * 
 * For an example that shows the XML that you can use to initialize this object if you call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-setxml">IDataCollectorSet::SetXml</a> method, see the Remarks section of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-idatacollectorset">IDataCollectorSet</a>.  When you specify the XML to create the object, you can specify only the elements for the properties that you want to set. If you do not specify a property, PLA provides a default value. When you retrieve the XML for the set, the XML includes all elements.
 * @see https://learn.microsoft.com/windows/win32/api/pla/nn-pla-ifolderaction
 * @namespace Windows.Win32.System.Performance
 */
export default struct IFolderAction extends IDispatch {
    /**
     * The interface identifier for IFolderAction
     * @type {Guid}
     */
    static IID := Guid("{03837543-098b-11d8-9414-505054503030}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFolderAction interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Age       : IntPtr
        put_Age       : IntPtr
        get_Size      : IntPtr
        put_Size      : IntPtr
        get_Actions   : IntPtr
        put_Actions   : IntPtr
        get_SendCabTo : IntPtr
        put_SendCabTo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFolderAction.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Age {
        get => this.get_Age()
        set => this.put_Age(value)
    }

    /**
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
        set => this.put_Size(value)
    }

    /**
     * @type {FolderActionSteps} 
     */
    Actions {
        get => this.get_Actions()
        set => this.put_Actions(value)
    }

    /**
     * @type {BSTR} 
     */
    SendCabTo {
        get => this.get_SendCabTo()
        set => this.put_SendCabTo(value)
    }

    /**
     * Retrieves or sets the interval to wait between applying the actions. (Get)
     * @remarks
     * The time is determined by the age of the folder.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ifolderaction-get_age
     */
    get_Age() {
        result := ComCall(7, this, "uint*", &pulAge := 0, "HRESULT")
        return pulAge
    }

    /**
     * Retrieves or sets the interval to wait between applying the actions. (Put)
     * @remarks
     * The time is determined by the age of the folder.
     * @param {Integer} ulAge 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ifolderaction-put_age
     */
    put_Age(ulAge) {
        result := ComCall(8, this, "uint", ulAge, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the minimum folder size that, when exceeded, initiates the actions. (Get)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ifolderaction-get_size
     */
    get_Size() {
        result := ComCall(9, this, "uint*", &pulAge := 0, "HRESULT")
        return pulAge
    }

    /**
     * Retrieves or sets the minimum folder size that, when exceeded, initiates the actions. (Put)
     * @param {Integer} ulAge 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ifolderaction-put_size
     */
    put_Size(ulAge) {
        result := ComCall(10, this, "uint", ulAge, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the actions that the data manager is to take if both conditions (age and size) are met. (Get)
     * @returns {FolderActionSteps} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ifolderaction-get_actions
     */
    get_Actions() {
        result := ComCall(11, this, "int*", &Steps := 0, "HRESULT")
        return Steps
    }

    /**
     * Retrieves or sets the actions that the data manager is to take if both conditions (age and size) are met. (Put)
     * @param {FolderActionSteps} Steps 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ifolderaction-put_actions
     */
    put_Actions(Steps) {
        result := ComCall(12, this, FolderActionSteps, Steps, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the destination of the cabinet file if the action is to send a cabinet file. (Get)
     * @remarks
     * The data manager does not fail if it is not able to send the file.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ifolderaction-get_sendcabto
     */
    get_SendCabTo() {
        pbstrDestination := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, pbstrDestination, "HRESULT")
        return pbstrDestination
    }

    /**
     * Retrieves or sets the destination of the cabinet file if the action is to send a cabinet file. (Put)
     * @remarks
     * The data manager does not fail if it is not able to send the file.
     * @param {BSTR} bstrDestination 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ifolderaction-put_sendcabto
     */
    put_SendCabTo(bstrDestination) {
        bstrDestination := bstrDestination is String ? BSTR.Alloc(bstrDestination).Value : bstrDestination

        result := ComCall(14, this, BSTR, bstrDestination, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFolderAction.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Age := CallbackCreate(GetMethod(implObj, "get_Age"), flags, 2)
        this.vtbl.put_Age := CallbackCreate(GetMethod(implObj, "put_Age"), flags, 2)
        this.vtbl.get_Size := CallbackCreate(GetMethod(implObj, "get_Size"), flags, 2)
        this.vtbl.put_Size := CallbackCreate(GetMethod(implObj, "put_Size"), flags, 2)
        this.vtbl.get_Actions := CallbackCreate(GetMethod(implObj, "get_Actions"), flags, 2)
        this.vtbl.put_Actions := CallbackCreate(GetMethod(implObj, "put_Actions"), flags, 2)
        this.vtbl.get_SendCabTo := CallbackCreate(GetMethod(implObj, "get_SendCabTo"), flags, 2)
        this.vtbl.put_SendCabTo := CallbackCreate(GetMethod(implObj, "put_SendCabTo"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Age)
        CallbackFree(this.vtbl.put_Age)
        CallbackFree(this.vtbl.get_Size)
        CallbackFree(this.vtbl.put_Size)
        CallbackFree(this.vtbl.get_Actions)
        CallbackFree(this.vtbl.put_Actions)
        CallbackFree(this.vtbl.get_SendCabTo)
        CallbackFree(this.vtbl.put_SendCabTo)
    }
}

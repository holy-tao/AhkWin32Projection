#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPrinterScriptablePropertyBag.ahk" { IPrinterScriptablePropertyBag }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrinterScriptContext extends IDispatch {
    /**
     * The interface identifier for IPrinterScriptContext
     * @type {Guid}
     */
    static IID := Guid("{066acbca-8881-49c9-bb98-fae16b4889e1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrinterScriptContext interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_DriverProperties : IntPtr
        get_QueueProperties  : IntPtr
        get_UserProperties   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrinterScriptContext.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IPrinterScriptablePropertyBag} 
     */
    DriverProperties {
        get => this.get_DriverProperties()
    }

    /**
     * @type {IPrinterScriptablePropertyBag} 
     */
    QueueProperties {
        get => this.get_QueueProperties()
    }

    /**
     * @type {IPrinterScriptablePropertyBag} 
     */
    UserProperties {
        get => this.get_UserProperties()
    }

    /**
     * 
     * @returns {IPrinterScriptablePropertyBag} 
     */
    get_DriverProperties() {
        result := ComCall(7, this, "ptr*", &ppPropertyBag := 0, "HRESULT")
        return IPrinterScriptablePropertyBag(ppPropertyBag)
    }

    /**
     * 
     * @returns {IPrinterScriptablePropertyBag} 
     */
    get_QueueProperties() {
        result := ComCall(8, this, "ptr*", &ppPropertyBag := 0, "HRESULT")
        return IPrinterScriptablePropertyBag(ppPropertyBag)
    }

    /**
     * 
     * @returns {IPrinterScriptablePropertyBag} 
     */
    get_UserProperties() {
        result := ComCall(9, this, "ptr*", &ppPropertyBag := 0, "HRESULT")
        return IPrinterScriptablePropertyBag(ppPropertyBag)
    }

    Query(iid) {
        if (IPrinterScriptContext.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_DriverProperties := CallbackCreate(GetMethod(implObj, "get_DriverProperties"), flags, 2)
        this.vtbl.get_QueueProperties := CallbackCreate(GetMethod(implObj, "get_QueueProperties"), flags, 2)
        this.vtbl.get_UserProperties := CallbackCreate(GetMethod(implObj, "get_UserProperties"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_DriverProperties)
        CallbackFree(this.vtbl.get_QueueProperties)
        CallbackFree(this.vtbl.get_UserProperties)
    }
}

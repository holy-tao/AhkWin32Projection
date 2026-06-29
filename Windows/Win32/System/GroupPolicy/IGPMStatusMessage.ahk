#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IGPMStatusMessage interface contains property methods that retrieve various properties of status messages related to GPO operations.
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nn-gpmgmt-igpmstatusmessage
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct IGPMStatusMessage extends IDispatch {
    /**
     * The interface identifier for IGPMStatusMessage
     * @type {Guid}
     */
    static IID := Guid("{8496c22f-f3de-4a1f-8f58-603caaa93d7b}")

    /**
     * The class identifier for GPMStatusMessage
     * @type {Guid}
     */
    static CLSID := Guid("{4b77cc94-d255-409b-bc62-370881715a19}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGPMStatusMessage interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_ObjectPath    : IntPtr
        ErrorCode         : IntPtr
        get_ExtensionName : IntPtr
        get_SettingsName  : IntPtr
        OperationCode     : IntPtr
        get_Message       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGPMStatusMessage.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    ObjectPath {
        get => this.get_ObjectPath()
    }

    /**
     * @type {BSTR} 
     */
    ExtensionName {
        get => this.get_ExtensionName()
    }

    /**
     * @type {BSTR} 
     */
    SettingsName {
        get => this.get_SettingsName()
    }

    /**
     * @type {BSTR} 
     */
    Message {
        get => this.get_Message()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ObjectPath() {
        pVal := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Returns the error that occurred during the GPMC operation.
     * @returns {HRESULT} <h3>JScript</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * 
     * <h3>VB</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmstatusmessage-errorcode
     */
    ErrorCode() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ExtensionName() {
        pVal := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_SettingsName() {
        pVal := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Returns a code related to the GPMC operation.
     * @returns {HRESULT} <h3>JScript</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * 
     * <h3>VB</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmstatusmessage-operationcode
     */
    OperationCode() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Message() {
        pVal := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    Query(iid) {
        if (IGPMStatusMessage.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ObjectPath := CallbackCreate(GetMethod(implObj, "get_ObjectPath"), flags, 2)
        this.vtbl.ErrorCode := CallbackCreate(GetMethod(implObj, "ErrorCode"), flags, 1)
        this.vtbl.get_ExtensionName := CallbackCreate(GetMethod(implObj, "get_ExtensionName"), flags, 2)
        this.vtbl.get_SettingsName := CallbackCreate(GetMethod(implObj, "get_SettingsName"), flags, 2)
        this.vtbl.OperationCode := CallbackCreate(GetMethod(implObj, "OperationCode"), flags, 1)
        this.vtbl.get_Message := CallbackCreate(GetMethod(implObj, "get_Message"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ObjectPath)
        CallbackFree(this.vtbl.ErrorCode)
        CallbackFree(this.vtbl.get_ExtensionName)
        CallbackFree(this.vtbl.get_SettingsName)
        CallbackFree(this.vtbl.OperationCode)
        CallbackFree(this.vtbl.get_Message)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISWbemObject.ahk" { ISWbemObject }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\ISWbemServices.ahk" { ISWbemServices }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct IWMIExtension extends IDispatch {
    /**
     * The interface identifier for IWMIExtension
     * @type {Guid}
     */
    static IID := Guid("{adc1f06e-5c7e-11d2-8b74-00104b2afb41}")

    /**
     * The class identifier for WMIExtension
     * @type {Guid}
     */
    static CLSID := Guid("{f0975afe-5c7f-11d2-8b74-00104b2afb41}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMIExtension interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_WMIObjectPath : IntPtr
        GetWMIObject      : IntPtr
        GetWMIServices    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMIExtension.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    WMIObjectPath {
        get => this.get_WMIObjectPath()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_WMIObjectPath() {
        strWMIObjectPath := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, strWMIObjectPath, "HRESULT")
        return strWMIObjectPath
    }

    /**
     * 
     * @returns {ISWbemObject} 
     */
    GetWMIObject() {
        result := ComCall(8, this, "ptr*", &objWMIObject := 0, "HRESULT")
        return ISWbemObject(objWMIObject)
    }

    /**
     * 
     * @returns {ISWbemServices} 
     */
    GetWMIServices() {
        result := ComCall(9, this, "ptr*", &objWMIServices := 0, "HRESULT")
        return ISWbemServices(objWMIServices)
    }

    Query(iid) {
        if (IWMIExtension.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_WMIObjectPath := CallbackCreate(GetMethod(implObj, "get_WMIObjectPath"), flags, 2)
        this.vtbl.GetWMIObject := CallbackCreate(GetMethod(implObj, "GetWMIObject"), flags, 2)
        this.vtbl.GetWMIServices := CallbackCreate(GetMethod(implObj, "GetWMIServices"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_WMIObjectPath)
        CallbackFree(this.vtbl.GetWMIObject)
        CallbackFree(this.vtbl.GetWMIServices)
    }
}

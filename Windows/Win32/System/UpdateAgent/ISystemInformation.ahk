#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Contains information about the specified computer. This information is relevant to the Windows Update Agent (WUA).
 * @remarks
 * You can create an instance of this interface by using the SystemInformation coclass. Use the Microsoft.Update.SystemInfo program identifier to create the object.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-isysteminformation
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct ISystemInformation extends IDispatch {
    /**
     * The interface identifier for ISystemInformation
     * @type {Guid}
     */
    static IID := Guid("{ade87bf7-7b56-4275-8fab-b9b0e591844b}")

    /**
     * The class identifier for SystemInformation
     * @type {Guid}
     */
    static CLSID := Guid("{c01b9ba0-bea7-41ba-b604-d0a36f469133}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISystemInformation interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_OemHardwareSupportLink : IntPtr
        get_RebootRequired         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISystemInformation.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    OemHardwareSupportLink {
        get => this.get_OemHardwareSupportLink()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    RebootRequired {
        get => this.get_RebootRequired()
    }

    /**
     * Gets a hyperlink to technical support information for OEM hardware.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-isysteminformation-get_oemhardwaresupportlink
     */
    get_OemHardwareSupportLink() {
        retval := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets a Boolean value that indicates whether a system restart is required to complete the installation or uninstallation of one or more updates.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-isysteminformation-get_rebootrequired
     */
    get_RebootRequired() {
        result := ComCall(8, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    Query(iid) {
        if (ISystemInformation.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_OemHardwareSupportLink := CallbackCreate(GetMethod(implObj, "get_OemHardwareSupportLink"), flags, 2)
        this.vtbl.get_RebootRequired := CallbackCreate(GetMethod(implObj, "get_RebootRequired"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_OemHardwareSupportLink)
        CallbackFree(this.vtbl.get_RebootRequired)
    }
}

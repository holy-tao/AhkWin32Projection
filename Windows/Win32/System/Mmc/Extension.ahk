#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\Extensions.ahk" { Extensions }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Represents a single certificate extension.
 * @remarks
 * The **Extension** object has these types of members:
 * 
 * -   [Properties](#properties)
 * 
 * 
 * The **Extension** object cannot be created.
 * 
 * The **Extension** object is used by the [**Extensions**](extensions.md) collection object.
 * @see https://learn.microsoft.com/windows/win32/SecCrypto/extension
 * @namespace Windows.Win32.System.Mmc
 */
export default struct Extension extends IDispatch {
    /**
     * The interface identifier for Extension
     * @type {Guid}
     */
    static IID := Guid("{ad4d6ca6-912f-409b-a26e-7fd234aef542}")

    /**
     * The class identifier for Extension
     * @type {Guid}
     */
    static CLSID := Guid("{ad4d6ca6-912f-409b-a26e-7fd234aef542}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for Extension interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Name            : IntPtr
        get_Vendor          : IntPtr
        get_Version         : IntPtr
        get_Extensions      : IntPtr
        get_SnapinCLSID     : IntPtr
        EnableAllExtensions : IntPtr
        Enable              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := Extension.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {BSTR} 
     */
    Vendor {
        get => this.get_Vendor()
    }

    /**
     * @type {BSTR} 
     */
    Version {
        get => this.get_Version()
    }

    /**
     * @type {Extensions} 
     */
    Extensions {
        get => this.get_Extensions()
    }

    /**
     * @type {BSTR} 
     */
    SnapinCLSID {
        get => this.get_SnapinCLSID()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        Name := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, Name, "HRESULT")
        return Name
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Vendor() {
        Vendor := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, Vendor, "HRESULT")
        return Vendor
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Version() {
        _Version := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, _Version, "HRESULT")
        return _Version
    }

    /**
     * 
     * @returns {Extensions} 
     */
    get_Extensions() {
        result := ComCall(10, this, "ptr*", &_Extensions := 0, "HRESULT")
        return Extensions(_Extensions)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_SnapinCLSID() {
        SnapinCLSID := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, SnapinCLSID, "HRESULT")
        return SnapinCLSID
    }

    /**
     * 
     * @param {BOOL} Enable 
     * @returns {HRESULT} 
     */
    EnableAllExtensions(Enable) {
        result := ComCall(12, this, BOOL, Enable, "HRESULT")
        return result
    }

    /**
     * Enables monitoring on a particular drive.
     * @remarks
     * The **Enable** method does not wait for monitoring to be enabled completely before it returns, because this could take a while. Instead, it returns immediately after starting the System Restore service and filter driver.
     * 
     * To enable System Restore on a non-system drive, you must first enable System Restore on the system drive.
     * 
     * This method fails in safe mode.
     * @param {BOOL} Enable 
     * @returns {HRESULT} If the method succeeds, the return value is S\_OK. Otherwise, the method returns one of the COM error codes defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/sr/enable-systemrestore
     */
    Enable(Enable) {
        result := ComCall(13, this, BOOL, Enable, "HRESULT")
        return result
    }

    Query(iid) {
        if (Extension.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_Vendor := CallbackCreate(GetMethod(implObj, "get_Vendor"), flags, 2)
        this.vtbl.get_Version := CallbackCreate(GetMethod(implObj, "get_Version"), flags, 2)
        this.vtbl.get_Extensions := CallbackCreate(GetMethod(implObj, "get_Extensions"), flags, 2)
        this.vtbl.get_SnapinCLSID := CallbackCreate(GetMethod(implObj, "get_SnapinCLSID"), flags, 2)
        this.vtbl.EnableAllExtensions := CallbackCreate(GetMethod(implObj, "EnableAllExtensions"), flags, 2)
        this.vtbl.Enable := CallbackCreate(GetMethod(implObj, "Enable"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_Vendor)
        CallbackFree(this.vtbl.get_Version)
        CallbackFree(this.vtbl.get_Extensions)
        CallbackFree(this.vtbl.get_SnapinCLSID)
        CallbackFree(this.vtbl.EnableAllExtensions)
        CallbackFree(this.vtbl.Enable)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\Extensions.ahk" { Extensions }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\Properties.ahk" { Properties }

/**
 * @namespace Windows.Win32.System.Mmc
 */
export default struct SnapIn extends IDispatch {
    /**
     * The interface identifier for SnapIn
     * @type {Guid}
     */
    static IID := Guid("{3be910f6-3459-49c6-a1bb-41e6be9df3ea}")

    /**
     * The class identifier for SnapIn
     * @type {Guid}
     */
    static CLSID := Guid("{3be910f6-3459-49c6-a1bb-41e6be9df3ea}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for SnapIn interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Name            : IntPtr
        get_Vendor          : IntPtr
        get_Version         : IntPtr
        get_Extensions      : IntPtr
        get_SnapinCLSID     : IntPtr
        get_Properties      : IntPtr
        EnableAllExtensions : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := SnapIn.Vtbl()
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
     * @type {Properties} 
     */
    Properties {
        get => this.get_Properties()
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
     * @returns {Properties} 
     */
    get_Properties() {
        result := ComCall(12, this, "ptr*", &_Properties := 0, "HRESULT")
        return Properties(_Properties)
    }

    /**
     * 
     * @param {BOOL} Enable 
     * @returns {HRESULT} 
     */
    EnableAllExtensions(Enable) {
        result := ComCall(13, this, BOOL, Enable, "HRESULT")
        return result
    }

    Query(iid) {
        if (SnapIn.IID.Equals(iid)) {
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
        this.vtbl.get_Properties := CallbackCreate(GetMethod(implObj, "get_Properties"), flags, 2)
        this.vtbl.EnableAllExtensions := CallbackCreate(GetMethod(implObj, "EnableAllExtensions"), flags, 2)
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
        CallbackFree(this.vtbl.get_Properties)
        CallbackFree(this.vtbl.EnableAllExtensions)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct IProvisioningProfileWireless extends IUnknown {
    /**
     * The interface identifier for IProvisioningProfileWireless
     * @type {Guid}
     */
    static IID := Guid("{c96fbd51-24dd-11d8-89fb-00904b2ea9c6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IProvisioningProfileWireless interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateProfile : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IProvisioningProfileWireless.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a new user profile.
     * @remarks
     * The caller must have administrator privileges to call this function.
     * @param {BSTR} bstrXMLWirelessConfigProfile 
     * @param {BSTR} bstrXMLConnectionConfigProfile 
     * @param {Pointer<Guid>} pAdapterInstanceGuid 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-createprofile
     */
    CreateProfile(bstrXMLWirelessConfigProfile, bstrXMLConnectionConfigProfile, pAdapterInstanceGuid) {
        bstrXMLWirelessConfigProfile := bstrXMLWirelessConfigProfile is String ? BSTR.Alloc(bstrXMLWirelessConfigProfile).Value : bstrXMLWirelessConfigProfile
        bstrXMLConnectionConfigProfile := bstrXMLConnectionConfigProfile is String ? BSTR.Alloc(bstrXMLConnectionConfigProfile).Value : bstrXMLConnectionConfigProfile

        result := ComCall(3, this, BSTR, bstrXMLWirelessConfigProfile, BSTR, bstrXMLConnectionConfigProfile, Guid.Ptr, pAdapterInstanceGuid, "uint*", &pulStatus := 0, "HRESULT")
        return pulStatus
    }

    Query(iid) {
        if (IProvisioningProfileWireless.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateProfile := CallbackCreate(GetMethod(implObj, "CreateProfile"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateProfile)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IETFilterConfig interface configures the Encrypter/Tagger filter. Most applications will not have to use this interface.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IETFilterConfig)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/encdec/nn-encdec-ietfilterconfig
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IETFilterConfig extends IUnknown {
    /**
     * The interface identifier for IETFilterConfig
     * @type {Guid}
     */
    static IID := Guid("{c4c4c4d1-0049-4e2b-98fb-9537f6ce516d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IETFilterConfig interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        InitLicense            : IntPtr
        GetSecureChannelObject : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IETFilterConfig.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The InitLicense method initializes an encryption license.
     * @param {Integer} LicenseId Identifies the license.
     * @returns {HRESULT} Returns an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api/encdec/nf-encdec-ietfilterconfig-initlicense
     */
    InitLicense(LicenseId) {
        result := ComCall(3, this, "int", LicenseId, "HRESULT")
        return result
    }

    /**
     * This topic applies to Windows XP Service Pack 1 or later.
     * @remarks
     * If the method succeeds, the caller must release the <b>IUnknown</b> interface.
     * @returns {IUnknown} Receives a pointer to the secure channel object's <b>IUnknown</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/encdec/nf-encdec-ietfilterconfig-getsecurechannelobject
     */
    GetSecureChannelObject() {
        result := ComCall(4, this, "ptr*", &ppUnkDRMSecureChannel := 0, "HRESULT")
        return IUnknown(ppUnkDRMSecureChannel)
    }

    Query(iid) {
        if (IETFilterConfig.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InitLicense := CallbackCreate(GetMethod(implObj, "InitLicense"), flags, 2)
        this.vtbl.GetSecureChannelObject := CallbackCreate(GetMethod(implObj, "GetSecureChannelObject"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InitLicense)
        CallbackFree(this.vtbl.GetSecureChannelObject)
    }
}

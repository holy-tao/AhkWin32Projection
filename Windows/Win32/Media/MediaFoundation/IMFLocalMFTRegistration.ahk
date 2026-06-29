#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\MFT_REGISTRATION_INFO.ahk" { MFT_REGISTRATION_INFO }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Registers Media Foundation transforms (MFTs) in the caller's process.
 * @remarks
 * This interface requires the Media Session. If you are not using the Media Session for playback, call one of the following functions instead:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftregisterlocal">MFTRegisterLocal</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftregisterlocalbyclsid">MFTRegisterLocalByCLSID</a>
 * </li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imflocalmftregistration
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFLocalMFTRegistration extends IUnknown {
    /**
     * The interface identifier for IMFLocalMFTRegistration
     * @type {Guid}
     */
    static IID := Guid("{149c4d73-b4be-4f8d-8b87-079e926b6add}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFLocalMFTRegistration interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RegisterMFTs : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFLocalMFTRegistration.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Registers one or more Media Foundation transforms (MFTs) in the caller's process.
     * @remarks
     * This method is similar to the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftregisterlocalbyclsid">MFTRegisterLocalByCLSID</a> function. It registers one or more MFTs in the caller's process. These MFTs can be enumerated by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftenumex">MFTEnumEx</a> function with the <b>MFT_ENUM_FLAG_LOCALMFT</b> flag.
     * 
     * Unlike <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftregisterlocalbyclsid">MFTRegisterLocalByCLSID</a>, however, this method also makes the MFT available in the Protected Media Path (PMP) process, and is therefore useful if you are using the Media Session inside the PMP. For more information, see the following topics:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfcreatepmpmediasession">MFCreatePMPMediaSession</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/protected-media-path">Protected Media Path</a>
     * </li>
     * </ul>
     * @param {Pointer<MFT_REGISTRATION_INFO>} pMFTs A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ns-mfidl-mft_registration_info">MFT_REGISTRATION_INFO</a> structures.
     * @param {Integer} cMFTs The number of elements in the <i>pMFTs</i> array.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imflocalmftregistration-registermfts
     */
    RegisterMFTs(pMFTs, cMFTs) {
        result := ComCall(3, this, MFT_REGISTRATION_INFO.Ptr, pMFTs, "uint", cMFTs, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFLocalMFTRegistration.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RegisterMFTs := CallbackCreate(GetMethod(implObj, "RegisterMFTs"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RegisterMFTs)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Implemented by components that provide input trust authorities (ITAs). This interface is used to get the ITA for each of the component's streams.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imftrustedinput
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFTrustedInput extends IUnknown {
    /**
     * The interface identifier for IMFTrustedInput
     * @type {Guid}
     */
    static IID := Guid("{542612c4-a1b8-4632-b521-de11ea64a0b0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFTrustedInput interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetInputTrustAuthority : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFTrustedInput.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the input trust authority (ITA) for a specified stream.
     * @param {Integer} dwStreamID The stream identifier for which the ITA is being requested.
     * @param {Pointer<Guid>} riid The interface identifier (IID) of the interface being requested. Currently the only supported value is IID_IMFInputTrustAuthority.
     * @returns {IUnknown} Receives a pointer to the ITA's <b>IUnknown</b> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftrustedinput-getinputtrustauthority
     */
    GetInputTrustAuthority(dwStreamID, riid) {
        result := ComCall(3, this, "uint", dwStreamID, Guid.Ptr, riid, "ptr*", &ppunkObject := 0, "HRESULT")
        return IUnknown(ppunkObject)
    }

    Query(iid) {
        if (IMFTrustedInput.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetInputTrustAuthority := CallbackCreate(GetMethod(implObj, "GetInputTrustAuthority"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetInputTrustAuthority)
    }
}

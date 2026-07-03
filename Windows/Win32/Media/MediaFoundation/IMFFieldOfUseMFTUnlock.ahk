#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables an application to use a Media Foundation transform (MFT) that has restrictions on its use.
 * @remarks
 * If you register an MFT that requires unlocking, include the <b>MFT_ENUM_FLAG_FIELDOFUSE</b> flag when you call the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftregister">MFTRegister</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imffieldofusemftunlock
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFFieldOfUseMFTUnlock extends IUnknown {
    /**
     * The interface identifier for IMFFieldOfUseMFTUnlock
     * @type {Guid}
     */
    static IID := Guid("{508e71d3-ec66-4fc3-8775-b4b9ed6ba847}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFFieldOfUseMFTUnlock interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Unlock : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFFieldOfUseMFTUnlock.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Unlocks a Media Foundation transform (MFT) so that the application can use it.
     * @remarks
     * This method authenticates the caller, using a private communication channel between the MFT and the object that implements the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imffieldofusemftunlock">IMFFieldOfUseMFTUnlock</a> interface. The details of the communication depend entirely on the implementation.
     * @param {IUnknown} pUnkMFT A pointer to the <b>IUnknown</b> interface of the MFT.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imffieldofusemftunlock-unlock
     */
    Unlock(pUnkMFT) {
        result := ComCall(3, this, "ptr", pUnkMFT, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFFieldOfUseMFTUnlock.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Unlock := CallbackCreate(GetMethod(implObj, "Unlock"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Unlock)
    }
}

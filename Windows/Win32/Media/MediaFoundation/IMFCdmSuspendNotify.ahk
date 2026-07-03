#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Used to enable the client to notify the Content Decryption Module (CDM) when global resources should be brought into a consistent state prior to suspending.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nn-mfmediaengine-imfcdmsuspendnotify
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFCdmSuspendNotify extends IUnknown {
    /**
     * The interface identifier for IMFCdmSuspendNotify
     * @type {Guid}
     */
    static IID := Guid("{7a5645d2-43bd-47fd-87b7-dcd24cc7d692}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFCdmSuspendNotify interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Begin : IntPtr
        End   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFCdmSuspendNotify.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Indicates that the suspend process is starting and resources should be brought into a consistent state.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfcdmsuspendnotify-begin
     */
    Begin() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * The actual suspend is about to occur and no more calls will be made into the Content Decryption Module (CDM).
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfcdmsuspendnotify-end
     */
    End() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFCdmSuspendNotify.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Begin := CallbackCreate(GetMethod(implObj, "Begin"), flags, 1)
        this.vtbl.End := CallbackCreate(GetMethod(implObj, "End"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Begin)
        CallbackFree(this.vtbl.End)
    }
}

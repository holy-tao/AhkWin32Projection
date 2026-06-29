#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFPMPHostApp.ahk" { IMFPMPHostApp }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a mechanism for a media source to implement content protection functionality in a Windows Store apps.
 * @remarks
 * <b>When to implement:</b> 
 * A media source implements <b>IMFPMPClientApp</b> in order to implement content protection functionality for Windows Store apps.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfpmpclientapp
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFPMPClientApp extends IUnknown {
    /**
     * The interface identifier for IMFPMPClientApp
     * @type {Guid}
     */
    static IID := Guid("{c004f646-be2c-48f3-93a2-a0983eba1108}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFPMPClientApp interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetPMPHost : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFPMPClientApp.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets a pointer to the IMFPMPHostApp interface allowing a media source to create objects in the PMP process.
     * @param {IMFPMPHostApp} pPMPHost A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpmphostapp">IMFPMPHostApp</a> interface.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfpmpclientapp-setpmphost
     */
    SetPMPHost(pPMPHost) {
        result := ComCall(3, this, "ptr", pPMPHost, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFPMPClientApp.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetPMPHost := CallbackCreate(GetMethod(implObj, "SetPMPHost"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetPMPHost)
    }
}

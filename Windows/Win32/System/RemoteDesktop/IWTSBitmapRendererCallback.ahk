#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * A dynamic virtual channel plug-in implements this interface to be notified when the size of the rendering area changes.
 * @see https://learn.microsoft.com/windows/win32/api/tsvirtualchannels/nn-tsvirtualchannels-iwtsbitmaprenderercallback
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IWTSBitmapRendererCallback extends IUnknown {
    /**
     * The interface identifier for IWTSBitmapRendererCallback
     * @type {Guid}
     */
    static IID := Guid("{d782928e-fe4e-4e77-ae90-9cd0b3e3b353}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWTSBitmapRendererCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnTargetSizeChanged : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWTSBitmapRendererCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called when the size of the render target has changed.
     * @param {RECT} rcNewSize A <b>RECT</b> structure that contains the new size of the render target.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tsvirtualchannels/nf-tsvirtualchannels-iwtsbitmaprenderercallback-ontargetsizechanged
     */
    OnTargetSizeChanged(rcNewSize) {
        result := ComCall(3, this, RECT, rcNewSize, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWTSBitmapRendererCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnTargetSizeChanged := CallbackCreate(GetMethod(implObj, "OnTargetSizeChanged"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnTargetSizeChanged)
    }
}

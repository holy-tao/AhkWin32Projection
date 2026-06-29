#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFSourceReaderCallback.ahk" { IMFSourceReaderCallback }

/**
 * Extends the IMFSourceReaderCallback interface.
 * @remarks
 * This interface provides a mechanism for apps that use <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nn-mfreadwrite-imfsourcereader">IMFSourceReader</a> to receive asynchronous notifications when the transform chain is complete and the system is ready for use or when an asynchronous error occurs.
 * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nn-mfreadwrite-imfsourcereadercallback2
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFSourceReaderCallback2 extends IMFSourceReaderCallback {
    /**
     * The interface identifier for IMFSourceReaderCallback2
     * @type {Guid}
     */
    static IID := Guid("{cf839fe6-8c2a-4dd2-b6ea-c22d6961af05}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFSourceReaderCallback2 interfaces
    */
    struct Vtbl extends IMFSourceReaderCallback.Vtbl {
        OnTransformChange : IntPtr
        OnStreamError     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFSourceReaderCallback2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called when the transform chain in the IMFSourceReader is built or modified. (IMFSourceReaderCallback2.OnTransformChange)
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Currently, the source reader ignores the return value.
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsourcereadercallback2-ontransformchange
     */
    OnTransformChange() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * Called when an asynchronous error occurs with the IMFSourceReader.
     * @param {Integer} dwStreamIndex The index of the stream of the transform that raised the asynchronous error.
     * @param {HRESULT} hrStatus The error that occurred.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Currently, the source reader ignores the return value.
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsourcereadercallback2-onstreamerror
     */
    OnStreamError(dwStreamIndex, hrStatus) {
        result := ComCall(7, this, "uint", dwStreamIndex, "int", hrStatus, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFSourceReaderCallback2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnTransformChange := CallbackCreate(GetMethod(implObj, "OnTransformChange"), flags, 1)
        this.vtbl.OnStreamError := CallbackCreate(GetMethod(implObj, "OnStreamError"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnTransformChange)
        CallbackFree(this.vtbl.OnStreamError)
    }
}

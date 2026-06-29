#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Callback interface for the Microsoft Media Foundation sink writer.
 * @remarks
 * Set the callback pointer by setting the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-sink-writer-async-callback">MF_SINK_WRITER_ASYNC_CALLBACK</a> attribute when you first create the sink writer.
 * 
 * 
 * 
 * The callback methods can be called from any thread, so an object that implements this interface must be thread-safe.
 * 
 * This interface is available on Windows Vista if Platform Update Supplement for Windows Vista is installed.
 * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nn-mfreadwrite-imfsinkwritercallback
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFSinkWriterCallback extends IUnknown {
    /**
     * The interface identifier for IMFSinkWriterCallback
     * @type {Guid}
     */
    static IID := Guid("{666f76de-33d2-41b9-a458-29ed0a972c58}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFSinkWriterCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnFinalize : IntPtr
        OnMarker   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFSinkWriterCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called when the IMFSinkWriter::Finalize method completes.
     * @remarks
     * This interface is available on Windows Vista if Platform Update Supplement for Windows Vista is installed.
     * @param {HRESULT} hrStatus The status code for the <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsinkwriter-finalize">Finalize</a> operation. If the value is an error code, the output file might be invalid.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Currently, the sink writer ignores the return value.
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsinkwritercallback-onfinalize
     */
    OnFinalize(hrStatus) {
        result := ComCall(3, this, "int", hrStatus, "HRESULT")
        return result
    }

    /**
     * Called when the IMFSinkWriter::PlaceMarker method completes.
     * @remarks
     * This interface is available on Windows Vista if Platform Update Supplement for Windows Vista is installed.
     * @param {Integer} dwStreamIndex The zero-based index of the stream. This parameter equals the value of the <i>dwStreamIndex</i> parameter in the <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsinkwriter-placemarker">PlaceMarker</a> method.
     * @param {Pointer<Void>} pvContext The application-defined value that was given in the <i>pvContext</i> parameter in the <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsinkwriter-placemarker">PlaceMarker</a> method.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Currently, the sink writer ignores the return value.
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsinkwritercallback-onmarker
     */
    OnMarker(dwStreamIndex, pvContext) {
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "uint", dwStreamIndex, pvContextMarshal, pvContext, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFSinkWriterCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnFinalize := CallbackCreate(GetMethod(implObj, "OnFinalize"), flags, 2)
        this.vtbl.OnMarker := CallbackCreate(GetMethod(implObj, "OnMarker"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnFinalize)
        CallbackFree(this.vtbl.OnMarker)
    }
}

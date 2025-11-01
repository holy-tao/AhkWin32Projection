#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Callback interface for the Microsoft Media Foundation sink writer.
 * @remarks
 * 
  * Set the callback pointer by setting the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-sink-writer-async-callback">MF_SINK_WRITER_ASYNC_CALLBACK</a> attribute when you first create the sink writer.
  * 
  * 
  * 
  * The callback methods can be called from any thread, so an object that implements this interface must be thread-safe.
  * 
  * This interface is available on Windows Vista if Platform Update Supplement for Windows Vista is installed.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nn-mfreadwrite-imfsinkwritercallback
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSinkWriterCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFSinkWriterCallback
     * @type {Guid}
     */
    static IID => Guid("{666f76de-33d2-41b9-a458-29ed0a972c58}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnFinalize", "OnMarker"]

    /**
     * 
     * @param {HRESULT} hrStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsinkwritercallback-onfinalize
     */
    OnFinalize(hrStatus) {
        result := ComCall(3, this, "int", hrStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Pointer<Void>} pvContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsinkwritercallback-onmarker
     */
    OnMarker(dwStreamIndex, pvContext) {
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "uint", dwStreamIndex, pvContextMarshal, pvContext, "HRESULT")
        return result
    }
}

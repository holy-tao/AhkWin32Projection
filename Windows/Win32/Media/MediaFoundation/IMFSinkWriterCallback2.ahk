#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFSinkWriterCallback.ahk

/**
 * Extends the IMFSinkWriterCallback interface.
 * @remarks
 * 
  * This interface provides a mechanism for apps that use <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nn-mfreadwrite-imfsinkwriter">IMFSinkWriter</a> to receive asynchronous notifications when the transform chain is complete and the system is ready for use or when an asynchronous error occurs.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nn-mfreadwrite-imfsinkwritercallback2
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSinkWriterCallback2 extends IMFSinkWriterCallback{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFSinkWriterCallback2
     * @type {Guid}
     */
    static IID => Guid("{2456bd58-c067-4513-84fe-8d0c88ffdc61}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnTransformChange", "OnStreamError"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsinkwritercallback2-ontransformchange
     */
    OnTransformChange() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {HRESULT} hrStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsinkwritercallback2-onstreamerror
     */
    OnStreamError(dwStreamIndex, hrStatus) {
        result := ComCall(6, this, "uint", dwStreamIndex, "int", hrStatus, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFSourceReaderCallback.ahk

/**
 * Extends the IMFSourceReaderCallback interface.
 * @remarks
 * 
 * This interface provides a mechanism for apps that use <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nn-mfreadwrite-imfsourcereader">IMFSourceReader</a> to receive asynchronous notifications when the transform chain is complete and the system is ready for use or when an asynchronous error occurs.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nn-mfreadwrite-imfsourcereadercallback2
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSourceReaderCallback2 extends IMFSourceReaderCallback{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFSourceReaderCallback2
     * @type {Guid}
     */
    static IID => Guid("{cf839fe6-8c2a-4dd2-b6ea-c22d6961af05}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnTransformChange", "OnStreamError"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsourcereadercallback2-ontransformchange
     */
    OnTransformChange() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {HRESULT} hrStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsourcereadercallback2-onstreamerror
     */
    OnStreamError(dwStreamIndex, hrStatus) {
        result := ComCall(7, this, "uint", dwStreamIndex, "int", hrStatus, "HRESULT")
        return result
    }
}

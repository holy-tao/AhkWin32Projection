#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFSinkWriter.ahk

/**
 * Extends the IMFSinkWriter interface.
 * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nn-mfreadwrite-imfsinkwriterex
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSinkWriterEx extends IMFSinkWriter{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFSinkWriterEx
     * @type {Guid}
     */
    static IID => Guid("{588d72ab-5bc1-496a-8714-b70617141b25}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTransformForStream"]

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Integer} dwTransformIndex 
     * @param {Pointer<Guid>} pGuidCategory 
     * @param {Pointer<IMFTransform>} ppTransform 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsinkwriterex-gettransformforstream
     */
    GetTransformForStream(dwStreamIndex, dwTransformIndex, pGuidCategory, ppTransform) {
        result := ComCall(14, this, "uint", dwStreamIndex, "uint", dwTransformIndex, "ptr", pGuidCategory, "ptr*", ppTransform, "HRESULT")
        return result
    }
}

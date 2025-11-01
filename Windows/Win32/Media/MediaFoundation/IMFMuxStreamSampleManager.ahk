#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides the ability to retrieve IMFSample objects for individual substreams within the output of a multiplexed media source.
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nn-mfobjects-imfmuxstreamsamplemanager
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMuxStreamSampleManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMuxStreamSampleManager
     * @type {Guid}
     */
    static IID => Guid("{74abbc19-b1cc-4e41-bb8b-9d9b86a8f6ca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStreamCount", "GetSample", "GetStreamConfiguration"]

    /**
     * 
     * @param {Pointer<Integer>} pdwMuxStreamCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmuxstreamsamplemanager-getstreamcount
     */
    GetStreamCount(pdwMuxStreamCount) {
        pdwMuxStreamCountMarshal := pdwMuxStreamCount is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwMuxStreamCountMarshal, pdwMuxStreamCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwMuxStreamIndex 
     * @param {Pointer<IMFSample>} ppSample 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmuxstreamsamplemanager-getsample
     */
    GetSample(dwMuxStreamIndex, ppSample) {
        result := ComCall(4, this, "uint", dwMuxStreamIndex, "ptr*", ppSample, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmuxstreamsamplemanager-getstreamconfiguration
     */
    GetStreamConfiguration() {
        result := ComCall(5, this, "uint")
        return result
    }
}

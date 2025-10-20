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
     * 
     * @param {Pointer<UInt32>} pdwMuxStreamCount 
     * @returns {HRESULT} 
     */
    GetStreamCount(pdwMuxStreamCount) {
        result := ComCall(3, this, "uint*", pdwMuxStreamCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwMuxStreamIndex 
     * @param {Pointer<IMFSample>} ppSample 
     * @returns {HRESULT} 
     */
    GetSample(dwMuxStreamIndex, ppSample) {
        result := ComCall(4, this, "uint", dwMuxStreamIndex, "ptr", ppSample, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetStreamConfiguration() {
        result := ComCall(5, this, "uint")
        return result
    }
}

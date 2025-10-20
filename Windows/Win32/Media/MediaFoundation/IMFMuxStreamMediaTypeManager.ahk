#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables the management of stream configurations for a multiplexed media source. A stream configuration defines a set of substreams that can be included the multiplexed output.
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nn-mfobjects-imfmuxstreammediatypemanager
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMuxStreamMediaTypeManager extends IUnknown{
    /**
     * The interface identifier for IMFMuxStreamMediaTypeManager
     * @type {Guid}
     */
    static IID => Guid("{505a2c72-42f7-4690-aeab-8f513d0ffdb8}")

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
     * @param {Pointer<IMFMediaType>} ppMediaType 
     * @returns {HRESULT} 
     */
    GetMediaType(dwMuxStreamIndex, ppMediaType) {
        result := ComCall(4, this, "uint", dwMuxStreamIndex, "ptr", ppMediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwCount 
     * @returns {HRESULT} 
     */
    GetStreamConfigurationCount(pdwCount) {
        result := ComCall(5, this, "uint*", pdwCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ullStreamMask 
     * @returns {HRESULT} 
     */
    AddStreamConfiguration(ullStreamMask) {
        result := ComCall(6, this, "uint", ullStreamMask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ullStreamMask 
     * @returns {HRESULT} 
     */
    RemoveStreamConfiguration(ullStreamMask) {
        result := ComCall(7, this, "uint", ullStreamMask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulIndex 
     * @param {Pointer<UInt64>} pullStreamMask 
     * @returns {HRESULT} 
     */
    GetStreamConfiguration(ulIndex, pullStreamMask) {
        result := ComCall(8, this, "uint", ulIndex, "uint*", pullStreamMask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

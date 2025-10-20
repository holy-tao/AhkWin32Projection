#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to the IMFAttributes of the substreams of a multiplexed media source.
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nn-mfobjects-imfmuxstreamattributesmanager
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMuxStreamAttributesManager extends IUnknown{
    /**
     * The interface identifier for IMFMuxStreamAttributesManager
     * @type {Guid}
     */
    static IID => Guid("{ce8bd576-e440-43b3-be34-1e53f565f7e8}")

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
     * @param {Pointer<IMFAttributes>} ppStreamAttributes 
     * @returns {HRESULT} 
     */
    GetAttributes(dwMuxStreamIndex, ppStreamAttributes) {
        result := ComCall(4, this, "uint", dwMuxStreamIndex, "ptr", ppStreamAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

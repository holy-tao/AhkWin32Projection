#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMDecoderCaps interface returns capabilities information from an MPEG decoder filter.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamdecodercaps
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMDecoderCaps extends IUnknown{
    /**
     * The interface identifier for IAMDecoderCaps
     * @type {Guid}
     */
    static IID => Guid("{c0dff467-d499-4986-972b-e1d9090fa941}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwCapIndex 
     * @param {Pointer<UInt32>} lpdwCap 
     * @returns {HRESULT} 
     */
    GetDecoderCaps(dwCapIndex, lpdwCap) {
        result := ComCall(3, this, "uint", dwCapIndex, "uint*", lpdwCap, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

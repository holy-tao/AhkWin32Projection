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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDecoderCaps"]

    /**
     * 
     * @param {Integer} dwCapIndex 
     * @param {Pointer<Integer>} lpdwCap 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamdecodercaps-getdecodercaps
     */
    GetDecoderCaps(dwCapIndex, lpdwCap) {
        result := ComCall(3, this, "uint", dwCapIndex, "uint*", lpdwCap, "HRESULT")
        return result
    }
}

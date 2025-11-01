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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStreamCount", "GetAttributes"]

    /**
     * 
     * @param {Pointer<Integer>} pdwMuxStreamCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmuxstreamattributesmanager-getstreamcount
     */
    GetStreamCount(pdwMuxStreamCount) {
        pdwMuxStreamCountMarshal := pdwMuxStreamCount is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwMuxStreamCountMarshal, pdwMuxStreamCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwMuxStreamIndex 
     * @param {Pointer<IMFAttributes>} ppStreamAttributes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfmuxstreamattributesmanager-getattributes
     */
    GetAttributes(dwMuxStreamIndex, ppStreamAttributes) {
        result := ComCall(4, this, "uint", dwMuxStreamIndex, "ptr*", ppStreamAttributes, "HRESULT")
        return result
    }
}

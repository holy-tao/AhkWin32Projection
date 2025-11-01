#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IImageDecodeEventSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IImageDecodeEventSink
     * @type {Guid}
     */
    static IID => Guid("{baa342a0-2ded-11d0-86f4-00a0c913f750}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSurface", "OnBeginDecode", "OnBitsComplete", "OnDecodeComplete", "OnPalette", "OnProgress"]

    /**
     * 
     * @param {Integer} nWidth 
     * @param {Integer} nHeight 
     * @param {Pointer<Guid>} bfid 
     * @param {Integer} nPasses 
     * @param {Integer} dwHints 
     * @param {Pointer<IUnknown>} ppSurface 
     * @returns {HRESULT} 
     */
    GetSurface(nWidth, nHeight, bfid, nPasses, dwHints, ppSurface) {
        result := ComCall(3, this, "int", nWidth, "int", nHeight, "ptr", bfid, "uint", nPasses, "uint", dwHints, "ptr*", ppSurface, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwEvents 
     * @param {Pointer<Integer>} pnFormats 
     * @param {Pointer<Pointer<Guid>>} ppFormats 
     * @returns {HRESULT} 
     */
    OnBeginDecode(pdwEvents, pnFormats, ppFormats) {
        pdwEventsMarshal := pdwEvents is VarRef ? "uint*" : "ptr"
        pnFormatsMarshal := pnFormats is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pdwEventsMarshal, pdwEvents, pnFormatsMarshal, pnFormats, "ptr*", ppFormats, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnBitsComplete() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} hrStatus 
     * @returns {HRESULT} 
     */
    OnDecodeComplete(hrStatus) {
        result := ComCall(6, this, "int", hrStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnPalette() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} pBounds 
     * @param {BOOL} bComplete 
     * @returns {HRESULT} 
     */
    OnProgress(pBounds, bComplete) {
        result := ComCall(8, this, "ptr", pBounds, "int", bComplete, "HRESULT")
        return result
    }
}

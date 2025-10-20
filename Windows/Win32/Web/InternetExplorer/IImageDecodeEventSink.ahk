#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IImageDecodeEventSink extends IUnknown{
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
        result := ComCall(3, this, "int", nWidth, "int", nHeight, "ptr", bfid, "uint", nPasses, "uint", dwHints, "ptr", ppSurface, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwEvents 
     * @param {Pointer<UInt32>} pnFormats 
     * @param {Pointer<Guid>} ppFormats 
     * @returns {HRESULT} 
     */
    OnBeginDecode(pdwEvents, pnFormats, ppFormats) {
        result := ComCall(4, this, "uint*", pdwEvents, "uint*", pnFormats, "ptr", ppFormats, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnBitsComplete() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HRESULT} hrStatus 
     * @returns {HRESULT} 
     */
    OnDecodeComplete(hrStatus) {
        result := ComCall(6, this, "int", hrStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnPalette() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} pBounds 
     * @param {BOOL} bComplete 
     * @returns {HRESULT} 
     */
    OnProgress(pBounds, bComplete) {
        result := ComCall(8, this, "ptr", pBounds, "int", bComplete, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

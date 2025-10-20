#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IWMFrameInterpProps extends IUnknown{
    /**
     * The interface identifier for IWMFrameInterpProps
     * @type {Guid}
     */
    static IID => Guid("{4c06bb9b-626c-4614-8329-cc6a21b93fa0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} lFrameRate 
     * @param {Integer} lScale 
     * @returns {HRESULT} 
     */
    SetFrameRateIn(lFrameRate, lScale) {
        result := ComCall(3, this, "int", lFrameRate, "int", lScale, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFrameRate 
     * @param {Integer} lScale 
     * @returns {HRESULT} 
     */
    SetFrameRateOut(lFrameRate, lScale) {
        result := ComCall(4, this, "int", lFrameRate, "int", lScale, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bFIEnabled 
     * @returns {HRESULT} 
     */
    SetFrameInterpEnabled(bFIEnabled) {
        result := ComCall(5, this, "int", bFIEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iComplexity 
     * @returns {HRESULT} 
     */
    SetComplexityLevel(iComplexity) {
        result := ComCall(6, this, "int", iComplexity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

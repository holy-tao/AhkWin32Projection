#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMixerPinConfig interface is exposed on the input pins of the Overlay Mixer filter and contains methods that manipulate video streams in various ways.
 * @see https://docs.microsoft.com/windows/win32/api//mpconfig/nn-mpconfig-imixerpinconfig
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMixerPinConfig extends IUnknown{
    /**
     * The interface identifier for IMixerPinConfig
     * @type {Guid}
     */
    static IID => Guid("{593cdde1-0759-11d1-9e69-00c04fd7c15b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwLeft 
     * @param {Integer} dwTop 
     * @param {Integer} dwRight 
     * @param {Integer} dwBottom 
     * @returns {HRESULT} 
     */
    SetRelativePosition(dwLeft, dwTop, dwRight, dwBottom) {
        result := ComCall(3, this, "uint", dwLeft, "uint", dwTop, "uint", dwRight, "uint", dwBottom, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwLeft 
     * @param {Pointer<UInt32>} pdwTop 
     * @param {Pointer<UInt32>} pdwRight 
     * @param {Pointer<UInt32>} pdwBottom 
     * @returns {HRESULT} 
     */
    GetRelativePosition(pdwLeft, pdwTop, pdwRight, pdwBottom) {
        result := ComCall(4, this, "uint*", pdwLeft, "uint*", pdwTop, "uint*", pdwRight, "uint*", pdwBottom, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwZOrder 
     * @returns {HRESULT} 
     */
    SetZOrder(dwZOrder) {
        result := ComCall(5, this, "uint", dwZOrder, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwZOrder 
     * @returns {HRESULT} 
     */
    GetZOrder(pdwZOrder) {
        result := ComCall(6, this, "uint*", pdwZOrder, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COLORKEY>} pColorKey 
     * @returns {HRESULT} 
     */
    SetColorKey(pColorKey) {
        result := ComCall(7, this, "ptr", pColorKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COLORKEY>} pColorKey 
     * @param {Pointer<UInt32>} pColor 
     * @returns {HRESULT} 
     */
    GetColorKey(pColorKey, pColor) {
        result := ComCall(8, this, "ptr", pColorKey, "uint*", pColor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwBlendingParameter 
     * @returns {HRESULT} 
     */
    SetBlendingParameter(dwBlendingParameter) {
        result := ComCall(9, this, "uint", dwBlendingParameter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwBlendingParameter 
     * @returns {HRESULT} 
     */
    GetBlendingParameter(pdwBlendingParameter) {
        result := ComCall(10, this, "uint*", pdwBlendingParameter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} amAspectRatioMode 
     * @returns {HRESULT} 
     */
    SetAspectRatioMode(amAspectRatioMode) {
        result := ComCall(11, this, "int", amAspectRatioMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pamAspectRatioMode 
     * @returns {HRESULT} 
     */
    GetAspectRatioMode(pamAspectRatioMode) {
        result := ComCall(12, this, "int*", pamAspectRatioMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bStreamTransparent 
     * @returns {HRESULT} 
     */
    SetStreamTransparent(bStreamTransparent) {
        result := ComCall(13, this, "int", bStreamTransparent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbStreamTransparent 
     * @returns {HRESULT} 
     */
    GetStreamTransparent(pbStreamTransparent) {
        result := ComCall(14, this, "ptr", pbStreamTransparent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetRelativePosition", "GetRelativePosition", "SetZOrder", "GetZOrder", "SetColorKey", "GetColorKey", "SetBlendingParameter", "GetBlendingParameter", "SetAspectRatioMode", "GetAspectRatioMode", "SetStreamTransparent", "GetStreamTransparent"]

    /**
     * 
     * @param {Integer} dwLeft 
     * @param {Integer} dwTop 
     * @param {Integer} dwRight 
     * @param {Integer} dwBottom 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpconfig/nf-mpconfig-imixerpinconfig-setrelativeposition
     */
    SetRelativePosition(dwLeft, dwTop, dwRight, dwBottom) {
        result := ComCall(3, this, "uint", dwLeft, "uint", dwTop, "uint", dwRight, "uint", dwBottom, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwLeft 
     * @param {Pointer<Integer>} pdwTop 
     * @param {Pointer<Integer>} pdwRight 
     * @param {Pointer<Integer>} pdwBottom 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpconfig/nf-mpconfig-imixerpinconfig-getrelativeposition
     */
    GetRelativePosition(pdwLeft, pdwTop, pdwRight, pdwBottom) {
        pdwLeftMarshal := pdwLeft is VarRef ? "uint*" : "ptr"
        pdwTopMarshal := pdwTop is VarRef ? "uint*" : "ptr"
        pdwRightMarshal := pdwRight is VarRef ? "uint*" : "ptr"
        pdwBottomMarshal := pdwBottom is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pdwLeftMarshal, pdwLeft, pdwTopMarshal, pdwTop, pdwRightMarshal, pdwRight, pdwBottomMarshal, pdwBottom, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwZOrder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpconfig/nf-mpconfig-imixerpinconfig-setzorder
     */
    SetZOrder(dwZOrder) {
        result := ComCall(5, this, "uint", dwZOrder, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwZOrder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpconfig/nf-mpconfig-imixerpinconfig-getzorder
     */
    GetZOrder(pdwZOrder) {
        pdwZOrderMarshal := pdwZOrder is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pdwZOrderMarshal, pdwZOrder, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COLORKEY>} pColorKey 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpconfig/nf-mpconfig-imixerpinconfig-setcolorkey
     */
    SetColorKey(pColorKey) {
        result := ComCall(7, this, "ptr", pColorKey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COLORKEY>} pColorKey 
     * @param {Pointer<Integer>} pColor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpconfig/nf-mpconfig-imixerpinconfig-getcolorkey
     */
    GetColorKey(pColorKey, pColor) {
        pColorMarshal := pColor is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "ptr", pColorKey, pColorMarshal, pColor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwBlendingParameter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpconfig/nf-mpconfig-imixerpinconfig-setblendingparameter
     */
    SetBlendingParameter(dwBlendingParameter) {
        result := ComCall(9, this, "uint", dwBlendingParameter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwBlendingParameter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpconfig/nf-mpconfig-imixerpinconfig-getblendingparameter
     */
    GetBlendingParameter(pdwBlendingParameter) {
        pdwBlendingParameterMarshal := pdwBlendingParameter is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, pdwBlendingParameterMarshal, pdwBlendingParameter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} amAspectRatioMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpconfig/nf-mpconfig-imixerpinconfig-setaspectratiomode
     */
    SetAspectRatioMode(amAspectRatioMode) {
        result := ComCall(11, this, "int", amAspectRatioMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pamAspectRatioMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpconfig/nf-mpconfig-imixerpinconfig-getaspectratiomode
     */
    GetAspectRatioMode(pamAspectRatioMode) {
        pamAspectRatioModeMarshal := pamAspectRatioMode is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, pamAspectRatioModeMarshal, pamAspectRatioMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} bStreamTransparent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpconfig/nf-mpconfig-imixerpinconfig-setstreamtransparent
     */
    SetStreamTransparent(bStreamTransparent) {
        result := ComCall(13, this, "int", bStreamTransparent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbStreamTransparent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpconfig/nf-mpconfig-imixerpinconfig-getstreamtransparent
     */
    GetStreamTransparent(pbStreamTransparent) {
        result := ComCall(14, this, "ptr", pbStreamTransparent, "HRESULT")
        return result
    }
}

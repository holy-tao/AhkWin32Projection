#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMOverlayFX interface controls how the video overlay appears on the user's screen. The Overlay Mixer filter implements this interface.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamoverlayfx
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMOverlayFX extends IUnknown{
    /**
     * The interface identifier for IAMOverlayFX
     * @type {Guid}
     */
    static IID => Guid("{62fae250-7e65-4460-bfc9-6398b322073c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} lpdwOverlayFXCaps 
     * @returns {HRESULT} 
     */
    QueryOverlayFXCaps(lpdwOverlayFXCaps) {
        result := ComCall(3, this, "uint*", lpdwOverlayFXCaps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOverlayFX 
     * @returns {HRESULT} 
     */
    SetOverlayFX(dwOverlayFX) {
        result := ComCall(4, this, "uint", dwOverlayFX, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} lpdwOverlayFX 
     * @returns {HRESULT} 
     */
    GetOverlayFX(lpdwOverlayFX) {
        result := ComCall(5, this, "uint*", lpdwOverlayFX, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * IWMPEffects interface
 * @see https://docs.microsoft.com/windows/win32/api//effects/nn-effects-iwmpeffects
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPEffects extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPEffects
     * @type {Guid}
     */
    static IID => Guid("{d3984c13-c3cb-48e2-8be5-5168340b4f35}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Render", "MediaInfo", "GetCapabilities", "GetTitle", "GetPresetTitle", "GetPresetCount", "SetCurrentPreset", "GetCurrentPreset", "DisplayPropertyPage", "GoFullscreen", "RenderFullScreen"]

    /**
     * 
     * @param {Pointer<TimedLevel>} pLevels 
     * @param {HDC} hdc 
     * @param {Pointer<RECT>} prc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/effects/nf-effects-iwmpeffects-render
     */
    Render(pLevels, hdc, prc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := ComCall(3, this, "ptr", pLevels, "ptr", hdc, "ptr", prc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lChannelCount 
     * @param {Integer} lSampleRate 
     * @param {BSTR} bstrTitle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/effects/nf-effects-iwmpeffects-mediainfo
     */
    MediaInfo(lChannelCount, lSampleRate, bstrTitle) {
        bstrTitle := bstrTitle is String ? BSTR.Alloc(bstrTitle).Value : bstrTitle

        result := ComCall(4, this, "int", lChannelCount, "int", lSampleRate, "ptr", bstrTitle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwCapabilities 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/effects/nf-effects-iwmpeffects-getcapabilities
     */
    GetCapabilities(pdwCapabilities) {
        pdwCapabilitiesMarshal := pdwCapabilities is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pdwCapabilitiesMarshal, pdwCapabilities, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} bstrTitle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/effects/nf-effects-iwmpeffects-gettitle
     */
    GetTitle(bstrTitle) {
        result := ComCall(6, this, "ptr", bstrTitle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nPreset 
     * @param {Pointer<BSTR>} bstrPresetTitle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/effects/nf-effects-iwmpeffects-getpresettitle
     */
    GetPresetTitle(nPreset, bstrPresetTitle) {
        result := ComCall(7, this, "int", nPreset, "ptr", bstrPresetTitle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pnPresetCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/effects/nf-effects-iwmpeffects-getpresetcount
     */
    GetPresetCount(pnPresetCount) {
        pnPresetCountMarshal := pnPresetCount is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, pnPresetCountMarshal, pnPresetCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nPreset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/effects/nf-effects-iwmpeffects-setcurrentpreset
     */
    SetCurrentPreset(nPreset) {
        result := ComCall(9, this, "int", nPreset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pnPreset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/effects/nf-effects-iwmpeffects-getcurrentpreset
     */
    GetCurrentPreset(pnPreset) {
        pnPresetMarshal := pnPreset is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, pnPresetMarshal, pnPreset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwndOwner 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/effects/nf-effects-iwmpeffects-displaypropertypage
     */
    DisplayPropertyPage(hwndOwner) {
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        result := ComCall(11, this, "ptr", hwndOwner, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fFullScreen 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/effects/nf-effects-iwmpeffects-gofullscreen
     */
    GoFullscreen(fFullScreen) {
        result := ComCall(12, this, "int", fFullScreen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<TimedLevel>} pLevels 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/effects/nf-effects-iwmpeffects-renderfullscreen
     */
    RenderFullScreen(pLevels) {
        result := ComCall(13, this, "ptr", pLevels, "HRESULT")
        return result
    }
}

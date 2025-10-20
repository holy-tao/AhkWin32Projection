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
     * 
     * @param {Pointer<TimedLevel>} pLevels 
     * @param {HDC} hdc 
     * @param {Pointer<RECT>} prc 
     * @returns {HRESULT} 
     */
    Render(pLevels, hdc, prc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := ComCall(3, this, "ptr", pLevels, "ptr", hdc, "ptr", prc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lChannelCount 
     * @param {Integer} lSampleRate 
     * @param {BSTR} bstrTitle 
     * @returns {HRESULT} 
     */
    MediaInfo(lChannelCount, lSampleRate, bstrTitle) {
        bstrTitle := bstrTitle is String ? BSTR.Alloc(bstrTitle).Value : bstrTitle

        result := ComCall(4, this, "int", lChannelCount, "int", lSampleRate, "ptr", bstrTitle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwCapabilities 
     * @returns {HRESULT} 
     */
    GetCapabilities(pdwCapabilities) {
        result := ComCall(5, this, "uint*", pdwCapabilities, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} bstrTitle 
     * @returns {HRESULT} 
     */
    GetTitle(bstrTitle) {
        result := ComCall(6, this, "ptr", bstrTitle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nPreset 
     * @param {Pointer<BSTR>} bstrPresetTitle 
     * @returns {HRESULT} 
     */
    GetPresetTitle(nPreset, bstrPresetTitle) {
        result := ComCall(7, this, "int", nPreset, "ptr", bstrPresetTitle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pnPresetCount 
     * @returns {HRESULT} 
     */
    GetPresetCount(pnPresetCount) {
        result := ComCall(8, this, "int*", pnPresetCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nPreset 
     * @returns {HRESULT} 
     */
    SetCurrentPreset(nPreset) {
        result := ComCall(9, this, "int", nPreset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pnPreset 
     * @returns {HRESULT} 
     */
    GetCurrentPreset(pnPreset) {
        result := ComCall(10, this, "int*", pnPreset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwndOwner 
     * @returns {HRESULT} 
     */
    DisplayPropertyPage(hwndOwner) {
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        result := ComCall(11, this, "ptr", hwndOwner, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fFullScreen 
     * @returns {HRESULT} 
     */
    GoFullscreen(fFullScreen) {
        result := ComCall(12, this, "int", fFullScreen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<TimedLevel>} pLevels 
     * @returns {HRESULT} 
     */
    RenderFullScreen(pLevels) {
        result := ComCall(13, this, "ptr", pLevels, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

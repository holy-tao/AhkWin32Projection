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
     * The Render method renders the visualization.
     * @param {Pointer<TimedLevel>} pLevels Pointer to a <b>TimedLevel</b> structure.
     * @param {HDC} hdc Specifies a handle to a device context.
     * @param {Pointer<RECT>} prc Specifies the rectangle the visualization is to be rendered in.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//effects/nf-effects-iwmpeffects-render
     */
    Render(pLevels, hdc, prc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := ComCall(3, this, "ptr", pLevels, "ptr", hdc, "ptr", prc, "HRESULT")
        return result
    }

    /**
     * The MediaInfo method sends channel and sample rate data to the visualization.
     * @param {Integer} lChannelCount <b>Long</b> integer containing the number of channels (one for mono, or two for stereo).
     * @param {Integer} lSampleRate <b>Long</b> integer containing the sample rate in hertz (Hz). For example, a value of 22500 would specify a rate of 22.5KHz.
     * @param {BSTR} bstrTitle <b>String</b> specifying the title.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//effects/nf-effects-iwmpeffects-mediainfo
     */
    MediaInfo(lChannelCount, lSampleRate, bstrTitle) {
        bstrTitle := bstrTitle is String ? BSTR.Alloc(bstrTitle).Value : bstrTitle

        result := ComCall(4, this, "int", lChannelCount, "int", lSampleRate, "ptr", bstrTitle, "HRESULT")
        return result
    }

    /**
     * The GetCapabilities method gets the capabilities of the visualization.
     * @param {Pointer<Integer>} pdwCapabilities <b>DWORD</b> containing the capabilities.
     * 
     * The current values are as follows.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td><b>EFFECT_CANGOFULLSCREEN</b> = 0x00000001;</td>
     * <td>The visualization is capable of full-screen rendering.</td>
     * </tr>
     * <tr>
     * <td><b>EFFECT_HASPROPERTYPAGE</b> = 0x00000002;</td>
     * <td>The visualization has a property page.</td>
     * </tr>
     * <tr>
     * <td><b>EFFECT_VARIABLEFREQSTEP</b> = 0x00000004;</td>
     * <td>The visualization will use frequency data with variable size steps. If this bit is set, step size is based on the media sampling frequency divided by BUFFER_SIZE. If this bit is not set and media is played that was sampled at a low frequency, the upper cells will be empty. For example, if an 8KHz sampled file is played and this bit is not set, the upper half of the frequency array (from 8KHz to 22KHz) will be empty. If this bit is set and an 8Khz sampled file is played, the frequency array will range from 20Hz to 8KHz in BUFFER_SIZE steps.</td>
     * </tr>
     * <tr>
     * <td><b>EFFECT_WINDOWED_ONLY</b> = 0x00000008</td>
     * <td>The visualization only renders in windowed mode.</td>
     * </tr>
     * <tr>
     * <td><b>EFFECT2_FULLSCREENEXCLUSIVE</b> = 0x00000010</td>
     * <td>The visualization uses exclusive mode when rendering full-screen. The Player will not resize the window to fill the screen. The visualization must create a top level window and handle resolution switching.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//effects/nf-effects-iwmpeffects-getcapabilities
     */
    GetCapabilities(pdwCapabilities) {
        pdwCapabilitiesMarshal := pdwCapabilities is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pdwCapabilitiesMarshal, pdwCapabilities, "HRESULT")
        return result
    }

    /**
     * The GetTitle method gets the display title of the visualization.
     * @param {Pointer<BSTR>} bstrTitle <b>String</b> containing the title.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//effects/nf-effects-iwmpeffects-gettitle
     */
    GetTitle(bstrTitle) {
        result := ComCall(6, this, "ptr", bstrTitle, "HRESULT")
        return result
    }

    /**
     * The GetPresetTitle method gets the title of the current preset.
     * @param {Integer} nPreset <b>Long</b> preset number.
     * @param {Pointer<BSTR>} bstrPresetTitle <b>BSTR</b> preset title.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//effects/nf-effects-iwmpeffects-getpresettitle
     */
    GetPresetTitle(nPreset, bstrPresetTitle) {
        result := ComCall(7, this, "int", nPreset, "ptr", bstrPresetTitle, "HRESULT")
        return result
    }

    /**
     * The GetPresetCount method gets the preset count.
     * @param {Pointer<Integer>} pnPresetCount <b>Long</b> value specifying the preset count.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//effects/nf-effects-iwmpeffects-getpresetcount
     */
    GetPresetCount(pnPresetCount) {
        pnPresetCountMarshal := pnPresetCount is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, pnPresetCountMarshal, pnPresetCount, "HRESULT")
        return result
    }

    /**
     * The SetCurrentPreset method gets the current preset from Windows Media Player and sets it in the visualization.
     * @param {Integer} nPreset <b>Long</b> value specifying the new preset index.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//effects/nf-effects-iwmpeffects-setcurrentpreset
     */
    SetCurrentPreset(nPreset) {
        result := ComCall(9, this, "int", nPreset, "HRESULT")
        return result
    }

    /**
     * The GetCurrentPreset method gets the current preset, by number, from the visualization and provides it to Windows Media Player.
     * @param {Pointer<Integer>} pnPreset <b>Long</b> value specifying the current preset, by number.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//effects/nf-effects-iwmpeffects-getcurrentpreset
     */
    GetCurrentPreset(pnPreset) {
        pnPresetMarshal := pnPreset is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, pnPresetMarshal, pnPreset, "HRESULT")
        return result
    }

    /**
     * The DisplayPropertyPage method displays the property page of a visualization, if it exists.
     * @param {HWND} hwndOwner Handle to the dialog that will be displayed.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//effects/nf-effects-iwmpeffects-displaypropertypage
     */
    DisplayPropertyPage(hwndOwner) {
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        result := ComCall(11, this, "ptr", hwndOwner, "HRESULT")
        return result
    }

    /**
     * The GoFullscreen method instructs the visualization to switch to full-screen mode.
     * @param {BOOL} fFullScreen <b>Boolean</b> indicating whether to switch to full-screen mode.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//effects/nf-effects-iwmpeffects-gofullscreen
     */
    GoFullscreen(fFullScreen) {
        result := ComCall(12, this, "int", fFullScreen, "HRESULT")
        return result
    }

    /**
     * The RenderFullScreen method renders the visualization in full-screen mode.
     * @param {Pointer<TimedLevel>} pLevels Pointer to a <b>TimedLevel</b> structure.
     * @returns {HRESULT} If the method succeeds, your implementation should return S_OK. If it fails, return an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//effects/nf-effects-iwmpeffects-renderfullscreen
     */
    RenderFullScreen(pLevels) {
        result := ComCall(13, this, "ptr", pLevels, "HRESULT")
        return result
    }
}

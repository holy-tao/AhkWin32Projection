#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMixerPinConfig.ahk

/**
 * The IMixerPinConfig2 interface is exposed on the input pins of the Overlay Mixer and contains methods that manipulate video color controls, if the VGA chip supports it.This interface derives from the IMixerPinConfig interface.Applications use this interface to get and set video color controls when mixing multiple video streams.
 * @see https://docs.microsoft.com/windows/win32/api//mpconfig/nn-mpconfig-imixerpinconfig2
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMixerPinConfig2 extends IMixerPinConfig{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMixerPinConfig2
     * @type {Guid}
     */
    static IID => Guid("{ebf47182-8764-11d1-9e69-00c04fd7c15b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 15

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetOverlaySurfaceColorControls", "GetOverlaySurfaceColorControls"]

    /**
     * 
     * @param {Pointer<DDCOLORCONTROL>} pColorControl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpconfig/nf-mpconfig-imixerpinconfig2-setoverlaysurfacecolorcontrols
     */
    SetOverlaySurfaceColorControls(pColorControl) {
        result := ComCall(15, this, "ptr", pColorControl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DDCOLORCONTROL>} pColorControl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpconfig/nf-mpconfig-imixerpinconfig2-getoverlaysurfacecolorcontrols
     */
    GetOverlaySurfaceColorControls(pColorControl) {
        result := ComCall(16, this, "ptr", pColorControl, "HRESULT")
        return result
    }
}

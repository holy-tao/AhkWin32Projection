#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFVideoMixerControl.ahk

/**
 * Controls preferences for video deinterlacing.
 * @see https://docs.microsoft.com/windows/win32/api//evr/nn-evr-imfvideomixercontrol2
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFVideoMixerControl2 extends IMFVideoMixerControl{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFVideoMixerControl2
     * @type {Guid}
     */
    static IID => Guid("{8459616d-966e-4930-b658-54fa7e5a16d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetMixingPrefs", "GetMixingPrefs"]

    /**
     * Sets the preferences for video deinterlacing.
     * @param {Integer} dwMixFlags Bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/evr/ne-evr-mfvideomixprefs">MFVideoMixPrefs</a> enumeration.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//evr/nf-evr-imfvideomixercontrol2-setmixingprefs
     */
    SetMixingPrefs(dwMixFlags) {
        result := ComCall(7, this, "uint", dwMixFlags, "HRESULT")
        return result
    }

    /**
     * Gets the current preferences for video deinterlacing.
     * @returns {Integer} Receives a bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/evr/ne-evr-mfvideomixprefs">MFVideoMixPrefs</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//evr/nf-evr-imfvideomixercontrol2-getmixingprefs
     */
    GetMixingPrefs() {
        result := ComCall(8, this, "uint*", &pdwMixFlags := 0, "HRESULT")
        return pdwMixFlags
    }
}

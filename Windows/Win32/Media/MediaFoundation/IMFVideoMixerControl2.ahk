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
     * 
     * @param {Integer} dwMixFlags 
     * @returns {HRESULT} 
     */
    SetMixingPrefs(dwMixFlags) {
        result := ComCall(7, this, "uint", dwMixFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwMixFlags 
     * @returns {HRESULT} 
     */
    GetMixingPrefs(pdwMixFlags) {
        result := ComCall(8, this, "uint*", pdwMixFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

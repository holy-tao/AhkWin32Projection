#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Used for resetting the current audio endpoint device format.
 * @remarks
 * 
 * This setting is exposed to the user through the "Sounds" control panel  and can be read from the endpoint property store using
 * <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/pkey-audioengine-deviceformat">PKEY_AudioEngine_DeviceFormat</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//audioendpoints/nn-audioendpoints-iaudioendpointformatcontrol
 * @namespace Windows.Win32.Media.Audio.Endpoints
 * @version v4.0.30319
 */
class IAudioEndpointFormatControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioEndpointFormatControl
     * @type {Guid}
     */
    static IID => Guid("{784cfd40-9f89-456e-a1a6-873b006a664e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ResetToDefault"]

    /**
     * Resets the format to the default setting provided by the device manufacturer.
     * @param {Integer} ResetFlags Allows the application to specify which formats are reset.  If
     *                       no flags are set, then this method reevaluates both the endpoint's 
     *     device format and mix format and sets them to their default values.
     * 
     * ENDPOINT_FORMAT_RESET_MIX_ONLY: Only reset the mix format.  The endpoint's device
     *     format will not be reset if this flag is set.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//audioendpoints/nf-audioendpoints-iaudioendpointformatcontrol-resettodefault
     */
    ResetToDefault(ResetFlags) {
        result := ComCall(3, this, "uint", ResetFlags, "HRESULT")
        return result
    }
}

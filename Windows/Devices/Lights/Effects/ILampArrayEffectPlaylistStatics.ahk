#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Lights.Effects
 * @version WindowsRuntime 1.4
 */
class ILampArrayEffectPlaylistStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILampArrayEffectPlaylistStatics
     * @type {Guid}
     */
    static IID => Guid("{fb15235c-ea35-4c7f-a016-f3bfc6a6c47d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartAll", "StopAll", "PauseAll"]

    /**
     * 
     * @param {IIterable<LampArrayEffectPlaylist>} value 
     * @returns {HRESULT} 
     */
    StartAll(value) {
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IIterable<LampArrayEffectPlaylist>} value 
     * @returns {HRESULT} 
     */
    StopAll(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IIterable<LampArrayEffectPlaylist>} value 
     * @returns {HRESULT} 
     */
    PauseAll(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 * @version v4.0.30319
 */
class GameInput {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_GAMEINPUT => 906

    /**
     * @type {Integer (Int32)}
     */
    static GAMEINPUT_E_DEVICE_DISCONNECTED => -2088108031

    /**
     * @type {Integer (Int32)}
     */
    static GAMEINPUT_E_DEVICE_NOT_FOUND => -2088108030

    /**
     * @type {Integer (Int32)}
     */
    static GAMEINPUT_E_READING_NOT_FOUND => -2088108029

    /**
     * @type {Integer (Int32)}
     */
    static GAMEINPUT_E_REFERENCE_READING_TOO_OLD => -2088108028

    /**
     * @type {Integer (Int32)}
     */
    static GAMEINPUT_E_TIMESTAMP_OUT_OF_RANGE => -2088108027

    /**
     * @type {Integer (Int32)}
     */
    static GAMEINPUT_E_INSUFFICIENT_FORCE_FEEDBACK_RESOURCES => -2088108026
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {Pointer<IGameInput>} gameInput 
     * @returns {HRESULT} 
     */
    static GameInputCreate(gameInput) {
        result := DllCall("GameInput.dll\GameInputCreate", "ptr*", gameInput, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}

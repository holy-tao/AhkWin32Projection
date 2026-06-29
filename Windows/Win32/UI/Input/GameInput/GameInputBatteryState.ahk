#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GameInputBatteryStatus.ahk" { GameInputBatteryStatus }

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputBatteryState {
    #StructPack 4

    chargeRate : Float32

    maxChargeRate : Float32

    remainingCapacity : Float32

    fullChargeCapacity : Float32

    status : GameInputBatteryStatus

}

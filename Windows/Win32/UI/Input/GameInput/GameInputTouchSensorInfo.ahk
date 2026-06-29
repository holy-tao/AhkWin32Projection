#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GameInputKind.ahk" { GameInputKind }
#Import ".\GameInputTouchShape.ahk" { GameInputTouchShape }
#Import ".\GameInputLocation.ahk" { GameInputLocation }
#Import ".\GameInputLabel.ahk" { GameInputLabel }

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputTouchSensorInfo {
    #StructPack 8

    mappedInputKinds : GameInputKind

    label : GameInputLabel

    location : GameInputLocation

    locationId : UInt32

    resolutionX : Int64

    resolutionY : Int64

    shape : GameInputTouchShape

    aspectRatio : Float32

    orientation : Float32

    physicalWidth : Float32

    physicalHeight : Float32

    maxPressure : Float32

    maxProximity : Float32

    maxTouchPoints : UInt32

}

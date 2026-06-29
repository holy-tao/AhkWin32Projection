#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GameInputLabel.ahk" { GameInputLabel }

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputRacingWheelInfo {
    #StructPack 4

    menuButtonLabel : GameInputLabel

    viewButtonLabel : GameInputLabel

    previousGearButtonLabel : GameInputLabel

    nextGearButtonLabel : GameInputLabel

    dpadUpLabel : GameInputLabel

    dpadDownLabel : GameInputLabel

    dpadLeftLabel : GameInputLabel

    dpadRightLabel : GameInputLabel

    hasClutch : Int8

    hasHandbrake : Int8

    hasPatternShifter : Int8

    minPatternShifterGear : Int32

    maxPatternShifterGear : Int32

    maxWheelAngle : Float32

}

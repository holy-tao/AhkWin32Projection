#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputTouchState {
    #StructPack 8

    touchId : Int64

    sensorIndex : UInt32

    positionX : Float32

    positionY : Float32

    pressure : Float32

    proximity : Float32

    contactRectTop : Float32

    contactRectLeft : Float32

    contactRectRight : Float32

    contactRectBottom : Float32

}

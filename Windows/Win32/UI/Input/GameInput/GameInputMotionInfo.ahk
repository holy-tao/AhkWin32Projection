#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputMotionInfo {
    #StructPack 4

    maxAcceleration : Float32

    maxAngularVelocity : Float32

    maxMagneticFieldStrength : Float32

}

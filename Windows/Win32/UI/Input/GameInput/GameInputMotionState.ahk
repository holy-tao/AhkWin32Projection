#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GameInputMotionAccuracy.ahk" { GameInputMotionAccuracy }

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputMotionState {
    #StructPack 4

    accelerationX : Float32

    accelerationY : Float32

    accelerationZ : Float32

    angularVelocityX : Float32

    angularVelocityY : Float32

    angularVelocityZ : Float32

    magneticFieldX : Float32

    magneticFieldY : Float32

    magneticFieldZ : Float32

    orientationW : Float32

    orientationX : Float32

    orientationY : Float32

    orientationZ : Float32

    accelerometerAccuracy : GameInputMotionAccuracy

    gyroscopeAccuracy : GameInputMotionAccuracy

    magnetometerAccuracy : GameInputMotionAccuracy

    orientationAccuracy : GameInputMotionAccuracy

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGK_BRIGHTNESS_SET_IN {
    #StructPack 8

    BrightnessMillinits : UInt32

    TransitionTimeMs : UInt32

    SensorReadings : IntPtr

}

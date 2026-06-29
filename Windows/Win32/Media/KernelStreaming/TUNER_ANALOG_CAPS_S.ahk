#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct TUNER_ANALOG_CAPS_S {
    #StructPack 4

    Mode : UInt32

    StandardsSupported : UInt32

    MinFrequency : UInt32

    MaxFrequency : UInt32

    TuningGranularity : UInt32

    SettlingTime : UInt32

    ScanSensingRange : UInt32

    FineTuneSensingRange : UInt32

}

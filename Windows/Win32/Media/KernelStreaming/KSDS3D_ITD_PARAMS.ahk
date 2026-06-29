#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSDS3D_ITD_PARAMS {
    #StructPack 4

    Channel : Int32

    VolSmoothScale : Float32

    TotalDryAttenuation : Float32

    TotalWetAttenuation : Float32

    SmoothFrequency : Int32

    Delay : Int32

}

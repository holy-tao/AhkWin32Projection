#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSDS3D_HRTF_COEFF_FORMAT.ahk" { KSDS3D_HRTF_COEFF_FORMAT }
#Import ".\KSDS3D_HRTF_FILTER_METHOD.ahk" { KSDS3D_HRTF_FILTER_METHOD }
#Import ".\KSDS3D_HRTF_FILTER_VERSION.ahk" { KSDS3D_HRTF_FILTER_VERSION }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSDS3D_HRTF_FILTER_FORMAT_MSG {
    #StructPack 4

    FilterMethod : KSDS3D_HRTF_FILTER_METHOD

    CoeffFormat : KSDS3D_HRTF_COEFF_FORMAT

    Version : KSDS3D_HRTF_FILTER_VERSION

    Reserved : UInt32

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSDS3D_ITD_PARAMS.ahk" { KSDS3D_ITD_PARAMS }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSDS3D_ITD_PARAMS_MSG {
    #StructPack 4

    Enabled : UInt32

    LeftParams : KSDS3D_ITD_PARAMS

    RightParams : KSDS3D_ITD_PARAMS

    Reserved : UInt32

}

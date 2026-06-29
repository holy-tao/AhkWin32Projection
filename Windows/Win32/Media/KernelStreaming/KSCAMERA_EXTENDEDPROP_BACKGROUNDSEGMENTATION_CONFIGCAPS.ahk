#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSCAMERA_EXTENDEDPROP_BACKGROUNDSEGMENTATION_CONFIGCAPS {
    #StructPack 4


    struct _MaxFrameRate {
        Numerator : Int32

        Denominator : Int32

    }

    Resolution : SIZE

    MaxFrameRate : KSCAMERA_EXTENDEDPROP_BACKGROUNDSEGMENTATION_CONFIGCAPS._MaxFrameRate

    MaskResolution : SIZE

    SubType : Guid

}

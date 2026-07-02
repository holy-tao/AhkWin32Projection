#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\KSNODEPROPERTY.ahk" { KSNODEPROPERTY }
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSNODEPROPERTY_AUDIO_DEV_SPECIFIC {
    #StructPack 8

    NodeProperty : KSNODEPROPERTY

    DevSpecificId : UInt32

    DeviceInfo : UInt32

    Length : UInt32

}

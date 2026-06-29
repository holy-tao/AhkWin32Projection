#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WIA_PATCH_CODE_INFO.ahk" { WIA_PATCH_CODE_INFO }

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 */
export default struct WIA_PATCH_CODES {
    #StructPack 4

    Tag : UInt32

    Version : UInt32

    Size : UInt32

    Count : UInt32

    PatchCodes : WIA_PATCH_CODE_INFO[1]

}

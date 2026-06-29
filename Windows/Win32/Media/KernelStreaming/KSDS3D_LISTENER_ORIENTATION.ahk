#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DS3DVECTOR.ahk" { DS3DVECTOR }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSDS3D_LISTENER_ORIENTATION {
    #StructPack 4

    Front : DS3DVECTOR

    Top : DS3DVECTOR

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_FAILURE_PREDICTION_CONFIG {
    #StructPack 4

    Version : UInt32

    Size : UInt32

    Set : BOOLEAN

    Enabled : BOOLEAN

    Reserved : UInt16

}

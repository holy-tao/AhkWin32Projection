#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DEVICE_DSM_DEFINITION {
    #StructPack 4

    Action : UInt32

    SingleRange : BOOLEAN

    ParameterBlockAlignment : UInt32

    ParameterBlockLength : UInt32

    HasOutput : BOOLEAN

    OutputBlockAlignment : UInt32

    OutputBlockLength : UInt32

}

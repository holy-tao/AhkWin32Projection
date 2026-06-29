#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FS_BPIO_RESULTS {
    #StructPack 4

    OpStatus : UInt32

    FailingDriverNameLen : UInt16

    FailingDriverName : WCHAR[32]

    FailureReasonLen : UInt16

    FailureReason : WCHAR[128]

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\OSINFO.ahk" { OSINFO }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct ASSEMBLYMETADATA {
    #StructPack 8

    usMajorVersion : UInt16

    usMinorVersion : UInt16

    usBuildNumber : UInt16

    usRevisionNumber : UInt16

    szLocale : PWSTR

    cbLocale : UInt32

    rProcessor : IntPtr

    ulProcessor : UInt32

    rOS : OSINFO.Ptr

    ulOS : UInt32

}

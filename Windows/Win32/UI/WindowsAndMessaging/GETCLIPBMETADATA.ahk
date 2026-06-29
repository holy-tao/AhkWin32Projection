#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct GETCLIPBMETADATA {
    #StructPack 4

    Version : UInt32

    IsDelayRendered : BOOL

    IsSynthetic : BOOL

}

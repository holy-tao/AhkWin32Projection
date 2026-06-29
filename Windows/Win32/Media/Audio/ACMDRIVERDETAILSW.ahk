#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\UI\WindowsAndMessaging\HICON.ahk" { HICON }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Media.Audio
 * @charset Unicode
 */
export default struct ACMDRIVERDETAILSW {
    #StructPack 8

    cbStruct : UInt32

    fccType : UInt32

    fccComp : UInt32

    wMid : UInt16

    wPid : UInt16

    vdwACM : UInt32

    vdwDriver : UInt32

    fdwSupport : UInt32

    cFormatTags : UInt32

    cFilterTags : UInt32

    hicon : HICON

    szShortName : WCHAR[32]

    szLongName : WCHAR[128]

    szCopyright : WCHAR[80]

    szLicensing : WCHAR[128]

    szFeatures : WCHAR[512]

}

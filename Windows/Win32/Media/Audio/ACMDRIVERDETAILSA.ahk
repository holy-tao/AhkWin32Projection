#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\UI\WindowsAndMessaging\HICON.ahk" { HICON }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Media.Audio
 * @charset ANSI
 */
export default struct ACMDRIVERDETAILSA {
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

    szShortName : CHAR[32]

    szLongName : CHAR[128]

    szCopyright : CHAR[80]

    szLicensing : CHAR[128]

    szFeatures : CHAR[512]

}

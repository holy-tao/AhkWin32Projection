#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IMEFAREASTINFO.ahk" { IMEFAREASTINFO }

/**
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct IMESTRINGCANDIDATEINFO {
    #StructPack 8

    dwFarEastId : UInt32

    lpFarEastInfo : IMEFAREASTINFO.Ptr

    fInfoMask : UInt32

    iSelIndex : Int32

    uCount : UInt32

    lpwstr : PWSTR[1]

}

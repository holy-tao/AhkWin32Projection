#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct KDEXT_PROCESS_FIND_PARAMS {
    #StructPack 8

    SizeofStruct : UInt32

    Pid : UInt32

    Session : UInt32

    ImageName : PSTR

}

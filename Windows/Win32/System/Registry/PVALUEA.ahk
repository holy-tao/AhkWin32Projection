#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Registry
 * @charset ANSI
 */
export default struct PVALUEA {
    #StructPack 8

    pv_valuename : PSTR

    pv_valuelen : Int32

    pv_value_context : IntPtr

    pv_type : UInt32

}

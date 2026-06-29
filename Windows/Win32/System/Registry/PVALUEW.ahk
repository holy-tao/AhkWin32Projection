#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.Registry
 * @charset Unicode
 */
export default struct PVALUEW {
    #StructPack 8

    pv_valuename : PWSTR

    pv_valuelen : Int32

    pv_value_context : IntPtr

    pv_type : UInt32

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct PROFILER_PROPERTY_TYPE_SUBSTRING_INFO {
    #StructPack 8

    length : UInt32

    value : PWSTR

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\TANALYZE_RETURN.ahk" { TANALYZE_RETURN }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct CKCL_DATA {
    #StructPack 8

    NextLogEvent : IntPtr

    TAnalyzeString : PSTR

    TAnalyzeReturnType : TANALYZE_RETURN

}

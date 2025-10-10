#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the analysis information.
 * @see https://docs.microsoft.com/windows/win32/api//scesvc/ns-scesvc-scesvc_analysis_info
 * @namespace Windows.Win32.Security.ConfigurationSnapin
 * @version v4.0.30319
 */
class SCESVC_ANALYSIS_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A <b>DWORD</b> that indicates the number of lines in the array.
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/win32/api/scesvc/ns-scesvc-scesvc_analysis_line">SCESVC_ANALYSIS_LINE</a> structures which contain the analysis information.
     * @type {Pointer<SCESVC_ANALYSIS_LINE>}
     */
    Lines {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

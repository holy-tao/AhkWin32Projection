#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SCESVC_CONFIGURATION_INFO structure provides configuration information for a service. This structure is used by the PFSCE_QUERY_INFO and PFSCE_SET_INFO functions when the configuration information is specified.
 * @remarks
 * 
 * When analysis information is specified, the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/scesvc/nc-scesvc-pfsce_query_info">PFSCE_QUERY_INFO</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/scesvc/nc-scesvc-pfsce_set_info">PFSCE_SET_INFO</a> functions use the 
 * <a href="https://docs.microsoft.com/windows/win32/api/scesvc/ns-scesvc-scesvc_analysis_info">SCESVC_ANALYSIS_INFO</a> structure.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//scesvc/ns-scesvc-scesvc_configuration_info
 * @namespace Windows.Win32.Security.ConfigurationSnapin
 * @version v4.0.30319
 */
class SCESVC_CONFIGURATION_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Indicates the number of lines of data returned in the <b>Lines</b> array.
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/win32/api/scesvc/ns-scesvc-scesvc_configuration_line">SCESVC_CONFIGURATION_LINE</a> structures which contains the configuration data for this service. Each element represents a line in the security template or database.
     * @type {Pointer<SCESVC_CONFIGURATION_LINE>}
     */
    Lines {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

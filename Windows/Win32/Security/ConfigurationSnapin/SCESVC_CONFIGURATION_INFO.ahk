#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SCESVC_CONFIGURATION_LINE.ahk" { SCESVC_CONFIGURATION_LINE }

/**
 * The SCESVC_CONFIGURATION_INFO structure provides configuration information for a service. This structure is used by the PFSCE_QUERY_INFO and PFSCE_SET_INFO functions when the configuration information is specified.
 * @remarks
 * When analysis information is specified, the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/scesvc/nc-scesvc-pfsce_query_info">PFSCE_QUERY_INFO</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/scesvc/nc-scesvc-pfsce_set_info">PFSCE_SET_INFO</a> functions use the 
 * <a href="https://docs.microsoft.com/windows/win32/api/scesvc/ns-scesvc-scesvc_analysis_info">SCESVC_ANALYSIS_INFO</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/scesvc/ns-scesvc-scesvc_configuration_info
 * @namespace Windows.Win32.Security.ConfigurationSnapin
 */
export default struct SCESVC_CONFIGURATION_INFO {
    #StructPack 8

    /**
     * Indicates the number of lines of data returned in the <b>Lines</b> array.
     */
    Count : UInt32

    /**
     * Pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/win32/api/scesvc/ns-scesvc-scesvc_configuration_line">SCESVC_CONFIGURATION_LINE</a> structures which contains the configuration data for this service. Each element represents a line in the security template or database.
     */
    Lines : SCESVC_CONFIGURATION_LINE.Ptr

}

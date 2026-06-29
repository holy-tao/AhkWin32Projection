#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SCESVC_ANALYSIS_LINE.ahk" { SCESVC_ANALYSIS_LINE }

/**
 * Contains the analysis information.
 * @see https://learn.microsoft.com/windows/win32/api/scesvc/ns-scesvc-scesvc_analysis_info
 * @namespace Windows.Win32.Security.ConfigurationSnapin
 */
export default struct SCESVC_ANALYSIS_INFO {
    #StructPack 8

    /**
     * A <b>DWORD</b> that indicates the number of lines in the array.
     */
    Count : UInt32

    /**
     * Pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/win32/api/scesvc/ns-scesvc-scesvc_analysis_line">SCESVC_ANALYSIS_LINE</a> structures which contain the analysis information.
     */
    Lines : SCESVC_ANALYSIS_LINE.Ptr

}

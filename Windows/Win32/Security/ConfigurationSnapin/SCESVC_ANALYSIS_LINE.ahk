#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SCESVC_ANALYSIS_LINE structure contains the key, value, and value length for a specific line specified by an SCESVC_ANALYSIS_INFO structure.
 * @see https://learn.microsoft.com/windows/win32/api/scesvc/ns-scesvc-scesvc_analysis_line
 * @namespace Windows.Win32.Security.ConfigurationSnapin
 */
export default struct SCESVC_ANALYSIS_LINE {
    #StructPack 8

    /**
     * String that contains data key. Typically, this is the name of the configuration parameter to which the <b>Value</b> data applies.
     */
    Key : IntPtr

    /**
     * Data describing the analysis result for the key. This can be binary data.
     */
    Value : IntPtr

    /**
     * Length of the data stored in <b>Value</b>, in bytes.
     */
    ValueLen : UInt32

}

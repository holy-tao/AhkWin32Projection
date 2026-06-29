#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SCESVC_CONFIGURATION_LINE structure contains information about a line of configuration data. It is used by the SCESVC_CONFIGURATION_INFO structure.
 * @see https://learn.microsoft.com/windows/win32/api/scesvc/ns-scesvc-scesvc_configuration_line
 * @namespace Windows.Win32.Security.ConfigurationSnapin
 */
export default struct SCESVC_CONFIGURATION_LINE {
    #StructPack 8

    /**
     * String that contains data key. Typically this is the name of the configuration parameter to which the <b>Value</b> data applies.
     */
    Key : IntPtr

    /**
     * String that contains data describing the configuration.
     */
    Value : IntPtr

    /**
     * Length of the data stored in <b>Value</b>, in bytes.
     */
    ValueLen : UInt32

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The JOB\_INFO\_3 structure is used to link together a set of print jobs.
 * @see https://learn.microsoft.com/windows/win32/printdocs/job-info-3
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct JOB_INFO_3 {
    #StructPack 4

    /**
     * The print job identifier.
     */
    JobId : UInt32

    /**
     * The print job identifier for the next print job in the linked set of print jobs.
     */
    NextJobId : UInt32

    /**
     * This value is reserved for future use. You must set it to zero.
     */
    Reserved : UInt32

}

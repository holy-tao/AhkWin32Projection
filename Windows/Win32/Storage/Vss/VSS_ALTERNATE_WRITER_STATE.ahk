#Requires AutoHotkey v2.0.0 64-bit

/**
 * Used to indicate whether a given writer has an associated alternate writer.
 * @see https://docs.microsoft.com/windows/win32/api//vswriter/ne-vswriter-vss_alternate_writer_state
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class VSS_ALTERNATE_WRITER_STATE{

    /**
     * No information is available as to the existence of an alternate writer. This value indicates an application 
     *       error. This enumeration value is reserved for future use.
     * @type {Integer (Int32)}
     */
    static VSS_AWS_UNDEFINED => 0

    /**
     * A given writer does not have an alternate writer.
     * @type {Integer (Int32)}
     */
    static VSS_AWS_NO_ALTERNATE_WRITER => 1

    /**
     * An alternate writer exists. This alternate writer runs when the writer is not available. This enumeration 
     *       value is reserved for future use.
     * @type {Integer (Int32)}
     */
    static VSS_AWS_ALTERNATE_WRITER_EXISTS => 2

    /**
     * The writer in question is an alternate writer. This enumeration value is reserved for future use.
     * @type {Integer (Int32)}
     */
    static VSS_AWS_THIS_IS_ALTERNATE_WRITER => 3
}

#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies how the host system uses the data managed by a writer involved in a VSS operation.
 * @remarks
 * 
  * The usage type of the data that a writer manages is specified when it initializes its cooperation with the 
  *     shadow copy mechanism through 
  *     <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-cvsswriter-initialize">CVssWriter::Initialize</a>.
  * 
  * Information about the usage type of the data that a writer manages can be retrieved through its metadata using 
  *     <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssexaminewritermetadata-getidentity">IVssExamineWriterMetadata::GetIdentity</a>.
  * 
  * Requester applications that are interested in backing up system state should look for writers with the  <b>VSS_UT_BOOTABLESYSTEMSTATE</b> or  <b>VSS_UT_SYSTEMSERVICE</b> usage type.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vswriter/ne-vswriter-vss_usage_type
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class VSS_USAGE_TYPE{

    /**
     * The usage type is not known. 
 *       
 * 
 * This indicates an error on the part of the writer.
     * @type {Integer (Int32)}
     */
    static VSS_UT_UNDEFINED => 0

    /**
     * The data stored by the writer is part of the bootable system state.
     * @type {Integer (Int32)}
     */
    static VSS_UT_BOOTABLESYSTEMSTATE => 1

    /**
     * The writer either stores data used by a system service or is a system service itself.
     * @type {Integer (Int32)}
     */
    static VSS_UT_SYSTEMSERVICE => 2

    /**
     * The data is user data.
     * @type {Integer (Int32)}
     */
    static VSS_UT_USERDATA => 3

    /**
     * Unclassified data.
     * @type {Integer (Int32)}
     */
    static VSS_UT_OTHER => 4
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of data that a writer manages.
 * @remarks
 * 
 * The source type of the data that a writer manages is specified when it initializes its cooperation with the 
 *     shadow copy mechanism through a call to 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-cvsswriter-initialize">CVssWriter::Initialize</a>.
 * 
 * Information about the source type of the data that a writer manages can be retrieved through its metadata 
 *     using 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssexaminewritermetadata-getidentity">IVssExamineWriterMetadata::GetIdentity</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vswriter/ne-vswriter-vss_source_type
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class VSS_SOURCE_TYPE extends Win32Enum{

    /**
     * The source of the data is not known. 
     *       
     * 
     * This indicates a writer error, and the requester should report it.
     * @type {Integer (Int32)}
     */
    static VSS_ST_UNDEFINED => 0

    /**
     * The source of the data is a database that supports transactions, such as Microsoft SQL Server.
     * @type {Integer (Int32)}
     */
    static VSS_ST_TRANSACTEDDB => 1

    /**
     * The source of the data is a database that does not support transactions.
     * @type {Integer (Int32)}
     */
    static VSS_ST_NONTRANSACTEDDB => 2

    /**
     * Unclassified source type—data will be in a file group. 
     *       
     * 
     * This is the default source type.
     * @type {Integer (Int32)}
     */
    static VSS_ST_OTHER => 3
}

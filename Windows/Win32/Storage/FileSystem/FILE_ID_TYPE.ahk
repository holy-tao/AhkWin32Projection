#Requires AutoHotkey v2.0.0 64-bit

/**
 * Discriminator for the union in the FILE_ID_DESCRIPTOR structure.
 * @see https://docs.microsoft.com/windows/win32/api//winbase/ne-winbase-file_id_type
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class FILE_ID_TYPE{

    /**
     * Use the <b>FileId</b> member of the union.
     * @type {Integer (Int32)}
     */
    static FileIdType => 0

    /**
     * Use the <b>ObjectId</b> member of the union.
     * @type {Integer (Int32)}
     */
    static ObjectIdType => 1

    /**
     * Use the <b>ExtendedFileId</b> member of the union.
 *       
 * 
 * <b>Windows XP, Windows Server 2003, Windows Vista, Windows Server 2008, Windows 7 and Windows Server 2008 R2:  </b>This value is not supported before Windows 8 and Windows Server 2012.
     * @type {Integer (Int32)}
     */
    static ExtendedFileIdType => 2

    /**
     * This value is used for comparison only. All valid values are less than this value.
     * @type {Integer (Int32)}
     */
    static MaximumFileIdType => 3
}

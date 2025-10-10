#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifies the type of file information that GetFileInformationByHandleEx should retrieve or SetFileInformationByHandle should set.
 * @remarks
 * 
  * As noted in the preceding section, some file information classes are valid only for use with 
  *     <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getfileinformationbyhandleex">GetFileInformationByHandleEx</a>. Others are 
  *     valid only for use with 
  *     <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-setfileinformationbyhandle">SetFileInformationByHandle</a>. Where neither 
  *     function is mentioned, the information class is valid with both functions.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//minwinbase/ne-minwinbase-file_info_by_handle_class
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class FILE_INFO_BY_HANDLE_CLASS{

    /**
     * Minimal information for the file should be retrieved or set. Used for file handles. See 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-file_basic_info">FILE_BASIC_INFO</a>.
     * @type {Integer (Int32)}
     */
    static FileBasicInfo => 0

    /**
     * Extended information for the file should be retrieved. Used for file handles. Use only when calling 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getfileinformationbyhandleex">GetFileInformationByHandleEx</a>. See 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-file_standard_info">FILE_STANDARD_INFO</a>.
     * @type {Integer (Int32)}
     */
    static FileStandardInfo => 1

    /**
     * The file name should be retrieved. Used for any handles. Use only when calling 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getfileinformationbyhandleex">GetFileInformationByHandleEx</a>. See 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-file_name_info">FILE_NAME_INFO</a>.
     * @type {Integer (Int32)}
     */
    static FileNameInfo => 2

    /**
     * The file name should be changed. Used for file handles. Use only when calling 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-setfileinformationbyhandle">SetFileInformationByHandle</a>. See 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-file_rename_info">FILE_RENAME_INFO</a>.
     * @type {Integer (Int32)}
     */
    static FileRenameInfo => 3

    /**
     * The file should be deleted. Used for any handles. Use only when calling 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-setfileinformationbyhandle">SetFileInformationByHandle</a>. See 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-file_disposition_info">FILE_DISPOSITION_INFO</a>.
     * @type {Integer (Int32)}
     */
    static FileDispositionInfo => 4

    /**
     * The file allocation information should be changed. Used for file handles. Use only when calling 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-setfileinformationbyhandle">SetFileInformationByHandle</a>. See 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-file_allocation_info">FILE ALLOCATION INFO</a>.
     * @type {Integer (Int32)}
     */
    static FileAllocationInfo => 5

    /**
     * The end of the file should be set. Use only when calling 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-setfileinformationbyhandle">SetFileInformationByHandle</a>. See 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-file_end_of_file_info">FILE_END_OF_FILE_INFO</a>.
     * @type {Integer (Int32)}
     */
    static FileEndOfFileInfo => 6

    /**
     * File stream information for the specified file should be retrieved. Used for any handles. Use only when calling 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getfileinformationbyhandleex">GetFileInformationByHandleEx</a>. See 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-file_stream_info">FILE_STREAM_INFO</a>.
     * @type {Integer (Int32)}
     */
    static FileStreamInfo => 7

    /**
     * File compression information should be retrieved. Used for any handles. Use only when calling 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getfileinformationbyhandleex">GetFileInformationByHandleEx</a>. See 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-file_compression_info">FILE_COMPRESSION_INFO</a>.
     * @type {Integer (Int32)}
     */
    static FileCompressionInfo => 8

    /**
     * File attribute information should be retrieved. Used for any handles. Use only when calling 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getfileinformationbyhandleex">GetFileInformationByHandleEx</a>. See 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-file_attribute_tag_info">FILE_ATTRIBUTE_TAG_INFO</a>.
     * @type {Integer (Int32)}
     */
    static FileAttributeTagInfo => 9

    /**
     * Files in the specified directory should be retrieved. Used for directory handles. Use only when calling 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getfileinformationbyhandleex">GetFileInformationByHandleEx</a>. The number 
 *       of files returned for each call to 
 *       <b>GetFileInformationByHandleEx</b> depends on 
 *       the size of the buffer that is passed to the function. Any subsequent calls to 
 *       <b>GetFileInformationByHandleEx</b> on the same 
 *       handle will resume the enumeration operation after the last file is returned. See 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-file_id_both_dir_info">FILE_ID_BOTH_DIR_INFO</a>.
     * @type {Integer (Int32)}
     */
    static FileIdBothDirectoryInfo => 10

    /**
     * Identical to <b>FileIdBothDirectoryInfo</b>, but forces the enumeration operation to 
 *       start again from the beginning. See 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-file_id_both_dir_info">FILE_ID_BOTH_DIR_INFO</a>.
     * @type {Integer (Int32)}
     */
    static FileIdBothDirectoryRestartInfo => 11

    /**
     * Priority hint information should be  set. Use only when calling 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-setfileinformationbyhandle">SetFileInformationByHandle</a>. See 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-file_io_priority_hint_info">FILE_IO_PRIORITY_HINT_INFO</a>.
     * @type {Integer (Int32)}
     */
    static FileIoPriorityHintInfo => 12

    /**
     * File remote protocol information should be retrieved. Use for any handles. Use only when calling 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getfileinformationbyhandleex">GetFileInformationByHandleEx</a>. See 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-file_remote_protocol_info">FILE_REMOTE_PROTOCOL_INFO</a>.
     * @type {Integer (Int32)}
     */
    static FileRemoteProtocolInfo => 13

    /**
     * Files in the specified directory should be retrieved. Used for directory handles. Use only when calling 
 *        <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getfileinformationbyhandleex">GetFileInformationByHandleEx</a>. See 
 *        <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-file_full_dir_info">FILE_FULL_DIR_INFO</a>.
 * 
 * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported before Windows 8 and Windows Server 2012
     * @type {Integer (Int32)}
     */
    static FileFullDirectoryInfo => 14

    /**
     * Identical to <b>FileFullDirectoryInfo</b>, but forces the enumeration operation to 
 *        start again from the beginning. Use only when calling 
 *        <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getfileinformationbyhandleex">GetFileInformationByHandleEx</a>. See 
 *        <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-file_full_dir_info">FILE_FULL_DIR_INFO</a>.
 * 
 * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported before Windows 8 and Windows Server 2012
     * @type {Integer (Int32)}
     */
    static FileFullDirectoryRestartInfo => 15

    /**
     * File storage information should be retrieved. Use for any handles. Use only when calling 
 *        <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getfileinformationbyhandleex">GetFileInformationByHandleEx</a>. See 
 *        <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-file_storage_info">FILE_STORAGE_INFO</a>.
 * 
 * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported before Windows 8 and Windows Server 2012
     * @type {Integer (Int32)}
     */
    static FileStorageInfo => 16

    /**
     * File alignment information should be retrieved. Use for any handles. Use only when calling 
 *        <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getfileinformationbyhandleex">GetFileInformationByHandleEx</a>. See 
 *        <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-file_alignment_info">FILE_ALIGNMENT_INFO</a>.
 * 
 * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported before Windows 8 and Windows Server 2012
     * @type {Integer (Int32)}
     */
    static FileAlignmentInfo => 17

    /**
     * File information should be retrieved. Use for any handles. Use only when calling 
 *        <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getfileinformationbyhandleex">GetFileInformationByHandleEx</a>. See 
 *        <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-file_id_info">FILE_ID_INFO</a>.
 * 
 * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported before Windows 8 and Windows Server 2012
     * @type {Integer (Int32)}
     */
    static FileIdInfo => 18

    /**
     * Files in the specified directory should be retrieved. Used for directory handles. Use only when calling 
 *        <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getfileinformationbyhandleex">GetFileInformationByHandleEx</a>. See 
 *        <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-file_id_extd_dir_info">FILE_ID_EXTD_DIR_INFO</a>.
 * 
 * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported before Windows 8 and Windows Server 2012
     * @type {Integer (Int32)}
     */
    static FileIdExtdDirectoryInfo => 19

    /**
     * Identical to <b>FileIdExtdDirectoryInfo</b>, but forces the enumeration operation to 
 *        start again from the beginning. Use only when calling 
 *        <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getfileinformationbyhandleex">GetFileInformationByHandleEx</a>. See 
 *        <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-file_id_extd_dir_info">FILE_ID_EXTD_DIR_INFO</a>.
 * 
 * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported before Windows 8 and Windows Server 2012
     * @type {Integer (Int32)}
     */
    static FileIdExtdDirectoryRestartInfo => 20

    /**
     * 
     * @type {Integer (Int32)}
     */
    static FileDispositionInfoEx => 21

    /**
     * 
     * @type {Integer (Int32)}
     */
    static FileRenameInfoEx => 22

    /**
     * @type {Integer (Int32)}
     */
    static FileCaseSensitiveInfo => 23

    /**
     * @type {Integer (Int32)}
     */
    static FileNormalizedNameInfo => 24

    /**
     * This value is used for validation. Supported values are less than this value.
     * @type {Integer (Int32)}
     */
    static MaximumFileInfoByHandleClass => 25
}

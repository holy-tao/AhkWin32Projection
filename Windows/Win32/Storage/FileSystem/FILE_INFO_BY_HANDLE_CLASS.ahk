#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies the type of file information that GetFileInformationByHandleEx should retrieve or SetFileInformationByHandle should set.
 * @remarks
 * As noted in the preceding section, some file information classes are valid only for use with 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getfileinformationbyhandleex">GetFileInformationByHandleEx</a>. Others are 
 *     valid only for use with 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-setfileinformationbyhandle">SetFileInformationByHandle</a>. Where neither 
 *     function is mentioned, the information class is valid with both functions.
 * @see https://learn.microsoft.com/windows/win32/api/minwinbase/ne-minwinbase-file_info_by_handle_class
 * @namespace Windows.Win32.Storage.FileSystem
 */
class FILE_INFO_BY_HANDLE_CLASS extends Win32Enum {

    /**
     * Minimal information for the file should be retrieved or set. Used for file handles. See 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-file_basic_info">FILE_BASIC_INFO</a>.
     * Native name: FileBasicInfo
     * @type {Integer (Int32)}
     */
    static BasicInfo => 0

    /**
     * Extended information for the file should be retrieved. Used for file handles. Use only when calling 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getfileinformationbyhandleex">GetFileInformationByHandleEx</a>. See 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-file_standard_info">FILE_STANDARD_INFO</a>.
     * Native name: FileStandardInfo
     * @type {Integer (Int32)}
     */
    static StandardInfo => 1

    /**
     * The file name should be retrieved. Used for any handles. Use only when calling 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getfileinformationbyhandleex">GetFileInformationByHandleEx</a>. See 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-file_name_info">FILE_NAME_INFO</a>.
     * Native name: FileNameInfo
     * @type {Integer (Int32)}
     */
    static NameInfo => 2

    /**
     * The file name should be changed. Used for file handles. Use only when calling 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-setfileinformationbyhandle">SetFileInformationByHandle</a>. See 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-file_rename_info">FILE_RENAME_INFO</a>.
     * Native name: FileRenameInfo
     * @type {Integer (Int32)}
     */
    static RenameInfo => 3

    /**
     * The file should be deleted. Used for any handles. Use only when calling 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-setfileinformationbyhandle">SetFileInformationByHandle</a>. See 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-file_disposition_info">FILE_DISPOSITION_INFO</a>.
     * Native name: FileDispositionInfo
     * @type {Integer (Int32)}
     */
    static DispositionInfo => 4

    /**
     * The file allocation information should be changed. Used for file handles. Use only when calling 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-setfileinformationbyhandle">SetFileInformationByHandle</a>. See 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-file_allocation_info">FILE ALLOCATION INFO</a>.
     * Native name: FileAllocationInfo
     * @type {Integer (Int32)}
     */
    static AllocationInfo => 5

    /**
     * The end of the file should be set. Use only when calling 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-setfileinformationbyhandle">SetFileInformationByHandle</a>. See 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-file_end_of_file_info">FILE_END_OF_FILE_INFO</a>.
     * Native name: FileEndOfFileInfo
     * @type {Integer (Int32)}
     */
    static EndOfFileInfo => 6

    /**
     * File stream information for the specified file should be retrieved. Used for any handles. Use only when calling 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getfileinformationbyhandleex">GetFileInformationByHandleEx</a>. See 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-file_stream_info">FILE_STREAM_INFO</a>.
     * Native name: FileStreamInfo
     * @type {Integer (Int32)}
     */
    static StreamInfo => 7

    /**
     * File compression information should be retrieved. Used for any handles. Use only when calling 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getfileinformationbyhandleex">GetFileInformationByHandleEx</a>. See 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-file_compression_info">FILE_COMPRESSION_INFO</a>.
     * Native name: FileCompressionInfo
     * @type {Integer (Int32)}
     */
    static CompressionInfo => 8

    /**
     * File attribute information should be retrieved. Used for any handles. Use only when calling 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getfileinformationbyhandleex">GetFileInformationByHandleEx</a>. See 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-file_attribute_tag_info">FILE_ATTRIBUTE_TAG_INFO</a>.
     * Native name: FileAttributeTagInfo
     * @type {Integer (Int32)}
     */
    static AttributeTagInfo => 9

    /**
     * Files in the specified directory should be retrieved. Used for directory handles. Use only when calling 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getfileinformationbyhandleex">GetFileInformationByHandleEx</a>. The number 
     *       of files returned for each call to 
     *       <b>GetFileInformationByHandleEx</b> depends on 
     *       the size of the buffer that is passed to the function. Any subsequent calls to 
     *       <b>GetFileInformationByHandleEx</b> on the same 
     *       handle will resume the enumeration operation after the last file is returned. See 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-file_id_both_dir_info">FILE_ID_BOTH_DIR_INFO</a>.
     * Native name: FileIdBothDirectoryInfo
     * @type {Integer (Int32)}
     */
    static IdBothDirectoryInfo => 10

    /**
     * Identical to <b>FileIdBothDirectoryInfo</b>, but forces the enumeration operation to 
     *       start again from the beginning. See 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-file_id_both_dir_info">FILE_ID_BOTH_DIR_INFO</a>.
     * Native name: FileIdBothDirectoryRestartInfo
     * @type {Integer (Int32)}
     */
    static IdBothDirectoryRestartInfo => 11

    /**
     * Priority hint information should be  set. Use only when calling 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-setfileinformationbyhandle">SetFileInformationByHandle</a>. See 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-file_io_priority_hint_info">FILE_IO_PRIORITY_HINT_INFO</a>.
     * Native name: FileIoPriorityHintInfo
     * @type {Integer (Int32)}
     */
    static IoPriorityHintInfo => 12

    /**
     * File remote protocol information should be retrieved. Use for any handles. Use only when calling 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getfileinformationbyhandleex">GetFileInformationByHandleEx</a>. See 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-file_remote_protocol_info">FILE_REMOTE_PROTOCOL_INFO</a>.
     * Native name: FileRemoteProtocolInfo
     * @type {Integer (Int32)}
     */
    static RemoteProtocolInfo => 13

    /**
     * Files in the specified directory should be retrieved. Used for directory handles. Use only when calling 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getfileinformationbyhandleex">GetFileInformationByHandleEx</a>. See 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-file_full_dir_info">FILE_FULL_DIR_INFO</a>.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported before Windows 8 and Windows Server 2012
     * Native name: FileFullDirectoryInfo
     * @type {Integer (Int32)}
     */
    static FullDirectoryInfo => 14

    /**
     * Identical to <b>FileFullDirectoryInfo</b>, but forces the enumeration operation to 
     *        start again from the beginning. Use only when calling 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getfileinformationbyhandleex">GetFileInformationByHandleEx</a>. See 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-file_full_dir_info">FILE_FULL_DIR_INFO</a>.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported before Windows 8 and Windows Server 2012
     * Native name: FileFullDirectoryRestartInfo
     * @type {Integer (Int32)}
     */
    static FullDirectoryRestartInfo => 15

    /**
     * File storage information should be retrieved. Use for any handles. Use only when calling 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getfileinformationbyhandleex">GetFileInformationByHandleEx</a>. See 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-file_storage_info">FILE_STORAGE_INFO</a>.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported before Windows 8 and Windows Server 2012
     * Native name: FileStorageInfo
     * @type {Integer (Int32)}
     */
    static StorageInfo => 16

    /**
     * File alignment information should be retrieved. Use for any handles. Use only when calling 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getfileinformationbyhandleex">GetFileInformationByHandleEx</a>. See 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-file_alignment_info">FILE_ALIGNMENT_INFO</a>.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported before Windows 8 and Windows Server 2012
     * Native name: FileAlignmentInfo
     * @type {Integer (Int32)}
     */
    static AlignmentInfo => 17

    /**
     * File information should be retrieved. Use for any handles. Use only when calling 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getfileinformationbyhandleex">GetFileInformationByHandleEx</a>. See 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-file_id_info">FILE_ID_INFO</a>.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported before Windows 8 and Windows Server 2012
     * Native name: FileIdInfo
     * @type {Integer (Int32)}
     */
    static IdInfo => 18

    /**
     * Files in the specified directory should be retrieved. Used for directory handles. Use only when calling 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getfileinformationbyhandleex">GetFileInformationByHandleEx</a>. See 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-file_id_extd_dir_info">FILE_ID_EXTD_DIR_INFO</a>.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported before Windows 8 and Windows Server 2012
     * Native name: FileIdExtdDirectoryInfo
     * @type {Integer (Int32)}
     */
    static IdExtdDirectoryInfo => 19

    /**
     * Identical to <b>FileIdExtdDirectoryInfo</b>, but forces the enumeration operation to 
     *        start again from the beginning. Use only when calling 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getfileinformationbyhandleex">GetFileInformationByHandleEx</a>. See 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-file_id_extd_dir_info">FILE_ID_EXTD_DIR_INFO</a>.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported before Windows 8 and Windows Server 2012
     * Native name: FileIdExtdDirectoryRestartInfo
     * @type {Integer (Int32)}
     */
    static IdExtdDirectoryRestartInfo => 20

    /**
     * Native name: FileDispositionInfoEx
     * @type {Integer (Int32)}
     */
    static DispositionInfoEx => 21

    /**
     * Native name: FileRenameInfoEx
     * @type {Integer (Int32)}
     */
    static RenameInfoEx => 22

    /**
     * Native name: FileCaseSensitiveInfo
     * @type {Integer (Int32)}
     */
    static CaseSensitiveInfo => 23

    /**
     * Native name: FileNormalizedNameInfo
     * @type {Integer (Int32)}
     */
    static NormalizedNameInfo => 24

    /**
     * This value is used for validation. Supported values are less than this value.
     * @type {Integer (Int32)}
     */
    static MaximumFileInfoByHandleClass => 25
}

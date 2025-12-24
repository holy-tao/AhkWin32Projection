#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class FILE_INFORMATION_CLASS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static FileDirectoryInformation => 1

    /**
     * @type {Integer (Int32)}
     */
    static FileFullDirectoryInformation => 2

    /**
     * @type {Integer (Int32)}
     */
    static FileBothDirectoryInformation => 3

    /**
     * @type {Integer (Int32)}
     */
    static FileBasicInformation => 4

    /**
     * @type {Integer (Int32)}
     */
    static FileStandardInformation => 5

    /**
     * @type {Integer (Int32)}
     */
    static FileInternalInformation => 6

    /**
     * @type {Integer (Int32)}
     */
    static FileEaInformation => 7

    /**
     * @type {Integer (Int32)}
     */
    static FileAccessInformation => 8

    /**
     * @type {Integer (Int32)}
     */
    static FileNameInformation => 9

    /**
     * @type {Integer (Int32)}
     */
    static FileRenameInformation => 10

    /**
     * @type {Integer (Int32)}
     */
    static FileLinkInformation => 11

    /**
     * @type {Integer (Int32)}
     */
    static FileNamesInformation => 12

    /**
     * @type {Integer (Int32)}
     */
    static FileDispositionInformation => 13

    /**
     * @type {Integer (Int32)}
     */
    static FilePositionInformation => 14

    /**
     * @type {Integer (Int32)}
     */
    static FileFullEaInformation => 15

    /**
     * @type {Integer (Int32)}
     */
    static FileModeInformation => 16

    /**
     * @type {Integer (Int32)}
     */
    static FileAlignmentInformation => 17

    /**
     * @type {Integer (Int32)}
     */
    static FileAllInformation => 18

    /**
     * @type {Integer (Int32)}
     */
    static FileAllocationInformation => 19

    /**
     * @type {Integer (Int32)}
     */
    static FileEndOfFileInformation => 20

    /**
     * @type {Integer (Int32)}
     */
    static FileAlternateNameInformation => 21

    /**
     * @type {Integer (Int32)}
     */
    static FileStreamInformation => 22

    /**
     * @type {Integer (Int32)}
     */
    static FilePipeInformation => 23

    /**
     * @type {Integer (Int32)}
     */
    static FilePipeLocalInformation => 24

    /**
     * @type {Integer (Int32)}
     */
    static FilePipeRemoteInformation => 25

    /**
     * @type {Integer (Int32)}
     */
    static FileMailslotQueryInformation => 26

    /**
     * @type {Integer (Int32)}
     */
    static FileMailslotSetInformation => 27

    /**
     * @type {Integer (Int32)}
     */
    static FileCompressionInformation => 28

    /**
     * @type {Integer (Int32)}
     */
    static FileObjectIdInformation => 29

    /**
     * @type {Integer (Int32)}
     */
    static FileCompletionInformation => 30

    /**
     * @type {Integer (Int32)}
     */
    static FileMoveClusterInformation => 31

    /**
     * @type {Integer (Int32)}
     */
    static FileQuotaInformation => 32

    /**
     * @type {Integer (Int32)}
     */
    static FileReparsePointInformation => 33

    /**
     * @type {Integer (Int32)}
     */
    static FileNetworkOpenInformation => 34

    /**
     * @type {Integer (Int32)}
     */
    static FileAttributeTagInformation => 35

    /**
     * @type {Integer (Int32)}
     */
    static FileTrackingInformation => 36

    /**
     * @type {Integer (Int32)}
     */
    static FileIdBothDirectoryInformation => 37

    /**
     * @type {Integer (Int32)}
     */
    static FileIdFullDirectoryInformation => 38

    /**
     * @type {Integer (Int32)}
     */
    static FileValidDataLengthInformation => 39

    /**
     * @type {Integer (Int32)}
     */
    static FileShortNameInformation => 40

    /**
     * @type {Integer (Int32)}
     */
    static FileIoCompletionNotificationInformation => 41

    /**
     * @type {Integer (Int32)}
     */
    static FileIoStatusBlockRangeInformation => 42

    /**
     * @type {Integer (Int32)}
     */
    static FileIoPriorityHintInformation => 43

    /**
     * @type {Integer (Int32)}
     */
    static FileSfioReserveInformation => 44

    /**
     * @type {Integer (Int32)}
     */
    static FileSfioVolumeInformation => 45

    /**
     * @type {Integer (Int32)}
     */
    static FileHardLinkInformation => 46

    /**
     * @type {Integer (Int32)}
     */
    static FileProcessIdsUsingFileInformation => 47

    /**
     * @type {Integer (Int32)}
     */
    static FileNormalizedNameInformation => 48

    /**
     * @type {Integer (Int32)}
     */
    static FileNetworkPhysicalNameInformation => 49

    /**
     * @type {Integer (Int32)}
     */
    static FileIdGlobalTxDirectoryInformation => 50

    /**
     * @type {Integer (Int32)}
     */
    static FileIsRemoteDeviceInformation => 51

    /**
     * @type {Integer (Int32)}
     */
    static FileUnusedInformation => 52

    /**
     * @type {Integer (Int32)}
     */
    static FileNumaNodeInformation => 53

    /**
     * @type {Integer (Int32)}
     */
    static FileStandardLinkInformation => 54

    /**
     * @type {Integer (Int32)}
     */
    static FileRemoteProtocolInformation => 55

    /**
     * @type {Integer (Int32)}
     */
    static FileRenameInformationBypassAccessCheck => 56

    /**
     * @type {Integer (Int32)}
     */
    static FileLinkInformationBypassAccessCheck => 57

    /**
     * @type {Integer (Int32)}
     */
    static FileVolumeNameInformation => 58

    /**
     * @type {Integer (Int32)}
     */
    static FileIdInformation => 59

    /**
     * @type {Integer (Int32)}
     */
    static FileIdExtdDirectoryInformation => 60

    /**
     * @type {Integer (Int32)}
     */
    static FileReplaceCompletionInformation => 61

    /**
     * @type {Integer (Int32)}
     */
    static FileHardLinkFullIdInformation => 62

    /**
     * @type {Integer (Int32)}
     */
    static FileIdExtdBothDirectoryInformation => 63

    /**
     * @type {Integer (Int32)}
     */
    static FileDispositionInformationEx => 64

    /**
     * @type {Integer (Int32)}
     */
    static FileRenameInformationEx => 65

    /**
     * @type {Integer (Int32)}
     */
    static FileRenameInformationExBypassAccessCheck => 66

    /**
     * @type {Integer (Int32)}
     */
    static FileDesiredStorageClassInformation => 67

    /**
     * @type {Integer (Int32)}
     */
    static FileStatInformation => 68

    /**
     * @type {Integer (Int32)}
     */
    static FileMemoryPartitionInformation => 69

    /**
     * @type {Integer (Int32)}
     */
    static FileStatLxInformation => 70

    /**
     * @type {Integer (Int32)}
     */
    static FileCaseSensitiveInformation => 71

    /**
     * @type {Integer (Int32)}
     */
    static FileLinkInformationEx => 72

    /**
     * @type {Integer (Int32)}
     */
    static FileLinkInformationExBypassAccessCheck => 73

    /**
     * @type {Integer (Int32)}
     */
    static FileStorageReserveIdInformation => 74

    /**
     * @type {Integer (Int32)}
     */
    static FileCaseSensitiveInformationForceAccessCheck => 75

    /**
     * @type {Integer (Int32)}
     */
    static FileKnownFolderInformation => 76

    /**
     * @type {Integer (Int32)}
     */
    static FileMaximumInformation => 77
}

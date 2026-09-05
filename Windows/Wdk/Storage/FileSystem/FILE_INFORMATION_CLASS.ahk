#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class FILE_INFORMATION_CLASS extends Win32Enum {

    /**
     * Native name: FileDirectoryInformation
     * @type {Integer (Int32)}
     */
    static DirectoryInformation => 1

    /**
     * Native name: FileFullDirectoryInformation
     * @type {Integer (Int32)}
     */
    static FullDirectoryInformation => 2

    /**
     * Native name: FileBothDirectoryInformation
     * @type {Integer (Int32)}
     */
    static BothDirectoryInformation => 3

    /**
     * Native name: FileBasicInformation
     * @type {Integer (Int32)}
     */
    static BasicInformation => 4

    /**
     * Native name: FileStandardInformation
     * @type {Integer (Int32)}
     */
    static StandardInformation => 5

    /**
     * Native name: FileInternalInformation
     * @type {Integer (Int32)}
     */
    static InternalInformation => 6

    /**
     * Native name: FileEaInformation
     * @type {Integer (Int32)}
     */
    static EaInformation => 7

    /**
     * Native name: FileAccessInformation
     * @type {Integer (Int32)}
     */
    static AccessInformation => 8

    /**
     * Native name: FileNameInformation
     * @type {Integer (Int32)}
     */
    static NameInformation => 9

    /**
     * Native name: FileRenameInformation
     * @type {Integer (Int32)}
     */
    static RenameInformation => 10

    /**
     * Native name: FileLinkInformation
     * @type {Integer (Int32)}
     */
    static LinkInformation => 11

    /**
     * Native name: FileNamesInformation
     * @type {Integer (Int32)}
     */
    static NamesInformation => 12

    /**
     * Native name: FileDispositionInformation
     * @type {Integer (Int32)}
     */
    static DispositionInformation => 13

    /**
     * Native name: FilePositionInformation
     * @type {Integer (Int32)}
     */
    static PositionInformation => 14

    /**
     * Native name: FileFullEaInformation
     * @type {Integer (Int32)}
     */
    static FullEaInformation => 15

    /**
     * Native name: FileModeInformation
     * @type {Integer (Int32)}
     */
    static ModeInformation => 16

    /**
     * Native name: FileAlignmentInformation
     * @type {Integer (Int32)}
     */
    static AlignmentInformation => 17

    /**
     * Native name: FileAllInformation
     * @type {Integer (Int32)}
     */
    static AllInformation => 18

    /**
     * Native name: FileAllocationInformation
     * @type {Integer (Int32)}
     */
    static AllocationInformation => 19

    /**
     * Native name: FileEndOfFileInformation
     * @type {Integer (Int32)}
     */
    static EndOfFileInformation => 20

    /**
     * Native name: FileAlternateNameInformation
     * @type {Integer (Int32)}
     */
    static AlternateNameInformation => 21

    /**
     * Native name: FileStreamInformation
     * @type {Integer (Int32)}
     */
    static StreamInformation => 22

    /**
     * Native name: FilePipeInformation
     * @type {Integer (Int32)}
     */
    static PipeInformation => 23

    /**
     * Native name: FilePipeLocalInformation
     * @type {Integer (Int32)}
     */
    static PipeLocalInformation => 24

    /**
     * Native name: FilePipeRemoteInformation
     * @type {Integer (Int32)}
     */
    static PipeRemoteInformation => 25

    /**
     * Native name: FileMailslotQueryInformation
     * @type {Integer (Int32)}
     */
    static MailslotQueryInformation => 26

    /**
     * Native name: FileMailslotSetInformation
     * @type {Integer (Int32)}
     */
    static MailslotSetInformation => 27

    /**
     * Native name: FileCompressionInformation
     * @type {Integer (Int32)}
     */
    static CompressionInformation => 28

    /**
     * Native name: FileObjectIdInformation
     * @type {Integer (Int32)}
     */
    static ObjectIdInformation => 29

    /**
     * Native name: FileCompletionInformation
     * @type {Integer (Int32)}
     */
    static CompletionInformation => 30

    /**
     * Native name: FileMoveClusterInformation
     * @type {Integer (Int32)}
     */
    static MoveClusterInformation => 31

    /**
     * Native name: FileQuotaInformation
     * @type {Integer (Int32)}
     */
    static QuotaInformation => 32

    /**
     * Native name: FileReparsePointInformation
     * @type {Integer (Int32)}
     */
    static ReparsePointInformation => 33

    /**
     * Native name: FileNetworkOpenInformation
     * @type {Integer (Int32)}
     */
    static NetworkOpenInformation => 34

    /**
     * Native name: FileAttributeTagInformation
     * @type {Integer (Int32)}
     */
    static AttributeTagInformation => 35

    /**
     * Native name: FileTrackingInformation
     * @type {Integer (Int32)}
     */
    static TrackingInformation => 36

    /**
     * Native name: FileIdBothDirectoryInformation
     * @type {Integer (Int32)}
     */
    static IdBothDirectoryInformation => 37

    /**
     * Native name: FileIdFullDirectoryInformation
     * @type {Integer (Int32)}
     */
    static IdFullDirectoryInformation => 38

    /**
     * Native name: FileValidDataLengthInformation
     * @type {Integer (Int32)}
     */
    static ValidDataLengthInformation => 39

    /**
     * Native name: FileShortNameInformation
     * @type {Integer (Int32)}
     */
    static ShortNameInformation => 40

    /**
     * Native name: FileIoCompletionNotificationInformation
     * @type {Integer (Int32)}
     */
    static IoCompletionNotificationInformation => 41

    /**
     * Native name: FileIoStatusBlockRangeInformation
     * @type {Integer (Int32)}
     */
    static IoStatusBlockRangeInformation => 42

    /**
     * Native name: FileIoPriorityHintInformation
     * @type {Integer (Int32)}
     */
    static IoPriorityHintInformation => 43

    /**
     * Native name: FileSfioReserveInformation
     * @type {Integer (Int32)}
     */
    static SfioReserveInformation => 44

    /**
     * Native name: FileSfioVolumeInformation
     * @type {Integer (Int32)}
     */
    static SfioVolumeInformation => 45

    /**
     * Native name: FileHardLinkInformation
     * @type {Integer (Int32)}
     */
    static HardLinkInformation => 46

    /**
     * Native name: FileProcessIdsUsingFileInformation
     * @type {Integer (Int32)}
     */
    static ProcessIdsUsingFileInformation => 47

    /**
     * Native name: FileNormalizedNameInformation
     * @type {Integer (Int32)}
     */
    static NormalizedNameInformation => 48

    /**
     * Native name: FileNetworkPhysicalNameInformation
     * @type {Integer (Int32)}
     */
    static NetworkPhysicalNameInformation => 49

    /**
     * Native name: FileIdGlobalTxDirectoryInformation
     * @type {Integer (Int32)}
     */
    static IdGlobalTxDirectoryInformation => 50

    /**
     * Native name: FileIsRemoteDeviceInformation
     * @type {Integer (Int32)}
     */
    static IsRemoteDeviceInformation => 51

    /**
     * Native name: FileUnusedInformation
     * @type {Integer (Int32)}
     */
    static UnusedInformation => 52

    /**
     * Native name: FileNumaNodeInformation
     * @type {Integer (Int32)}
     */
    static NumaNodeInformation => 53

    /**
     * Native name: FileStandardLinkInformation
     * @type {Integer (Int32)}
     */
    static StandardLinkInformation => 54

    /**
     * Native name: FileRemoteProtocolInformation
     * @type {Integer (Int32)}
     */
    static RemoteProtocolInformation => 55

    /**
     * Native name: FileRenameInformationBypassAccessCheck
     * @type {Integer (Int32)}
     */
    static RenameInformationBypassAccessCheck => 56

    /**
     * Native name: FileLinkInformationBypassAccessCheck
     * @type {Integer (Int32)}
     */
    static LinkInformationBypassAccessCheck => 57

    /**
     * Native name: FileVolumeNameInformation
     * @type {Integer (Int32)}
     */
    static VolumeNameInformation => 58

    /**
     * Native name: FileIdInformation
     * @type {Integer (Int32)}
     */
    static IdInformation => 59

    /**
     * Native name: FileIdExtdDirectoryInformation
     * @type {Integer (Int32)}
     */
    static IdExtdDirectoryInformation => 60

    /**
     * Native name: FileReplaceCompletionInformation
     * @type {Integer (Int32)}
     */
    static ReplaceCompletionInformation => 61

    /**
     * Native name: FileHardLinkFullIdInformation
     * @type {Integer (Int32)}
     */
    static HardLinkFullIdInformation => 62

    /**
     * Native name: FileIdExtdBothDirectoryInformation
     * @type {Integer (Int32)}
     */
    static IdExtdBothDirectoryInformation => 63

    /**
     * Native name: FileDispositionInformationEx
     * @type {Integer (Int32)}
     */
    static DispositionInformationEx => 64

    /**
     * Native name: FileRenameInformationEx
     * @type {Integer (Int32)}
     */
    static RenameInformationEx => 65

    /**
     * Native name: FileRenameInformationExBypassAccessCheck
     * @type {Integer (Int32)}
     */
    static RenameInformationExBypassAccessCheck => 66

    /**
     * Native name: FileDesiredStorageClassInformation
     * @type {Integer (Int32)}
     */
    static DesiredStorageClassInformation => 67

    /**
     * Native name: FileStatInformation
     * @type {Integer (Int32)}
     */
    static StatInformation => 68

    /**
     * Native name: FileMemoryPartitionInformation
     * @type {Integer (Int32)}
     */
    static MemoryPartitionInformation => 69

    /**
     * Native name: FileStatLxInformation
     * @type {Integer (Int32)}
     */
    static StatLxInformation => 70

    /**
     * Native name: FileCaseSensitiveInformation
     * @type {Integer (Int32)}
     */
    static CaseSensitiveInformation => 71

    /**
     * Native name: FileLinkInformationEx
     * @type {Integer (Int32)}
     */
    static LinkInformationEx => 72

    /**
     * Native name: FileLinkInformationExBypassAccessCheck
     * @type {Integer (Int32)}
     */
    static LinkInformationExBypassAccessCheck => 73

    /**
     * Native name: FileStorageReserveIdInformation
     * @type {Integer (Int32)}
     */
    static StorageReserveIdInformation => 74

    /**
     * Native name: FileCaseSensitiveInformationForceAccessCheck
     * @type {Integer (Int32)}
     */
    static CaseSensitiveInformationForceAccessCheck => 75

    /**
     * Native name: FileKnownFolderInformation
     * @type {Integer (Int32)}
     */
    static KnownFolderInformation => 76

    /**
     * Native name: FileMaximumInformation
     * @type {Integer (Int32)}
     */
    static MaximumInformation => 77
}

#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Storage.Jet
 * @version v4.0.30319
 */
class Jet {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static JET_VERSION => 1280

    /**
     * @type {String}
     */
    static JET_wszConfigStoreReadControl => "CsReadControl"

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitConfigStoreReadControlInhibitRead => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitConfigStoreReadControlDisableAll => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitConfigStoreReadControlDefault => 0

    /**
     * @type {String}
     */
    static JET_wszConfigStoreRelPathSysParamDefault => "SysParamDefault"

    /**
     * @type {String}
     */
    static JET_wszConfigStoreRelPathSysParamOverride => "SysParamOverride"

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitDefragmentBatchStart => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitDefragmentBatchStop => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitDefragmentAvailSpaceTreesOnly => 64

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitDefragmentNoPartialMerges => 128

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitDefragmentBTree => 256

    /**
     * @type {Integer (UInt32)}
     */
    static JET_cbtypNull => 0

    /**
     * @type {Integer (UInt32)}
     */
    static JET_cbtypFinalize => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_cbtypBeforeInsert => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JET_cbtypAfterInsert => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JET_cbtypBeforeReplace => 8

    /**
     * @type {Integer (UInt32)}
     */
    static JET_cbtypAfterReplace => 16

    /**
     * @type {Integer (UInt32)}
     */
    static JET_cbtypBeforeDelete => 32

    /**
     * @type {Integer (UInt32)}
     */
    static JET_cbtypAfterDelete => 64

    /**
     * @type {Integer (UInt32)}
     */
    static JET_cbtypUserDefinedDefaultValue => 128

    /**
     * @type {Integer (UInt32)}
     */
    static JET_cbtypOnlineDefragCompleted => 256

    /**
     * @type {Integer (UInt32)}
     */
    static JET_cbtypFreeCursorLS => 512

    /**
     * @type {Integer (UInt32)}
     */
    static JET_cbtypFreeTableLS => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTableInfoUpdatable => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTableInfoBookmark => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTableInfoRollback => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitObjectSystem => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitObjectTableFixedDDL => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitObjectTableTemplate => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitObjectTableDerived => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitObjectTableNoFixedVarColumnsInDerivedTables => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static cObjectInfoCols => 9

    /**
     * @type {Integer (UInt32)}
     */
    static cColumnInfoCols => 14

    /**
     * @type {Integer (UInt32)}
     */
    static cIndexInfoCols => 15

    /**
     * @type {Integer (UInt32)}
     */
    static JET_MAX_COMPUTERNAME_LENGTH => 15

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitDurableCommitCallbackLogUnavailable => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_cbBookmarkMost => 256

    /**
     * @type {Integer (UInt32)}
     */
    static JET_cbNameMost => 64

    /**
     * @type {Integer (UInt32)}
     */
    static JET_cbFullNameMost => 255

    /**
     * @type {Integer (UInt32)}
     */
    static JET_cbColumnLVPageOverhead => 82

    /**
     * @type {Integer (UInt32)}
     */
    static JET_cbLVDefaultValueMost => 255

    /**
     * @type {Integer (UInt32)}
     */
    static JET_cbColumnMost => 255

    /**
     * @type {Integer (UInt32)}
     */
    static JET_cbLVColumnMost => 2147483647

    /**
     * @type {Integer (UInt32)}
     */
    static JET_cbKeyMost8KBytePage => 2000

    /**
     * @type {Integer (UInt32)}
     */
    static JET_cbKeyMost4KBytePage => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static JET_cbKeyMost2KBytePage => 500

    /**
     * @type {Integer (UInt32)}
     */
    static JET_cbKeyMostMin => 255

    /**
     * @type {Integer (UInt32)}
     */
    static JET_cbKeyMost => 255

    /**
     * @type {Integer (UInt32)}
     */
    static JET_cbLimitKeyMost => 256

    /**
     * @type {Integer (UInt32)}
     */
    static JET_cbPrimaryKeyMost => 255

    /**
     * @type {Integer (UInt32)}
     */
    static JET_cbSecondaryKeyMost => 255

    /**
     * @type {Integer (UInt32)}
     */
    static JET_ccolKeyMost => 16

    /**
     * @type {Integer (UInt32)}
     */
    static JET_ccolMost => 65248

    /**
     * @type {Integer (UInt32)}
     */
    static JET_ccolFixedMost => 127

    /**
     * @type {Integer (UInt32)}
     */
    static JET_ccolVarMost => 128

    /**
     * @type {Integer (UInt32)}
     */
    static JET_ccolTaggedMost => 64993

    /**
     * @type {Integer (UInt32)}
     */
    static JET_EventLoggingDisable => 0

    /**
     * @type {Integer (UInt32)}
     */
    static JET_EventLoggingLevelMin => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_EventLoggingLevelLow => 25

    /**
     * @type {Integer (UInt32)}
     */
    static JET_EventLoggingLevelMedium => 50

    /**
     * @type {Integer (UInt32)}
     */
    static JET_EventLoggingLevelHigh => 75

    /**
     * @type {Integer (UInt32)}
     */
    static JET_EventLoggingLevelMax => 100

    /**
     * @type {Integer (UInt32)}
     */
    static JET_IOPriorityNormal => 0

    /**
     * @type {Integer (UInt32)}
     */
    static JET_IOPriorityLow => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_configDefault => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_configRemoveQuotas => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JET_configLowDiskFootprint => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JET_configMediumDiskFootprint => 8

    /**
     * @type {Integer (UInt32)}
     */
    static JET_configLowMemory => 16

    /**
     * @type {Integer (UInt32)}
     */
    static JET_configDynamicMediumMemory => 32

    /**
     * @type {Integer (UInt32)}
     */
    static JET_configLowPower => 64

    /**
     * @type {Integer (UInt32)}
     */
    static JET_configSSDProfileIO => 128

    /**
     * @type {Integer (UInt32)}
     */
    static JET_configRunSilent => 256

    /**
     * @type {Integer (UInt32)}
     */
    static JET_configUnthrottledMemory => 512

    /**
     * @type {Integer (UInt32)}
     */
    static JET_configHighConcurrencyScaling => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramSystemPath => 0

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramTempPath => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramLogFilePath => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramBaseName => 3

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramEventSource => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramMaxSessions => 5

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramMaxOpenTables => 6

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramPreferredMaxOpenTables => 7

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramCachedClosedTables => 125

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramMaxCursors => 8

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramMaxVerPages => 9

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramPreferredVerPages => 63

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramGlobalMinVerPages => 81

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramVersionStoreTaskQueueMax => 105

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramMaxTemporaryTables => 10

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramLogFileSize => 11

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramLogBuffers => 12

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramWaitLogFlush => 13

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramLogCheckpointPeriod => 14

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramLogWaitingUserMax => 15

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramCommitDefault => 16

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramCircularLog => 17

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramDbExtensionSize => 18

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramPageTempDBMin => 19

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramPageFragment => 20

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramEnableFileCache => 126

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramVerPageSize => 128

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramConfiguration => 129

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramEnableAdvanced => 130

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramMaxColtyp => 131

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramBatchIOBufferMax => 22

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramCacheSize => 41

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramCacheSizeMin => 60

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramCacheSizeMax => 23

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramCheckpointDepthMax => 24

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramLRUKCorrInterval => 25

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramLRUKHistoryMax => 26

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramLRUKPolicy => 27

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramLRUKTimeout => 28

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramLRUKTrxCorrInterval => 29

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramOutstandingIOMax => 30

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramStartFlushThreshold => 31

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramStopFlushThreshold => 32

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramEnableViewCache => 127

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramCheckpointIOMax => 135

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramTableClass1Name => 137

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramTableClass2Name => 138

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramTableClass3Name => 139

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramTableClass4Name => 140

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramTableClass5Name => 141

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramTableClass6Name => 142

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramTableClass7Name => 143

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramTableClass8Name => 144

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramTableClass9Name => 145

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramTableClass10Name => 146

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramTableClass11Name => 147

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramTableClass12Name => 148

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramTableClass13Name => 149

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramTableClass14Name => 150

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramTableClass15Name => 151

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramIOPriority => 152

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramRecovery => 34

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramEnableOnlineDefrag => 35

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramCheckFormatWhenOpenFail => 44

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramEnableTempTableVersioning => 46

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramIgnoreLogVersion => 47

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramDeleteOldLogs => 48

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramEventSourceKey => 49

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramNoInformationEvent => 50

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramEventLoggingLevel => 51

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramDeleteOutOfRangeLogs => 52

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramAccessDeniedRetryPeriod => 53

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramEnableIndexChecking => 45

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramEnableIndexCleanup => 54

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramDatabasePageSize => 64

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramDisableCallbacks => 65

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramLogFileCreateAsynch => 69

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramErrorToString => 70

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramZeroDatabaseDuringBackup => 71

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramUnicodeIndexDefault => 72

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramRuntimeCallback => 73

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramCleanupMismatchedLogFiles => 77

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramRecordUpgradeDirtyLevel => 78

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramOSSnapshotTimeout => 82

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramExceptionAction => 98

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramEventLogCache => 99

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramCreatePathIfNotExist => 100

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramPageHintCacheSize => 101

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramOneDatabasePerSession => 102

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramMaxInstances => 104

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramDisablePerfmon => 107

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramIndexTuplesLengthMin => 110

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramIndexTuplesLengthMax => 111

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramIndexTuplesToIndexMax => 112

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramAlternateDatabaseRecoveryPath => 113

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramIndexTupleIncrement => 132

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramIndexTupleStart => 133

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramKeyMost => 134

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramLegacyFileNames => 136

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramEnablePersistedCallbacks => 156

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramWaypointLatency => 153

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramDefragmentSequentialBTrees => 160

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramDefragmentSequentialBTreesDensityCheckFrequency => 161

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramIOThrottlingTimeQuanta => 162

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramLVChunkSizeMost => 163

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramMaxCoalesceReadSize => 164

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramMaxCoalesceWriteSize => 165

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramMaxCoalesceReadGapSize => 166

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramMaxCoalesceWriteGapSize => 167

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramEnableDBScanInRecovery => 169

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramDbScanThrottle => 170

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramDbScanIntervalMinSec => 171

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramDbScanIntervalMaxSec => 172

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramCachePriority => 177

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramMaxTransactionSize => 178

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramPrereadIOMax => 179

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramEnableDBScanSerialization => 180

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramHungIOThreshold => 181

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramHungIOActions => 182

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramMinDataForXpress => 183

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramEnableShrinkDatabase => 184

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramProcessFriendlyName => 186

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramDurableCommitCallback => 187

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramEnableSqm => 188

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramConfigStoreSpec => 189

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramUseFlushForWriteDurability => 214

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramEnableRBS => 215

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramRBSFilePath => 216

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramPerfmonRefreshInterval => 217

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramMaxValueInvalid => 218

    /**
     * @type {Integer (UInt32)}
     */
    static JET_sesparamCommitDefault => 4097

    /**
     * @type {Integer (UInt32)}
     */
    static JET_sesparamTransactionLevel => 4099

    /**
     * @type {Integer (UInt32)}
     */
    static JET_sesparamOperationContext => 4100

    /**
     * @type {Integer (UInt32)}
     */
    static JET_sesparamCorrelationID => 4101

    /**
     * @type {Integer (UInt32)}
     */
    static JET_sesparamMaxValueInvalid => 4111

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitESE98FileNames => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitEightDotThreeSoftCompat => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitHungIOEvent => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitShrinkDatabaseOff => 0

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitShrinkDatabaseOn => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitShrinkDatabaseRealtime => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitShrinkDatabaseTrim => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitReplayIgnoreMissingDB => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitRecoveryWithoutUndo => 8

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTruncateLogsAfterRecovery => 16

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitReplayMissingMapEntryDB => 32

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitLogStreamMustExist => 64

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitReplayIgnoreLostLogs => 128

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitKeepDbAttachedAtEndOfRecovery => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTermComplete => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTermAbrupt => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTermStopBackup => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTermDirty => 8

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitIdleFlushBuffers => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitIdleCompact => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitIdleStatus => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitDbReadOnly => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitDbExclusive => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitDbDeleteCorruptIndexes => 16

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitDbDeleteUnicodeIndexes => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitDbUpgrade => 512

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitDbEnableBackgroundMaintenance => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitDbPurgeCacheOnAttach => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitForceDetach => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitDbRecoveryOff => 8

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitDbShadowingOff => 128

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitDbOverwriteExisting => 512

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitBackupIncremental => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitBackupAtomic => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitBackupSnapshot => 16

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitBackupEndNormal => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitBackupEndAbort => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitBackupTruncateDone => 256

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTableCreateFixedDDL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTableCreateTemplateTable => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTableCreateNoFixedVarColumnsInDerivedTables => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTableCreateImmutableStructure => 8

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitColumnFixed => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitColumnTagged => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitColumnNotNULL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitColumnVersion => 8

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitColumnAutoincrement => 16

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitColumnUpdatable => 32

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitColumnTTKey => 64

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitColumnTTDescending => 128

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitColumnMultiValued => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitColumnEscrowUpdate => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitColumnUnversioned => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitColumnMaybeNull => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitColumnFinalize => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitColumnUserDefinedDefault => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitColumnDeleteOnZero => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitColumnCompressed => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitDeleteColumnIgnoreTemplateColumns => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitMoveFirst => 0

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitNoMove => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitNewKey => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitStrLimit => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitSubStrLimit => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitNormalizedKey => 8

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitKeyDataZeroLength => 16

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitFullColumnStartLimit => 256

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitFullColumnEndLimit => 512

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitPartialColumnStartLimit => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitPartialColumnEndLimit => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitRangeInclusive => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitRangeUpperLimit => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitRangeInstantDuration => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitRangeRemove => 8

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitReadLock => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitWriteLock => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JET_MoveFirst => 2147483648

    /**
     * @type {Integer (Int32)}
     */
    static JET_MovePrevious => -1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_MoveLast => 2147483647

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitMoveKeyNE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitSeekEQ => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitSeekLT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitSeekLE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitSeekGE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitSeekGT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitSetIndexRange => 32

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitCheckUniqueness => 64

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitBookmarkPermitVirtualCurrency => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitIndexColumnMustBeNull => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitIndexColumnMustBeNonNull => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitRecordInIndex => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitRecordNotInIndex => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitIndexUnique => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitIndexPrimary => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitIndexDisallowNull => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitIndexIgnoreNull => 8

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitIndexIgnoreAnyNull => 32

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitIndexIgnoreFirstNull => 64

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitIndexLazyFlush => 128

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitIndexEmpty => 256

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitIndexUnversioned => 512

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitIndexSortNullsHigh => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitIndexUnicode => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitIndexTuples => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitIndexTupleLimits => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitIndexCrossProduct => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitIndexKeyMost => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitIndexDisallowTruncation => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitIndexNestedTable => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitIndexDotNetGuid => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitIndexImmutableStructure => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitKeyAscending => 0

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitKeyDescending => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTableDenyWrite => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTableDenyRead => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTableReadOnly => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTableUpdatable => 8

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTablePermitDDL => 16

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTableNoCache => 32

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTablePreread => 64

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTableOpportuneRead => 128

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTableSequential => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTableClassMask => 2031616

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTableClassNone => 0

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTableClass1 => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTableClass2 => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTableClass3 => 196608

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTableClass4 => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTableClass5 => 327680

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTableClass6 => 393216

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTableClass7 => 458752

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTableClass8 => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTableClass9 => 589824

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTableClass10 => 655360

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTableClass11 => 720896

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTableClass12 => 786432

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTableClass13 => 851968

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTableClass14 => 917504

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTableClass15 => 983040

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitLSReset => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitLSCursor => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitLSTable => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitPrereadForward => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitPrereadBackward => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitPrereadFirstPage => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitPrereadNormalizedKey => 8

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTTIndexed => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTTUnique => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTTUpdatable => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTTScrollable => 8

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTTSortNullsHigh => 16

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTTForceMaterialization => 32

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTTErrorOnDuplicateInsertion => 32

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTTForwardOnly => 64

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTTIntrinsicLVsOnly => 128

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTTDotNetGuid => 256

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitSetAppendLV => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitSetOverwriteLV => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitSetSizeLV => 8

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitSetZeroLength => 32

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitSetSeparateLV => 64

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitSetUniqueMultiValues => 128

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitSetUniqueNormalizedMultiValues => 256

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitSetRevertToDefaultValue => 512

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitSetIntrinsicLV => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitSetUncompressed => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitSetCompressed => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitSetContiguousLV => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitSpaceHintsUtilizeParentSpace => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitCreateHintAppendSequential => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitCreateHintHotpointSequential => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitRetrieveHintReserve1 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitRetrieveHintTableScanForward => 16

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitRetrieveHintTableScanBackward => 32

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitRetrieveHintReserve2 => 64

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitRetrieveHintReserve3 => 128

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitDeleteHintTableSequential => 256

    /**
     * @type {Integer (UInt32)}
     */
    static JET_prepInsert => 0

    /**
     * @type {Integer (UInt32)}
     */
    static JET_prepReplace => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JET_prepCancel => 3

    /**
     * @type {Integer (UInt32)}
     */
    static JET_prepReplaceNoLock => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JET_prepInsertCopy => 5

    /**
     * @type {Integer (UInt32)}
     */
    static JET_prepInsertCopyDeleteOriginal => 7

    /**
     * @type {Integer (UInt32)}
     */
    static JET_prepInsertCopyReplaceOriginal => 9

    /**
     * @type {Integer (UInt32)}
     */
    static JET_sqmDisable => 0

    /**
     * @type {Integer (UInt32)}
     */
    static JET_sqmEnable => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_sqmFromCEIP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitUpdateCheckESE97Compatibility => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitEscrowNoRollback => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitRetrieveCopy => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitRetrieveFromIndex => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitRetrieveFromPrimaryBookmark => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitRetrieveTag => 8

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitRetrieveNull => 16

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitRetrieveIgnoreDefault => 32

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitRetrieveTuple => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitZeroLength => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitEnumerateCopy => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitEnumerateIgnoreDefault => 32

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitEnumeratePresenceOnly => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitEnumerateTaggedOnly => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitEnumerateCompressOutput => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitEnumerateIgnoreUserDefinedDefault => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitEnumerateInRecordOnly => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitRecordSizeInCopyBuffer => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitRecordSizeRunningTotal => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitRecordSizeLocal => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitTransactionReadOnly => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitCommitLazyFlush => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitWaitLastLevel0Commit => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitWaitAllLevel0Commit => 8

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitForceNewLog => 16

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitRollbackAll => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitIncrementalSnapshot => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitCopySnapshot => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitContinueAfterThaw => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitExplicitPrepare => 8

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitAllDatabasesSnapshot => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitAbortSnapshot => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_DbInfoFilename => 0

    /**
     * @type {Integer (UInt32)}
     */
    static JET_DbInfoConnect => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_DbInfoCountry => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JET_DbInfoLCID => 3

    /**
     * @type {Integer (UInt32)}
     */
    static JET_DbInfoLangid => 3

    /**
     * @type {Integer (UInt32)}
     */
    static JET_DbInfoCp => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JET_DbInfoCollate => 5

    /**
     * @type {Integer (UInt32)}
     */
    static JET_DbInfoOptions => 6

    /**
     * @type {Integer (UInt32)}
     */
    static JET_DbInfoTransactions => 7

    /**
     * @type {Integer (UInt32)}
     */
    static JET_DbInfoVersion => 8

    /**
     * @type {Integer (UInt32)}
     */
    static JET_DbInfoIsam => 9

    /**
     * @type {Integer (UInt32)}
     */
    static JET_DbInfoFilesize => 10

    /**
     * @type {Integer (UInt32)}
     */
    static JET_DbInfoSpaceOwned => 11

    /**
     * @type {Integer (UInt32)}
     */
    static JET_DbInfoSpaceAvailable => 12

    /**
     * @type {Integer (UInt32)}
     */
    static JET_DbInfoUpgrade => 13

    /**
     * @type {Integer (UInt32)}
     */
    static JET_DbInfoMisc => 14

    /**
     * @type {Integer (UInt32)}
     */
    static JET_DbInfoDBInUse => 15

    /**
     * @type {Integer (UInt32)}
     */
    static JET_DbInfoPageSize => 17

    /**
     * @type {Integer (UInt32)}
     */
    static JET_DbInfoFileType => 19

    /**
     * @type {Integer (UInt32)}
     */
    static JET_DbInfoFilesizeOnDisk => 21

    /**
     * @type {Integer (UInt32)}
     */
    static JET_dbstateJustCreated => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_dbstateDirtyShutdown => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JET_dbstateCleanShutdown => 3

    /**
     * @type {Integer (UInt32)}
     */
    static JET_dbstateBeingConverted => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JET_dbstateForceDetach => 5

    /**
     * @type {Integer (UInt32)}
     */
    static JET_filetypeUnknown => 0

    /**
     * @type {Integer (UInt32)}
     */
    static JET_filetypeDatabase => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_filetypeLog => 3

    /**
     * @type {Integer (UInt32)}
     */
    static JET_filetypeCheckpoint => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JET_filetypeTempDatabase => 5

    /**
     * @type {Integer (UInt32)}
     */
    static JET_filetypeFlushMap => 7

    /**
     * @type {Integer (UInt32)}
     */
    static JET_coltypNil => 0

    /**
     * @type {Integer (UInt32)}
     */
    static JET_coltypBit => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_coltypUnsignedByte => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JET_coltypShort => 3

    /**
     * @type {Integer (UInt32)}
     */
    static JET_coltypLong => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JET_coltypCurrency => 5

    /**
     * @type {Integer (UInt32)}
     */
    static JET_coltypIEEESingle => 6

    /**
     * @type {Integer (UInt32)}
     */
    static JET_coltypIEEEDouble => 7

    /**
     * @type {Integer (UInt32)}
     */
    static JET_coltypDateTime => 8

    /**
     * @type {Integer (UInt32)}
     */
    static JET_coltypBinary => 9

    /**
     * @type {Integer (UInt32)}
     */
    static JET_coltypText => 10

    /**
     * @type {Integer (UInt32)}
     */
    static JET_coltypLongBinary => 11

    /**
     * @type {Integer (UInt32)}
     */
    static JET_coltypLongText => 12

    /**
     * @type {Integer (UInt32)}
     */
    static JET_coltypMax => 13

    /**
     * @type {Integer (UInt32)}
     */
    static JET_coltypSLV => 13

    /**
     * @type {Integer (UInt32)}
     */
    static JET_coltypUnsignedLong => 14

    /**
     * @type {Integer (UInt32)}
     */
    static JET_coltypLongLong => 15

    /**
     * @type {Integer (UInt32)}
     */
    static JET_coltypGUID => 16

    /**
     * @type {Integer (UInt32)}
     */
    static JET_coltypUnsignedShort => 17

    /**
     * @type {Integer (UInt32)}
     */
    static JET_coltypUnsignedLongLong => 18

    /**
     * @type {Integer (UInt32)}
     */
    static JET_ColInfoGrbitNonDerivedColumnsOnly => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static JET_ColInfoGrbitMinimalInfo => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static JET_ColInfoGrbitSortByColumnid => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static JET_objtypNil => 0

    /**
     * @type {Integer (UInt32)}
     */
    static JET_objtypTable => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitCompactStats => 32

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitCompactRepair => 64

    /**
     * @type {Integer (UInt32)}
     */
    static JET_snpRepair => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JET_snpCompact => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JET_snpRestore => 8

    /**
     * @type {Integer (UInt32)}
     */
    static JET_snpBackup => 9

    /**
     * @type {Integer (UInt32)}
     */
    static JET_snpUpgrade => 10

    /**
     * @type {Integer (UInt32)}
     */
    static JET_snpScrub => 11

    /**
     * @type {Integer (UInt32)}
     */
    static JET_snpUpgradeRecordFormat => 12

    /**
     * @type {Integer (UInt32)}
     */
    static JET_sntBegin => 5

    /**
     * @type {Integer (UInt32)}
     */
    static JET_sntRequirements => 7

    /**
     * @type {Integer (UInt32)}
     */
    static JET_sntProgress => 0

    /**
     * @type {Integer (UInt32)}
     */
    static JET_sntComplete => 6

    /**
     * @type {Integer (UInt32)}
     */
    static JET_sntFail => 3

    /**
     * @type {Integer (UInt32)}
     */
    static JET_ExceptionMsgBox => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_ExceptionNone => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JET_ExceptionFailFast => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JET_OnlineDefragDisable => 0

    /**
     * @type {Integer (UInt32)}
     */
    static JET_OnlineDefragAllOBSOLETE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_OnlineDefragDatabases => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JET_OnlineDefragSpaceTrees => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JET_OnlineDefragAll => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitResizeDatabaseOnlyGrow => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitResizeDatabaseOnlyShrink => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitStopServiceAll => 0

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitStopServiceBackgroundUserTasks => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitStopServiceQuiesceCaches => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitStopServiceResume => 2147483648

    /**
     * @type {Integer (Int32)}
     */
    static JET_errSuccess => 0

    /**
     * @type {Integer (Int32)}
     */
    static JET_wrnNyi => -1

    /**
     * @type {Integer (Int32)}
     */
    static JET_errRfsFailure => -100

    /**
     * @type {Integer (Int32)}
     */
    static JET_errRfsNotArmed => -101

    /**
     * @type {Integer (Int32)}
     */
    static JET_errFileClose => -102

    /**
     * @type {Integer (Int32)}
     */
    static JET_errOutOfThreads => -103

    /**
     * @type {Integer (Int32)}
     */
    static JET_errTooManyIO => -105

    /**
     * @type {Integer (Int32)}
     */
    static JET_errTaskDropped => -106

    /**
     * @type {Integer (Int32)}
     */
    static JET_errInternalError => -107

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDisabledFunctionality => -112

    /**
     * @type {Integer (Int32)}
     */
    static JET_errUnloadableOSFunctionality => -113

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDatabaseBufferDependenciesCorrupted => -255

    /**
     * @type {Integer (UInt32)}
     */
    static JET_wrnRemainingVersions => 321

    /**
     * @type {Integer (Int32)}
     */
    static JET_errPreviousVersion => -322

    /**
     * @type {Integer (Int32)}
     */
    static JET_errPageBoundary => -323

    /**
     * @type {Integer (Int32)}
     */
    static JET_errKeyBoundary => -324

    /**
     * @type {Integer (Int32)}
     */
    static JET_errBadPageLink => -327

    /**
     * @type {Integer (Int32)}
     */
    static JET_errBadBookmark => -328

    /**
     * @type {Integer (Int32)}
     */
    static JET_errNTSystemCallFailed => -334

    /**
     * @type {Integer (Int32)}
     */
    static JET_errBadParentPageLink => -338

    /**
     * @type {Integer (Int32)}
     */
    static JET_errSPAvailExtCacheOutOfSync => -340

    /**
     * @type {Integer (Int32)}
     */
    static JET_errSPAvailExtCorrupted => -341

    /**
     * @type {Integer (Int32)}
     */
    static JET_errSPAvailExtCacheOutOfMemory => -342

    /**
     * @type {Integer (Int32)}
     */
    static JET_errSPOwnExtCorrupted => -343

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDbTimeCorrupted => -344

    /**
     * @type {Integer (UInt32)}
     */
    static JET_wrnUniqueKey => 345

    /**
     * @type {Integer (Int32)}
     */
    static JET_errKeyTruncated => -346

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDatabaseLeakInSpace => -348

    /**
     * @type {Integer (Int32)}
     */
    static JET_errBadEmptyPage => -351

    /**
     * @type {Integer (UInt32)}
     */
    static wrnBTNotVisibleRejected => 352

    /**
     * @type {Integer (UInt32)}
     */
    static wrnBTNotVisibleAccumulated => 353

    /**
     * @type {Integer (Int32)}
     */
    static JET_errBadLineCount => -354

    /**
     * @type {Integer (Int32)}
     */
    static JET_errPageTagCorrupted => -357

    /**
     * @type {Integer (Int32)}
     */
    static JET_errNodeCorrupted => -358

    /**
     * @type {Integer (UInt32)}
     */
    static JET_wrnSeparateLongValue => 406

    /**
     * @type {Integer (Int32)}
     */
    static JET_errKeyTooBig => -408

    /**
     * @type {Integer (Int32)}
     */
    static JET_errCannotSeparateIntrinsicLV => -416

    /**
     * @type {Integer (Int32)}
     */
    static JET_errSeparatedLongValue => -421

    /**
     * @type {Integer (Int32)}
     */
    static JET_errMustBeSeparateLongValue => -423

    /**
     * @type {Integer (Int32)}
     */
    static JET_errInvalidPreread => -424

    /**
     * @type {Integer (Int32)}
     */
    static JET_errInvalidLoggedOperation => -500

    /**
     * @type {Integer (Int32)}
     */
    static JET_errLogFileCorrupt => -501

    /**
     * @type {Integer (Int32)}
     */
    static JET_errNoBackupDirectory => -503

    /**
     * @type {Integer (Int32)}
     */
    static JET_errBackupDirectoryNotEmpty => -504

    /**
     * @type {Integer (Int32)}
     */
    static JET_errBackupInProgress => -505

    /**
     * @type {Integer (Int32)}
     */
    static JET_errRestoreInProgress => -506

    /**
     * @type {Integer (Int32)}
     */
    static JET_errMissingPreviousLogFile => -509

    /**
     * @type {Integer (Int32)}
     */
    static JET_errLogWriteFail => -510

    /**
     * @type {Integer (Int32)}
     */
    static JET_errLogDisabledDueToRecoveryFailure => -511

    /**
     * @type {Integer (Int32)}
     */
    static JET_errCannotLogDuringRecoveryRedo => -512

    /**
     * @type {Integer (Int32)}
     */
    static JET_errLogGenerationMismatch => -513

    /**
     * @type {Integer (Int32)}
     */
    static JET_errBadLogVersion => -514

    /**
     * @type {Integer (Int32)}
     */
    static JET_errInvalidLogSequence => -515

    /**
     * @type {Integer (Int32)}
     */
    static JET_errLoggingDisabled => -516

    /**
     * @type {Integer (Int32)}
     */
    static JET_errLogBufferTooSmall => -517

    /**
     * @type {Integer (Int32)}
     */
    static JET_errLogSequenceEnd => -519

    /**
     * @type {Integer (Int32)}
     */
    static JET_errNoBackup => -520

    /**
     * @type {Integer (Int32)}
     */
    static JET_errInvalidBackupSequence => -521

    /**
     * @type {Integer (Int32)}
     */
    static JET_errBackupNotAllowedYet => -523

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDeleteBackupFileFail => -524

    /**
     * @type {Integer (Int32)}
     */
    static JET_errMakeBackupDirectoryFail => -525

    /**
     * @type {Integer (Int32)}
     */
    static JET_errInvalidBackup => -526

    /**
     * @type {Integer (Int32)}
     */
    static JET_errRecoveredWithErrors => -527

    /**
     * @type {Integer (Int32)}
     */
    static JET_errMissingLogFile => -528

    /**
     * @type {Integer (Int32)}
     */
    static JET_errLogDiskFull => -529

    /**
     * @type {Integer (Int32)}
     */
    static JET_errBadLogSignature => -530

    /**
     * @type {Integer (Int32)}
     */
    static JET_errBadDbSignature => -531

    /**
     * @type {Integer (Int32)}
     */
    static JET_errBadCheckpointSignature => -532

    /**
     * @type {Integer (Int32)}
     */
    static JET_errCheckpointCorrupt => -533

    /**
     * @type {Integer (Int32)}
     */
    static JET_errMissingPatchPage => -534

    /**
     * @type {Integer (Int32)}
     */
    static JET_errBadPatchPage => -535

    /**
     * @type {Integer (Int32)}
     */
    static JET_errRedoAbruptEnded => -536

    /**
     * @type {Integer (Int32)}
     */
    static JET_errPatchFileMissing => -538

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDatabaseLogSetMismatch => -539

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDatabaseStreamingFileMismatch => -540

    /**
     * @type {Integer (Int32)}
     */
    static JET_errLogFileSizeMismatch => -541

    /**
     * @type {Integer (Int32)}
     */
    static JET_errCheckpointFileNotFound => -542

    /**
     * @type {Integer (Int32)}
     */
    static JET_errRequiredLogFilesMissing => -543

    /**
     * @type {Integer (Int32)}
     */
    static JET_errSoftRecoveryOnBackupDatabase => -544

    /**
     * @type {Integer (Int32)}
     */
    static JET_errLogFileSizeMismatchDatabasesConsistent => -545

    /**
     * @type {Integer (Int32)}
     */
    static JET_errLogSectorSizeMismatch => -546

    /**
     * @type {Integer (Int32)}
     */
    static JET_errLogSectorSizeMismatchDatabasesConsistent => -547

    /**
     * @type {Integer (Int32)}
     */
    static JET_errLogSequenceEndDatabasesConsistent => -548

    /**
     * @type {Integer (Int32)}
     */
    static JET_errStreamingDataNotLogged => -549

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDatabaseDirtyShutdown => -550

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDatabaseInconsistent => -550

    /**
     * @type {Integer (Int32)}
     */
    static JET_errConsistentTimeMismatch => -551

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDatabasePatchFileMismatch => -552

    /**
     * @type {Integer (Int32)}
     */
    static JET_errEndingRestoreLogTooLow => -553

    /**
     * @type {Integer (Int32)}
     */
    static JET_errStartingRestoreLogTooHigh => -554

    /**
     * @type {Integer (Int32)}
     */
    static JET_errGivenLogFileHasBadSignature => -555

    /**
     * @type {Integer (Int32)}
     */
    static JET_errGivenLogFileIsNotContiguous => -556

    /**
     * @type {Integer (Int32)}
     */
    static JET_errMissingRestoreLogFiles => -557

    /**
     * @type {Integer (UInt32)}
     */
    static JET_wrnExistingLogFileHasBadSignature => 558

    /**
     * @type {Integer (UInt32)}
     */
    static JET_wrnExistingLogFileIsNotContiguous => 559

    /**
     * @type {Integer (Int32)}
     */
    static JET_errMissingFullBackup => -560

    /**
     * @type {Integer (Int32)}
     */
    static JET_errBadBackupDatabaseSize => -561

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDatabaseAlreadyUpgraded => -562

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDatabaseIncompleteUpgrade => -563

    /**
     * @type {Integer (UInt32)}
     */
    static JET_wrnSkipThisRecord => 564

    /**
     * @type {Integer (Int32)}
     */
    static JET_errMissingCurrentLogFiles => -565

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDbTimeTooOld => -566

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDbTimeTooNew => -567

    /**
     * @type {Integer (Int32)}
     */
    static JET_errMissingFileToBackup => -569

    /**
     * @type {Integer (Int32)}
     */
    static JET_errLogTornWriteDuringHardRestore => -570

    /**
     * @type {Integer (Int32)}
     */
    static JET_errLogTornWriteDuringHardRecovery => -571

    /**
     * @type {Integer (Int32)}
     */
    static JET_errLogCorruptDuringHardRestore => -573

    /**
     * @type {Integer (Int32)}
     */
    static JET_errLogCorruptDuringHardRecovery => -574

    /**
     * @type {Integer (Int32)}
     */
    static JET_errMustDisableLoggingForDbUpgrade => -575

    /**
     * @type {Integer (Int32)}
     */
    static JET_errBadRestoreTargetInstance => -577

    /**
     * @type {Integer (UInt32)}
     */
    static JET_wrnTargetInstanceRunning => 578

    /**
     * @type {Integer (Int32)}
     */
    static JET_errRecoveredWithoutUndo => -579

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDatabasesNotFromSameSnapshot => -580

    /**
     * @type {Integer (Int32)}
     */
    static JET_errSoftRecoveryOnSnapshot => -581

    /**
     * @type {Integer (Int32)}
     */
    static JET_errCommittedLogFilesMissing => -582

    /**
     * @type {Integer (Int32)}
     */
    static JET_errSectorSizeNotSupported => -583

    /**
     * @type {Integer (Int32)}
     */
    static JET_errRecoveredWithoutUndoDatabasesConsistent => -584

    /**
     * @type {Integer (UInt32)}
     */
    static JET_wrnCommittedLogFilesLost => 585

    /**
     * @type {Integer (Int32)}
     */
    static JET_errCommittedLogFileCorrupt => -586

    /**
     * @type {Integer (UInt32)}
     */
    static JET_wrnCommittedLogFilesRemoved => 587

    /**
     * @type {Integer (UInt32)}
     */
    static JET_wrnFinishWithUndo => 588

    /**
     * @type {Integer (Int32)}
     */
    static JET_errLogSequenceChecksumMismatch => -590

    /**
     * @type {Integer (UInt32)}
     */
    static JET_wrnDatabaseRepaired => 595

    /**
     * @type {Integer (Int32)}
     */
    static JET_errPageInitializedMismatch => -596

    /**
     * @type {Integer (Int32)}
     */
    static JET_errUnicodeTranslationBufferTooSmall => -601

    /**
     * @type {Integer (Int32)}
     */
    static JET_errUnicodeTranslationFail => -602

    /**
     * @type {Integer (Int32)}
     */
    static JET_errUnicodeNormalizationNotSupported => -603

    /**
     * @type {Integer (Int32)}
     */
    static JET_errUnicodeLanguageValidationFailure => -604

    /**
     * @type {Integer (Int32)}
     */
    static JET_errExistingLogFileHasBadSignature => -610

    /**
     * @type {Integer (Int32)}
     */
    static JET_errExistingLogFileIsNotContiguous => -611

    /**
     * @type {Integer (Int32)}
     */
    static JET_errLogReadVerifyFailure => -612

    /**
     * @type {Integer (Int32)}
     */
    static JET_errCheckpointDepthTooDeep => -614

    /**
     * @type {Integer (Int32)}
     */
    static JET_errRestoreOfNonBackupDatabase => -615

    /**
     * @type {Integer (Int32)}
     */
    static JET_errLogFileNotCopied => -616

    /**
     * @type {Integer (Int32)}
     */
    static JET_errTransactionTooLong => -618

    /**
     * @type {Integer (Int32)}
     */
    static JET_errEngineFormatVersionNoLongerSupportedTooLow => -619

    /**
     * @type {Integer (Int32)}
     */
    static JET_errEngineFormatVersionNotYetImplementedTooHigh => -620

    /**
     * @type {Integer (Int32)}
     */
    static JET_errEngineFormatVersionParamTooLowForRequestedFeature => -621

    /**
     * @type {Integer (Int32)}
     */
    static JET_errEngineFormatVersionSpecifiedTooLowForLogVersion => -622

    /**
     * @type {Integer (Int32)}
     */
    static JET_errEngineFormatVersionSpecifiedTooLowForDatabaseVersion => -623

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDbTimeBeyondMaxRequired => -625

    /**
     * @type {Integer (Int32)}
     */
    static JET_errBackupAbortByServer => -801

    /**
     * @type {Integer (Int32)}
     */
    static JET_errInvalidGrbit => -900

    /**
     * @type {Integer (Int32)}
     */
    static JET_errTermInProgress => -1000

    /**
     * @type {Integer (Int32)}
     */
    static JET_errFeatureNotAvailable => -1001

    /**
     * @type {Integer (Int32)}
     */
    static JET_errInvalidName => -1002

    /**
     * @type {Integer (Int32)}
     */
    static JET_errInvalidParameter => -1003

    /**
     * @type {Integer (UInt32)}
     */
    static JET_wrnColumnNull => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static JET_wrnBufferTruncated => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static JET_wrnDatabaseAttached => 1007

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDatabaseFileReadOnly => -1008

    /**
     * @type {Integer (UInt32)}
     */
    static JET_wrnSortOverflow => 1009

    /**
     * @type {Integer (Int32)}
     */
    static JET_errInvalidDatabaseId => -1010

    /**
     * @type {Integer (Int32)}
     */
    static JET_errOutOfMemory => -1011

    /**
     * @type {Integer (Int32)}
     */
    static JET_errOutOfDatabaseSpace => -1012

    /**
     * @type {Integer (Int32)}
     */
    static JET_errOutOfCursors => -1013

    /**
     * @type {Integer (Int32)}
     */
    static JET_errOutOfBuffers => -1014

    /**
     * @type {Integer (Int32)}
     */
    static JET_errTooManyIndexes => -1015

    /**
     * @type {Integer (Int32)}
     */
    static JET_errTooManyKeys => -1016

    /**
     * @type {Integer (Int32)}
     */
    static JET_errRecordDeleted => -1017

    /**
     * @type {Integer (Int32)}
     */
    static JET_errReadVerifyFailure => -1018

    /**
     * @type {Integer (Int32)}
     */
    static JET_errPageNotInitialized => -1019

    /**
     * @type {Integer (Int32)}
     */
    static JET_errOutOfFileHandles => -1020

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDiskReadVerificationFailure => -1021

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDiskIO => -1022

    /**
     * @type {Integer (Int32)}
     */
    static JET_errInvalidPath => -1023

    /**
     * @type {Integer (Int32)}
     */
    static JET_errInvalidSystemPath => -1024

    /**
     * @type {Integer (Int32)}
     */
    static JET_errInvalidLogDirectory => -1025

    /**
     * @type {Integer (Int32)}
     */
    static JET_errRecordTooBig => -1026

    /**
     * @type {Integer (Int32)}
     */
    static JET_errTooManyOpenDatabases => -1027

    /**
     * @type {Integer (Int32)}
     */
    static JET_errInvalidDatabase => -1028

    /**
     * @type {Integer (Int32)}
     */
    static JET_errNotInitialized => -1029

    /**
     * @type {Integer (Int32)}
     */
    static JET_errAlreadyInitialized => -1030

    /**
     * @type {Integer (Int32)}
     */
    static JET_errInitInProgress => -1031

    /**
     * @type {Integer (Int32)}
     */
    static JET_errFileAccessDenied => -1032

    /**
     * @type {Integer (Int32)}
     */
    static JET_errBufferTooSmall => -1038

    /**
     * @type {Integer (UInt32)}
     */
    static JET_wrnSeekNotEqual => 1039

    /**
     * @type {Integer (Int32)}
     */
    static JET_errTooManyColumns => -1040

    /**
     * @type {Integer (Int32)}
     */
    static JET_errContainerNotEmpty => -1043

    /**
     * @type {Integer (Int32)}
     */
    static JET_errInvalidFilename => -1044

    /**
     * @type {Integer (Int32)}
     */
    static JET_errInvalidBookmark => -1045

    /**
     * @type {Integer (Int32)}
     */
    static JET_errColumnInUse => -1046

    /**
     * @type {Integer (Int32)}
     */
    static JET_errInvalidBufferSize => -1047

    /**
     * @type {Integer (Int32)}
     */
    static JET_errColumnNotUpdatable => -1048

    /**
     * @type {Integer (Int32)}
     */
    static JET_errIndexInUse => -1051

    /**
     * @type {Integer (Int32)}
     */
    static JET_errLinkNotSupported => -1052

    /**
     * @type {Integer (Int32)}
     */
    static JET_errNullKeyDisallowed => -1053

    /**
     * @type {Integer (Int32)}
     */
    static JET_errNotInTransaction => -1054

    /**
     * @type {Integer (UInt32)}
     */
    static JET_wrnNoErrorInfo => 1055

    /**
     * @type {Integer (Int32)}
     */
    static JET_errMustRollback => -1057

    /**
     * @type {Integer (UInt32)}
     */
    static JET_wrnNoIdleActivity => 1058

    /**
     * @type {Integer (Int32)}
     */
    static JET_errTooManyActiveUsers => -1059

    /**
     * @type {Integer (Int32)}
     */
    static JET_errInvalidCountry => -1061

    /**
     * @type {Integer (Int32)}
     */
    static JET_errInvalidLanguageId => -1062

    /**
     * @type {Integer (Int32)}
     */
    static JET_errInvalidCodePage => -1063

    /**
     * @type {Integer (Int32)}
     */
    static JET_errInvalidLCMapStringFlags => -1064

    /**
     * @type {Integer (Int32)}
     */
    static JET_errVersionStoreEntryTooBig => -1065

    /**
     * @type {Integer (Int32)}
     */
    static JET_errVersionStoreOutOfMemoryAndCleanupTimedOut => -1066

    /**
     * @type {Integer (UInt32)}
     */
    static JET_wrnNoWriteLock => 1067

    /**
     * @type {Integer (UInt32)}
     */
    static JET_wrnColumnSetNull => 1068

    /**
     * @type {Integer (Int32)}
     */
    static JET_errVersionStoreOutOfMemory => -1069

    /**
     * @type {Integer (Int32)}
     */
    static JET_errCannotIndex => -1071

    /**
     * @type {Integer (Int32)}
     */
    static JET_errRecordNotDeleted => -1072

    /**
     * @type {Integer (Int32)}
     */
    static JET_errTooManyMempoolEntries => -1073

    /**
     * @type {Integer (Int32)}
     */
    static JET_errOutOfObjectIDs => -1074

    /**
     * @type {Integer (Int32)}
     */
    static JET_errOutOfLongValueIDs => -1075

    /**
     * @type {Integer (Int32)}
     */
    static JET_errOutOfAutoincrementValues => -1076

    /**
     * @type {Integer (Int32)}
     */
    static JET_errOutOfDbtimeValues => -1077

    /**
     * @type {Integer (Int32)}
     */
    static JET_errOutOfSequentialIndexValues => -1078

    /**
     * @type {Integer (Int32)}
     */
    static JET_errRunningInOneInstanceMode => -1080

    /**
     * @type {Integer (Int32)}
     */
    static JET_errRunningInMultiInstanceMode => -1081

    /**
     * @type {Integer (Int32)}
     */
    static JET_errSystemParamsAlreadySet => -1082

    /**
     * @type {Integer (Int32)}
     */
    static JET_errSystemPathInUse => -1083

    /**
     * @type {Integer (Int32)}
     */
    static JET_errLogFilePathInUse => -1084

    /**
     * @type {Integer (Int32)}
     */
    static JET_errTempPathInUse => -1085

    /**
     * @type {Integer (Int32)}
     */
    static JET_errInstanceNameInUse => -1086

    /**
     * @type {Integer (Int32)}
     */
    static JET_errSystemParameterConflict => -1087

    /**
     * @type {Integer (Int32)}
     */
    static JET_errInstanceUnavailable => -1090

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDatabaseUnavailable => -1091

    /**
     * @type {Integer (Int32)}
     */
    static JET_errInstanceUnavailableDueToFatalLogDiskFull => -1092

    /**
     * @type {Integer (Int32)}
     */
    static JET_errInvalidSesparamId => -1093

    /**
     * @type {Integer (Int32)}
     */
    static JET_errTooManyRecords => -1094

    /**
     * @type {Integer (Int32)}
     */
    static JET_errInvalidDbparamId => -1095

    /**
     * @type {Integer (Int32)}
     */
    static JET_errOutOfSessions => -1101

    /**
     * @type {Integer (Int32)}
     */
    static JET_errWriteConflict => -1102

    /**
     * @type {Integer (Int32)}
     */
    static JET_errTransTooDeep => -1103

    /**
     * @type {Integer (Int32)}
     */
    static JET_errInvalidSesid => -1104

    /**
     * @type {Integer (Int32)}
     */
    static JET_errWriteConflictPrimaryIndex => -1105

    /**
     * @type {Integer (Int32)}
     */
    static JET_errInTransaction => -1108

    /**
     * @type {Integer (Int32)}
     */
    static JET_errRollbackRequired => -1109

    /**
     * @type {Integer (Int32)}
     */
    static JET_errTransReadOnly => -1110

    /**
     * @type {Integer (Int32)}
     */
    static JET_errSessionWriteConflict => -1111

    /**
     * @type {Integer (Int32)}
     */
    static JET_errRecordTooBigForBackwardCompatibility => -1112

    /**
     * @type {Integer (Int32)}
     */
    static JET_errCannotMaterializeForwardOnlySort => -1113

    /**
     * @type {Integer (Int32)}
     */
    static JET_errSesidTableIdMismatch => -1114

    /**
     * @type {Integer (Int32)}
     */
    static JET_errInvalidInstance => -1115

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDirtyShutdown => -1116

    /**
     * @type {Integer (Int32)}
     */
    static JET_errReadPgnoVerifyFailure => -1118

    /**
     * @type {Integer (Int32)}
     */
    static JET_errReadLostFlushVerifyFailure => -1119

    /**
     * @type {Integer (Int32)}
     */
    static JET_errFileSystemCorruption => -1121

    /**
     * @type {Integer (UInt32)}
     */
    static JET_wrnShrinkNotPossible => 1122

    /**
     * @type {Integer (Int32)}
     */
    static JET_errRecoveryVerifyFailure => -1123

    /**
     * @type {Integer (Int32)}
     */
    static JET_errFilteredMoveNotSupported => -1124

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDatabaseDuplicate => -1201

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDatabaseInUse => -1202

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDatabaseNotFound => -1203

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDatabaseInvalidName => -1204

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDatabaseInvalidPages => -1205

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDatabaseCorrupted => -1206

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDatabaseLocked => -1207

    /**
     * @type {Integer (Int32)}
     */
    static JET_errCannotDisableVersioning => -1208

    /**
     * @type {Integer (Int32)}
     */
    static JET_errInvalidDatabaseVersion => -1209

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDatabase200Format => -1210

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDatabase400Format => -1211

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDatabase500Format => -1212

    /**
     * @type {Integer (Int32)}
     */
    static JET_errPageSizeMismatch => -1213

    /**
     * @type {Integer (Int32)}
     */
    static JET_errTooManyInstances => -1214

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDatabaseSharingViolation => -1215

    /**
     * @type {Integer (Int32)}
     */
    static JET_errAttachedDatabaseMismatch => -1216

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDatabaseInvalidPath => -1217

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDatabaseIdInUse => -1218

    /**
     * @type {Integer (Int32)}
     */
    static JET_errForceDetachNotAllowed => -1219

    /**
     * @type {Integer (Int32)}
     */
    static JET_errCatalogCorrupted => -1220

    /**
     * @type {Integer (Int32)}
     */
    static JET_errPartiallyAttachedDB => -1221

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDatabaseSignInUse => -1222

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDatabaseCorruptedNoRepair => -1224

    /**
     * @type {Integer (Int32)}
     */
    static JET_errInvalidCreateDbVersion => -1225

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDatabaseNotReady => -1230

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDatabaseAttachedForRecovery => -1231

    /**
     * @type {Integer (Int32)}
     */
    static JET_errTransactionsNotReadyDuringRecovery => -1232

    /**
     * @type {Integer (UInt32)}
     */
    static JET_wrnTableEmpty => 1301

    /**
     * @type {Integer (Int32)}
     */
    static JET_errTableLocked => -1302

    /**
     * @type {Integer (Int32)}
     */
    static JET_errTableDuplicate => -1303

    /**
     * @type {Integer (Int32)}
     */
    static JET_errTableInUse => -1304

    /**
     * @type {Integer (Int32)}
     */
    static JET_errObjectNotFound => -1305

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDensityInvalid => -1307

    /**
     * @type {Integer (Int32)}
     */
    static JET_errTableNotEmpty => -1308

    /**
     * @type {Integer (Int32)}
     */
    static JET_errInvalidTableId => -1310

    /**
     * @type {Integer (Int32)}
     */
    static JET_errTooManyOpenTables => -1311

    /**
     * @type {Integer (Int32)}
     */
    static JET_errIllegalOperation => -1312

    /**
     * @type {Integer (Int32)}
     */
    static JET_errTooManyOpenTablesAndCleanupTimedOut => -1313

    /**
     * @type {Integer (Int32)}
     */
    static JET_errObjectDuplicate => -1314

    /**
     * @type {Integer (Int32)}
     */
    static JET_errInvalidObject => -1316

    /**
     * @type {Integer (Int32)}
     */
    static JET_errCannotDeleteTempTable => -1317

    /**
     * @type {Integer (Int32)}
     */
    static JET_errCannotDeleteSystemTable => -1318

    /**
     * @type {Integer (Int32)}
     */
    static JET_errCannotDeleteTemplateTable => -1319

    /**
     * @type {Integer (Int32)}
     */
    static JET_errExclusiveTableLockRequired => -1322

    /**
     * @type {Integer (Int32)}
     */
    static JET_errFixedDDL => -1323

    /**
     * @type {Integer (Int32)}
     */
    static JET_errFixedInheritedDDL => -1324

    /**
     * @type {Integer (Int32)}
     */
    static JET_errCannotNestDDL => -1325

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDDLNotInheritable => -1326

    /**
     * @type {Integer (UInt32)}
     */
    static JET_wrnTableInUseBySystem => 1327

    /**
     * @type {Integer (Int32)}
     */
    static JET_errInvalidSettings => -1328

    /**
     * @type {Integer (Int32)}
     */
    static JET_errClientRequestToStopJetService => -1329

    /**
     * @type {Integer (Int32)}
     */
    static JET_errCannotAddFixedVarColumnToDerivedTable => -1330

    /**
     * @type {Integer (Int32)}
     */
    static JET_errIndexCantBuild => -1401

    /**
     * @type {Integer (Int32)}
     */
    static JET_errIndexHasPrimary => -1402

    /**
     * @type {Integer (Int32)}
     */
    static JET_errIndexDuplicate => -1403

    /**
     * @type {Integer (Int32)}
     */
    static JET_errIndexNotFound => -1404

    /**
     * @type {Integer (Int32)}
     */
    static JET_errIndexMustStay => -1405

    /**
     * @type {Integer (Int32)}
     */
    static JET_errIndexInvalidDef => -1406

    /**
     * @type {Integer (Int32)}
     */
    static JET_errInvalidCreateIndex => -1409

    /**
     * @type {Integer (Int32)}
     */
    static JET_errTooManyOpenIndexes => -1410

    /**
     * @type {Integer (Int32)}
     */
    static JET_errMultiValuedIndexViolation => -1411

    /**
     * @type {Integer (Int32)}
     */
    static JET_errIndexBuildCorrupted => -1412

    /**
     * @type {Integer (Int32)}
     */
    static JET_errPrimaryIndexCorrupted => -1413

    /**
     * @type {Integer (Int32)}
     */
    static JET_errSecondaryIndexCorrupted => -1414

    /**
     * @type {Integer (UInt32)}
     */
    static JET_wrnCorruptIndexDeleted => 1415

    /**
     * @type {Integer (Int32)}
     */
    static JET_errInvalidIndexId => -1416

    /**
     * @type {Integer (UInt32)}
     */
    static JET_wrnPrimaryIndexOutOfDate => 1417

    /**
     * @type {Integer (UInt32)}
     */
    static JET_wrnSecondaryIndexOutOfDate => 1418

    /**
     * @type {Integer (Int32)}
     */
    static JET_errIndexTuplesSecondaryIndexOnly => -1430

    /**
     * @type {Integer (Int32)}
     */
    static JET_errIndexTuplesTooManyColumns => -1431

    /**
     * @type {Integer (Int32)}
     */
    static JET_errIndexTuplesOneColumnOnly => -1431

    /**
     * @type {Integer (Int32)}
     */
    static JET_errIndexTuplesNonUniqueOnly => -1432

    /**
     * @type {Integer (Int32)}
     */
    static JET_errIndexTuplesTextBinaryColumnsOnly => -1433

    /**
     * @type {Integer (Int32)}
     */
    static JET_errIndexTuplesTextColumnsOnly => -1433

    /**
     * @type {Integer (Int32)}
     */
    static JET_errIndexTuplesVarSegMacNotAllowed => -1434

    /**
     * @type {Integer (Int32)}
     */
    static JET_errIndexTuplesInvalidLimits => -1435

    /**
     * @type {Integer (Int32)}
     */
    static JET_errIndexTuplesCannotRetrieveFromIndex => -1436

    /**
     * @type {Integer (Int32)}
     */
    static JET_errIndexTuplesKeyTooSmall => -1437

    /**
     * @type {Integer (Int32)}
     */
    static JET_errInvalidLVChunkSize => -1438

    /**
     * @type {Integer (Int32)}
     */
    static JET_errColumnCannotBeEncrypted => -1439

    /**
     * @type {Integer (Int32)}
     */
    static JET_errCannotIndexOnEncryptedColumn => -1440

    /**
     * @type {Integer (Int32)}
     */
    static JET_errColumnLong => -1501

    /**
     * @type {Integer (Int32)}
     */
    static JET_errColumnNoChunk => -1502

    /**
     * @type {Integer (Int32)}
     */
    static JET_errColumnDoesNotFit => -1503

    /**
     * @type {Integer (Int32)}
     */
    static JET_errNullInvalid => -1504

    /**
     * @type {Integer (Int32)}
     */
    static JET_errColumnIndexed => -1505

    /**
     * @type {Integer (Int32)}
     */
    static JET_errColumnTooBig => -1506

    /**
     * @type {Integer (Int32)}
     */
    static JET_errColumnNotFound => -1507

    /**
     * @type {Integer (Int32)}
     */
    static JET_errColumnDuplicate => -1508

    /**
     * @type {Integer (Int32)}
     */
    static JET_errMultiValuedColumnMustBeTagged => -1509

    /**
     * @type {Integer (Int32)}
     */
    static JET_errColumnRedundant => -1510

    /**
     * @type {Integer (Int32)}
     */
    static JET_errInvalidColumnType => -1511

    /**
     * @type {Integer (UInt32)}
     */
    static JET_wrnColumnMaxTruncated => 1512

    /**
     * @type {Integer (Int32)}
     */
    static JET_errTaggedNotNULL => -1514

    /**
     * @type {Integer (Int32)}
     */
    static JET_errNoCurrentIndex => -1515

    /**
     * @type {Integer (Int32)}
     */
    static JET_errKeyIsMade => -1516

    /**
     * @type {Integer (Int32)}
     */
    static JET_errBadColumnId => -1517

    /**
     * @type {Integer (Int32)}
     */
    static JET_errBadItagSequence => -1518

    /**
     * @type {Integer (Int32)}
     */
    static JET_errColumnInRelationship => -1519

    /**
     * @type {Integer (UInt32)}
     */
    static JET_wrnCopyLongValue => 1520

    /**
     * @type {Integer (Int32)}
     */
    static JET_errCannotBeTagged => -1521

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDefaultValueTooBig => -1524

    /**
     * @type {Integer (Int32)}
     */
    static JET_errMultiValuedDuplicate => -1525

    /**
     * @type {Integer (Int32)}
     */
    static JET_errLVCorrupted => -1526

    /**
     * @type {Integer (Int32)}
     */
    static JET_errMultiValuedDuplicateAfterTruncation => -1528

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDerivedColumnCorruption => -1529

    /**
     * @type {Integer (Int32)}
     */
    static JET_errInvalidPlaceholderColumn => -1530

    /**
     * @type {Integer (UInt32)}
     */
    static JET_wrnColumnSkipped => 1531

    /**
     * @type {Integer (UInt32)}
     */
    static JET_wrnColumnNotLocal => 1532

    /**
     * @type {Integer (UInt32)}
     */
    static JET_wrnColumnMoreTags => 1533

    /**
     * @type {Integer (UInt32)}
     */
    static JET_wrnColumnTruncated => 1534

    /**
     * @type {Integer (UInt32)}
     */
    static JET_wrnColumnPresent => 1535

    /**
     * @type {Integer (UInt32)}
     */
    static JET_wrnColumnSingleValue => 1536

    /**
     * @type {Integer (UInt32)}
     */
    static JET_wrnColumnDefault => 1537

    /**
     * @type {Integer (Int32)}
     */
    static JET_errColumnCannotBeCompressed => -1538

    /**
     * @type {Integer (UInt32)}
     */
    static JET_wrnColumnNotInRecord => 1539

    /**
     * @type {Integer (Int32)}
     */
    static JET_errColumnNoEncryptionKey => -1540

    /**
     * @type {Integer (UInt32)}
     */
    static JET_wrnColumnReference => 1541

    /**
     * @type {Integer (Int32)}
     */
    static JET_errRecordNotFound => -1601

    /**
     * @type {Integer (Int32)}
     */
    static JET_errRecordNoCopy => -1602

    /**
     * @type {Integer (Int32)}
     */
    static JET_errNoCurrentRecord => -1603

    /**
     * @type {Integer (Int32)}
     */
    static JET_errRecordPrimaryChanged => -1604

    /**
     * @type {Integer (Int32)}
     */
    static JET_errKeyDuplicate => -1605

    /**
     * @type {Integer (Int32)}
     */
    static JET_errAlreadyPrepared => -1607

    /**
     * @type {Integer (Int32)}
     */
    static JET_errKeyNotMade => -1608

    /**
     * @type {Integer (Int32)}
     */
    static JET_errUpdateNotPrepared => -1609

    /**
     * @type {Integer (UInt32)}
     */
    static JET_wrnDataHasChanged => 1610

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDataHasChanged => -1611

    /**
     * @type {Integer (UInt32)}
     */
    static JET_wrnKeyChanged => 1618

    /**
     * @type {Integer (Int32)}
     */
    static JET_errLanguageNotSupported => -1619

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDecompressionFailed => -1620

    /**
     * @type {Integer (Int32)}
     */
    static JET_errUpdateMustVersion => -1621

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDecryptionFailed => -1622

    /**
     * @type {Integer (Int32)}
     */
    static JET_errEncryptionBadItag => -1623

    /**
     * @type {Integer (Int32)}
     */
    static JET_errTooManySorts => -1701

    /**
     * @type {Integer (Int32)}
     */
    static JET_errInvalidOnSort => -1702

    /**
     * @type {Integer (Int32)}
     */
    static JET_errTempFileOpenError => -1803

    /**
     * @type {Integer (Int32)}
     */
    static JET_errTooManyAttachedDatabases => -1805

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDiskFull => -1808

    /**
     * @type {Integer (Int32)}
     */
    static JET_errPermissionDenied => -1809

    /**
     * @type {Integer (Int32)}
     */
    static JET_errFileNotFound => -1811

    /**
     * @type {Integer (Int32)}
     */
    static JET_errFileInvalidType => -1812

    /**
     * @type {Integer (UInt32)}
     */
    static JET_wrnFileOpenReadOnly => 1813

    /**
     * @type {Integer (Int32)}
     */
    static JET_errFileAlreadyExists => -1814

    /**
     * @type {Integer (Int32)}
     */
    static JET_errAfterInitialization => -1850

    /**
     * @type {Integer (Int32)}
     */
    static JET_errLogCorrupted => -1852

    /**
     * @type {Integer (Int32)}
     */
    static JET_errInvalidOperation => -1906

    /**
     * @type {Integer (Int32)}
     */
    static JET_errAccessDenied => -1907

    /**
     * @type {Integer (UInt32)}
     */
    static JET_wrnIdleFull => 1908

    /**
     * @type {Integer (Int32)}
     */
    static JET_errTooManySplits => -1909

    /**
     * @type {Integer (Int32)}
     */
    static JET_errSessionSharingViolation => -1910

    /**
     * @type {Integer (Int32)}
     */
    static JET_errEntryPointNotFound => -1911

    /**
     * @type {Integer (Int32)}
     */
    static JET_errSessionContextAlreadySet => -1912

    /**
     * @type {Integer (Int32)}
     */
    static JET_errSessionContextNotSetByThisThread => -1913

    /**
     * @type {Integer (Int32)}
     */
    static JET_errSessionInUse => -1914

    /**
     * @type {Integer (Int32)}
     */
    static JET_errRecordFormatConversionFailed => -1915

    /**
     * @type {Integer (Int32)}
     */
    static JET_errOneDatabasePerSession => -1916

    /**
     * @type {Integer (Int32)}
     */
    static JET_errRollbackError => -1917

    /**
     * @type {Integer (Int32)}
     */
    static JET_errFlushMapVersionUnsupported => -1918

    /**
     * @type {Integer (Int32)}
     */
    static JET_errFlushMapDatabaseMismatch => -1919

    /**
     * @type {Integer (Int32)}
     */
    static JET_errFlushMapUnrecoverable => -1920

    /**
     * @type {Integer (UInt32)}
     */
    static JET_wrnDefragAlreadyRunning => 2000

    /**
     * @type {Integer (UInt32)}
     */
    static JET_wrnDefragNotRunning => 2001

    /**
     * @type {Integer (Int32)}
     */
    static JET_errDatabaseAlreadyRunningMaintenance => -2004

    /**
     * @type {Integer (UInt32)}
     */
    static JET_wrnCallbackNotRegistered => 2100

    /**
     * @type {Integer (Int32)}
     */
    static JET_errCallbackFailed => -2101

    /**
     * @type {Integer (Int32)}
     */
    static JET_errCallbackNotResolved => -2102

    /**
     * @type {Integer (Int32)}
     */
    static JET_errSpaceHintsInvalid => -2103

    /**
     * @type {Integer (Int32)}
     */
    static JET_errOSSnapshotInvalidSequence => -2401

    /**
     * @type {Integer (Int32)}
     */
    static JET_errOSSnapshotTimeOut => -2402

    /**
     * @type {Integer (Int32)}
     */
    static JET_errOSSnapshotNotAllowed => -2403

    /**
     * @type {Integer (Int32)}
     */
    static JET_errOSSnapshotInvalidSnapId => -2404

    /**
     * @type {Integer (Int32)}
     */
    static JET_errLSCallbackNotSpecified => -3000

    /**
     * @type {Integer (Int32)}
     */
    static JET_errLSAlreadySet => -3001

    /**
     * @type {Integer (Int32)}
     */
    static JET_errLSNotSet => -3002

    /**
     * @type {Integer (Int32)}
     */
    static JET_errFileIOSparse => -4000

    /**
     * @type {Integer (Int32)}
     */
    static JET_errFileIOBeyondEOF => -4001

    /**
     * @type {Integer (Int32)}
     */
    static JET_errFileIOAbort => -4002

    /**
     * @type {Integer (Int32)}
     */
    static JET_errFileIORetry => -4003

    /**
     * @type {Integer (Int32)}
     */
    static JET_errFileIOFail => -4004

    /**
     * @type {Integer (Int32)}
     */
    static JET_errFileCompressed => -4005

    /**
     * @type {Integer (UInt32)}
     */
    static JET_BASE_NAME_LENGTH => 3

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitDumpMinimum => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitDumpMaximum => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitDumpCacheMinimum => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitDumpCacheMaximum => 8

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitDumpCacheIncludeDirtyPages => 16

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitDumpCacheIncludeCachedPages => 32

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitDumpCacheIncludeCorruptedPages => 64

    /**
     * @type {Integer (UInt32)}
     */
    static JET_bitDumpCacheNoDecommit => 128
;@endregion Constants

;@region Methods
    /**
     * Learn more about: JetInit Function
     * @param {Pointer<UIntPtr>} pinstance 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetinit-function
     */
    static JetInit(pinstance) {
        result := DllCall("ESENT.dll\JetInit", "ptr", pinstance, "int")
        return result
    }

    /**
     * Learn more about: JetInit2 Function
     * @param {Pointer<UIntPtr>} pinstance 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetinit2-function
     */
    static JetInit2(pinstance, grbit) {
        result := DllCall("ESENT.dll\JetInit2", "ptr", pinstance, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetInit3 Function
     * @param {Pointer<UIntPtr>} pinstance 
     * @param {Pointer<JET_RSTINFO_A>} prstInfo 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetinit3-function
     */
    static JetInit3A(pinstance, prstInfo, grbit) {
        result := DllCall("ESENT.dll\JetInit3A", "ptr", pinstance, "ptr", prstInfo, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetInit3 Function
     * @param {Pointer<UIntPtr>} pinstance 
     * @param {Pointer<JET_RSTINFO_W>} prstInfo 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetinit3-function
     */
    static JetInit3W(pinstance, prstInfo, grbit) {
        result := DllCall("ESENT.dll\JetInit3W", "ptr", pinstance, "ptr", prstInfo, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetCreateInstance Function
     * @param {Pointer<UIntPtr>} pinstance 
     * @param {Pointer<SByte>} szInstanceName 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreateinstance-function
     */
    static JetCreateInstanceA(pinstance, szInstanceName) {
        result := DllCall("ESENT.dll\JetCreateInstanceA", "ptr", pinstance, "ptr", szInstanceName, "int")
        return result
    }

    /**
     * Learn more about: JetCreateInstance Function
     * @param {Pointer<UIntPtr>} pinstance 
     * @param {Pointer<UInt16>} szInstanceName 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreateinstance-function
     */
    static JetCreateInstanceW(pinstance, szInstanceName) {
        result := DllCall("ESENT.dll\JetCreateInstanceW", "ptr", pinstance, "ptr", szInstanceName, "int")
        return result
    }

    /**
     * Learn more about: JetCreateInstance2 Function
     * @param {Pointer<UIntPtr>} pinstance 
     * @param {Pointer<SByte>} szInstanceName 
     * @param {Pointer<SByte>} szDisplayName 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreateinstance2-function
     */
    static JetCreateInstance2A(pinstance, szInstanceName, szDisplayName, grbit) {
        result := DllCall("ESENT.dll\JetCreateInstance2A", "ptr", pinstance, "ptr", szInstanceName, "ptr", szDisplayName, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetCreateInstance2 Function
     * @param {Pointer<UIntPtr>} pinstance 
     * @param {Pointer<UInt16>} szInstanceName 
     * @param {Pointer<UInt16>} szDisplayName 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreateinstance2-function
     */
    static JetCreateInstance2W(pinstance, szInstanceName, szDisplayName, grbit) {
        result := DllCall("ESENT.dll\JetCreateInstance2W", "ptr", pinstance, "ptr", szInstanceName, "ptr", szDisplayName, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetGetInstanceMiscInfo Function
     * @param {Pointer} instance 
     * @param {Pointer<Void>} pvResult 
     * @param {Integer} cbMax 
     * @param {Integer} InfoLevel 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetinstancemiscinfo-function
     */
    static JetGetInstanceMiscInfo(instance, pvResult, cbMax, InfoLevel) {
        result := DllCall("ESENT.dll\JetGetInstanceMiscInfo", "ptr", instance, "ptr", pvResult, "uint", cbMax, "uint", InfoLevel, "int")
        return result
    }

    /**
     * Learn more about: JetTerm Function
     * @param {Pointer} instance 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetterm-function
     */
    static JetTerm(instance) {
        result := DllCall("ESENT.dll\JetTerm", "ptr", instance, "int")
        return result
    }

    /**
     * Learn more about: JetTerm2 Function
     * @param {Pointer} instance 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetterm2-function
     */
    static JetTerm2(instance, grbit) {
        result := DllCall("ESENT.dll\JetTerm2", "ptr", instance, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetStopService Function
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetstopservice-function
     */
    static JetStopService() {
        result := DllCall("ESENT.dll\JetStopService", "int")
        return result
    }

    /**
     * Learn more about: JetStopServiceInstance Function
     * @param {Pointer} instance 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetstopserviceinstance-function
     */
    static JetStopServiceInstance(instance) {
        result := DllCall("ESENT.dll\JetStopServiceInstance", "ptr", instance, "int")
        return result
    }

    /**
     * Learn more about: JetStopServiceInstance2 Function
     * @param {Pointer} instance 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetstopserviceinstance2-function
     */
    static JetStopServiceInstance2(instance, grbit) {
        result := DllCall("ESENT.dll\JetStopServiceInstance2", "ptr", instance, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetStopBackup Function
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetstopbackup-function
     */
    static JetStopBackup() {
        result := DllCall("ESENT.dll\JetStopBackup", "int")
        return result
    }

    /**
     * Learn more about: JetStopBackupInstance Function
     * @param {Pointer} instance 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetstopbackupinstance-function
     */
    static JetStopBackupInstance(instance) {
        result := DllCall("ESENT.dll\JetStopBackupInstance", "ptr", instance, "int")
        return result
    }

    /**
     * Learn more about: JetSetSystemParameter Function
     * @param {Pointer<UIntPtr>} pinstance 
     * @param {Pointer} sesid 
     * @param {Integer} paramid 
     * @param {Pointer} lParam 
     * @param {Pointer<SByte>} szParam 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetsetsystemparameter-function
     */
    static JetSetSystemParameterA(pinstance, sesid, paramid, lParam, szParam) {
        result := DllCall("ESENT.dll\JetSetSystemParameterA", "ptr", pinstance, "ptr", sesid, "uint", paramid, "ptr", lParam, "ptr", szParam, "int")
        return result
    }

    /**
     * Learn more about: JetSetSystemParameter Function
     * @param {Pointer<UIntPtr>} pinstance 
     * @param {Pointer} sesid 
     * @param {Integer} paramid 
     * @param {Pointer} lParam 
     * @param {Pointer<UInt16>} szParam 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetsetsystemparameter-function
     */
    static JetSetSystemParameterW(pinstance, sesid, paramid, lParam, szParam) {
        result := DllCall("ESENT.dll\JetSetSystemParameterW", "ptr", pinstance, "ptr", sesid, "uint", paramid, "ptr", lParam, "ptr", szParam, "int")
        return result
    }

    /**
     * Learn more about: JetGetSystemParameter Function
     * @param {Pointer} instance 
     * @param {Pointer} sesid 
     * @param {Integer} paramid 
     * @param {Pointer<UIntPtr>} plParam 
     * @param {Pointer<SByte>} szParam 
     * @param {Integer} cbMax 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetsystemparameter-function
     */
    static JetGetSystemParameterA(instance, sesid, paramid, plParam, szParam, cbMax) {
        result := DllCall("ESENT.dll\JetGetSystemParameterA", "ptr", instance, "ptr", sesid, "uint", paramid, "ptr", plParam, "ptr", szParam, "uint", cbMax, "int")
        return result
    }

    /**
     * Learn more about: JetGetSystemParameter Function
     * @param {Pointer} instance 
     * @param {Pointer} sesid 
     * @param {Integer} paramid 
     * @param {Pointer<UIntPtr>} plParam 
     * @param {Pointer<UInt16>} szParam 
     * @param {Integer} cbMax 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetsystemparameter-function
     */
    static JetGetSystemParameterW(instance, sesid, paramid, plParam, szParam, cbMax) {
        result := DllCall("ESENT.dll\JetGetSystemParameterW", "ptr", instance, "ptr", sesid, "uint", paramid, "ptr", plParam, "ptr", szParam, "uint", cbMax, "int")
        return result
    }

    /**
     * Learn more about: JetEnableMultiInstance Function
     * @param {Pointer<JET_SETSYSPARAM_A>} psetsysparam 
     * @param {Integer} csetsysparam 
     * @param {Pointer<UInt32>} pcsetsucceed 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetenablemultiinstance-function
     */
    static JetEnableMultiInstanceA(psetsysparam, csetsysparam, pcsetsucceed) {
        result := DllCall("ESENT.dll\JetEnableMultiInstanceA", "ptr", psetsysparam, "uint", csetsysparam, "ptr", pcsetsucceed, "int")
        return result
    }

    /**
     * Learn more about: JetEnableMultiInstance Function
     * @param {Pointer<JET_SETSYSPARAM_W>} psetsysparam 
     * @param {Integer} csetsysparam 
     * @param {Pointer<UInt32>} pcsetsucceed 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetenablemultiinstance-function
     */
    static JetEnableMultiInstanceW(psetsysparam, csetsysparam, pcsetsucceed) {
        result := DllCall("ESENT.dll\JetEnableMultiInstanceW", "ptr", psetsysparam, "uint", csetsysparam, "ptr", pcsetsucceed, "int")
        return result
    }

    /**
     * Learn more about: JetGetThreadStats Function
     * @param {Pointer<Void>} pvResult 
     * @param {Integer} cbMax 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetthreadstats-function
     */
    static JetGetThreadStats(pvResult, cbMax) {
        result := DllCall("ESENT.dll\JetGetThreadStats", "ptr", pvResult, "uint", cbMax, "int")
        return result
    }

    /**
     * Learn more about: JetBeginSession Function
     * @param {Pointer} instance 
     * @param {Pointer<UIntPtr>} psesid 
     * @param {Pointer<SByte>} szUserName 
     * @param {Pointer<SByte>} szPassword 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetbeginsession-function
     */
    static JetBeginSessionA(instance, psesid, szUserName, szPassword) {
        result := DllCall("ESENT.dll\JetBeginSessionA", "ptr", instance, "ptr", psesid, "ptr", szUserName, "ptr", szPassword, "int")
        return result
    }

    /**
     * Learn more about: JetBeginSession Function
     * @param {Pointer} instance 
     * @param {Pointer<UIntPtr>} psesid 
     * @param {Pointer<UInt16>} szUserName 
     * @param {Pointer<UInt16>} szPassword 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetbeginsession-function
     */
    static JetBeginSessionW(instance, psesid, szUserName, szPassword) {
        result := DllCall("ESENT.dll\JetBeginSessionW", "ptr", instance, "ptr", psesid, "ptr", szUserName, "ptr", szPassword, "int")
        return result
    }

    /**
     * Learn more about: JetDupSession Function
     * @param {Pointer} sesid 
     * @param {Pointer<UIntPtr>} psesid 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetdupsession-function
     */
    static JetDupSession(sesid, psesid) {
        result := DllCall("ESENT.dll\JetDupSession", "ptr", sesid, "ptr", psesid, "int")
        return result
    }

    /**
     * Learn more about: JetEndSession Function
     * @param {Pointer} sesid 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetendsession-function
     */
    static JetEndSession(sesid, grbit) {
        result := DllCall("ESENT.dll\JetEndSession", "ptr", sesid, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetGetVersion Function
     * @param {Pointer} sesid 
     * @param {Pointer<UInt32>} pwVersion 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetversion-function
     */
    static JetGetVersion(sesid, pwVersion) {
        result := DllCall("ESENT.dll\JetGetVersion", "ptr", sesid, "ptr", pwVersion, "int")
        return result
    }

    /**
     * Learn more about: JetIdle Function
     * @param {Pointer} sesid 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetidle-function
     */
    static JetIdle(sesid, grbit) {
        result := DllCall("ESENT.dll\JetIdle", "ptr", sesid, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetCreateDatabase Function
     * @param {Pointer} sesid 
     * @param {Pointer<SByte>} szFilename 
     * @param {Pointer<SByte>} szConnect 
     * @param {Pointer<UInt32>} pdbid 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreatedatabase-function
     */
    static JetCreateDatabaseA(sesid, szFilename, szConnect, pdbid, grbit) {
        result := DllCall("ESENT.dll\JetCreateDatabaseA", "ptr", sesid, "ptr", szFilename, "ptr", szConnect, "ptr", pdbid, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetCreateDatabase Function
     * @param {Pointer} sesid 
     * @param {Pointer<UInt16>} szFilename 
     * @param {Pointer<UInt16>} szConnect 
     * @param {Pointer<UInt32>} pdbid 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreatedatabase-function
     */
    static JetCreateDatabaseW(sesid, szFilename, szConnect, pdbid, grbit) {
        result := DllCall("ESENT.dll\JetCreateDatabaseW", "ptr", sesid, "ptr", szFilename, "ptr", szConnect, "ptr", pdbid, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetCreateDatabase2 Function
     * @param {Pointer} sesid 
     * @param {Pointer<SByte>} szFilename 
     * @param {Integer} cpgDatabaseSizeMax 
     * @param {Pointer<UInt32>} pdbid 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreatedatabase2-function
     */
    static JetCreateDatabase2A(sesid, szFilename, cpgDatabaseSizeMax, pdbid, grbit) {
        result := DllCall("ESENT.dll\JetCreateDatabase2A", "ptr", sesid, "ptr", szFilename, "uint", cpgDatabaseSizeMax, "ptr", pdbid, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetCreateDatabase2 Function
     * @param {Pointer} sesid 
     * @param {Pointer<UInt16>} szFilename 
     * @param {Integer} cpgDatabaseSizeMax 
     * @param {Pointer<UInt32>} pdbid 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreatedatabase2-function
     */
    static JetCreateDatabase2W(sesid, szFilename, cpgDatabaseSizeMax, pdbid, grbit) {
        result := DllCall("ESENT.dll\JetCreateDatabase2W", "ptr", sesid, "ptr", szFilename, "uint", cpgDatabaseSizeMax, "ptr", pdbid, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetAttachDatabase Function
     * @param {Pointer} sesid 
     * @param {Pointer<SByte>} szFilename 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetattachdatabase-function
     */
    static JetAttachDatabaseA(sesid, szFilename, grbit) {
        result := DllCall("ESENT.dll\JetAttachDatabaseA", "ptr", sesid, "ptr", szFilename, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetAttachDatabase Function
     * @param {Pointer} sesid 
     * @param {Pointer<UInt16>} szFilename 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetattachdatabase-function
     */
    static JetAttachDatabaseW(sesid, szFilename, grbit) {
        result := DllCall("ESENT.dll\JetAttachDatabaseW", "ptr", sesid, "ptr", szFilename, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetAttachDatabase2 Function
     * @param {Pointer} sesid 
     * @param {Pointer<SByte>} szFilename 
     * @param {Integer} cpgDatabaseSizeMax 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetattachdatabase2-function
     */
    static JetAttachDatabase2A(sesid, szFilename, cpgDatabaseSizeMax, grbit) {
        result := DllCall("ESENT.dll\JetAttachDatabase2A", "ptr", sesid, "ptr", szFilename, "uint", cpgDatabaseSizeMax, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetAttachDatabase2 Function
     * @param {Pointer} sesid 
     * @param {Pointer<UInt16>} szFilename 
     * @param {Integer} cpgDatabaseSizeMax 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetattachdatabase2-function
     */
    static JetAttachDatabase2W(sesid, szFilename, cpgDatabaseSizeMax, grbit) {
        result := DllCall("ESENT.dll\JetAttachDatabase2W", "ptr", sesid, "ptr", szFilename, "uint", cpgDatabaseSizeMax, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetDetachDatabase Function
     * @param {Pointer} sesid 
     * @param {Pointer<SByte>} szFilename 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetdetachdatabase-function
     */
    static JetDetachDatabaseA(sesid, szFilename) {
        result := DllCall("ESENT.dll\JetDetachDatabaseA", "ptr", sesid, "ptr", szFilename, "int")
        return result
    }

    /**
     * Learn more about: JetDetachDatabase Function
     * @param {Pointer} sesid 
     * @param {Pointer<UInt16>} szFilename 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetdetachdatabase-function
     */
    static JetDetachDatabaseW(sesid, szFilename) {
        result := DllCall("ESENT.dll\JetDetachDatabaseW", "ptr", sesid, "ptr", szFilename, "int")
        return result
    }

    /**
     * Learn more about: JetDetachDatabase2 Function
     * @param {Pointer} sesid 
     * @param {Pointer<SByte>} szFilename 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetdetachdatabase2-function
     */
    static JetDetachDatabase2A(sesid, szFilename, grbit) {
        result := DllCall("ESENT.dll\JetDetachDatabase2A", "ptr", sesid, "ptr", szFilename, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetDetachDatabase2 Function
     * @param {Pointer} sesid 
     * @param {Pointer<UInt16>} szFilename 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetdetachdatabase2-function
     */
    static JetDetachDatabase2W(sesid, szFilename, grbit) {
        result := DllCall("ESENT.dll\JetDetachDatabase2W", "ptr", sesid, "ptr", szFilename, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetGetObjectInfo Function
     * @param {Pointer} sesid 
     * @param {Integer} dbid 
     * @param {Integer} objtyp 
     * @param {Pointer<SByte>} szContainerName 
     * @param {Pointer<SByte>} szObjectName 
     * @param {Pointer<Void>} pvResult 
     * @param {Integer} cbMax 
     * @param {Integer} InfoLevel 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetobjectinfo-function
     */
    static JetGetObjectInfoA(sesid, dbid, objtyp, szContainerName, szObjectName, pvResult, cbMax, InfoLevel) {
        result := DllCall("ESENT.dll\JetGetObjectInfoA", "ptr", sesid, "uint", dbid, "uint", objtyp, "ptr", szContainerName, "ptr", szObjectName, "ptr", pvResult, "uint", cbMax, "uint", InfoLevel, "int")
        return result
    }

    /**
     * Learn more about: JetGetObjectInfo Function
     * @param {Pointer} sesid 
     * @param {Integer} dbid 
     * @param {Integer} objtyp 
     * @param {Pointer<UInt16>} szContainerName 
     * @param {Pointer<UInt16>} szObjectName 
     * @param {Pointer<Void>} pvResult 
     * @param {Integer} cbMax 
     * @param {Integer} InfoLevel 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetobjectinfo-function
     */
    static JetGetObjectInfoW(sesid, dbid, objtyp, szContainerName, szObjectName, pvResult, cbMax, InfoLevel) {
        result := DllCall("ESENT.dll\JetGetObjectInfoW", "ptr", sesid, "uint", dbid, "uint", objtyp, "ptr", szContainerName, "ptr", szObjectName, "ptr", pvResult, "uint", cbMax, "uint", InfoLevel, "int")
        return result
    }

    /**
     * Learn more about: JetGetTableInfo Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<Void>} pvResult 
     * @param {Integer} cbMax 
     * @param {Integer} InfoLevel 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgettableinfo-function
     */
    static JetGetTableInfoA(sesid, tableid, pvResult, cbMax, InfoLevel) {
        result := DllCall("ESENT.dll\JetGetTableInfoA", "ptr", sesid, "ptr", tableid, "ptr", pvResult, "uint", cbMax, "uint", InfoLevel, "int")
        return result
    }

    /**
     * Learn more about: JetGetTableInfo Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<Void>} pvResult 
     * @param {Integer} cbMax 
     * @param {Integer} InfoLevel 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgettableinfo-function
     */
    static JetGetTableInfoW(sesid, tableid, pvResult, cbMax, InfoLevel) {
        result := DllCall("ESENT.dll\JetGetTableInfoW", "ptr", sesid, "ptr", tableid, "ptr", pvResult, "uint", cbMax, "uint", InfoLevel, "int")
        return result
    }

    /**
     * Learn more about: JetCreateTable Function
     * @param {Pointer} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<SByte>} szTableName 
     * @param {Integer} lPages 
     * @param {Integer} lDensity 
     * @param {Pointer<UIntPtr>} ptableid 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreatetable-function
     */
    static JetCreateTableA(sesid, dbid, szTableName, lPages, lDensity, ptableid) {
        result := DllCall("ESENT.dll\JetCreateTableA", "ptr", sesid, "uint", dbid, "ptr", szTableName, "uint", lPages, "uint", lDensity, "ptr", ptableid, "int")
        return result
    }

    /**
     * Learn more about: JetCreateTable Function
     * @param {Pointer} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<UInt16>} szTableName 
     * @param {Integer} lPages 
     * @param {Integer} lDensity 
     * @param {Pointer<UIntPtr>} ptableid 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreatetable-function
     */
    static JetCreateTableW(sesid, dbid, szTableName, lPages, lDensity, ptableid) {
        result := DllCall("ESENT.dll\JetCreateTableW", "ptr", sesid, "uint", dbid, "ptr", szTableName, "uint", lPages, "uint", lDensity, "ptr", ptableid, "int")
        return result
    }

    /**
     * Learn more about: JetCreateTableColumnIndex Function
     * @param {Pointer} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<JET_TABLECREATE_A>} ptablecreate 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreatetablecolumnindex-function
     */
    static JetCreateTableColumnIndexA(sesid, dbid, ptablecreate) {
        result := DllCall("ESENT.dll\JetCreateTableColumnIndexA", "ptr", sesid, "uint", dbid, "ptr", ptablecreate, "int")
        return result
    }

    /**
     * Learn more about: JetCreateTableColumnIndex Function
     * @param {Pointer} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<JET_TABLECREATE_W>} ptablecreate 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreatetablecolumnindex-function
     */
    static JetCreateTableColumnIndexW(sesid, dbid, ptablecreate) {
        result := DllCall("ESENT.dll\JetCreateTableColumnIndexW", "ptr", sesid, "uint", dbid, "ptr", ptablecreate, "int")
        return result
    }

    /**
     * Learn more about: JetCreateTableColumnIndex2 Function
     * @param {Pointer} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<JET_TABLECREATE2_A>} ptablecreate 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreatetablecolumnindex2-function
     */
    static JetCreateTableColumnIndex2A(sesid, dbid, ptablecreate) {
        result := DllCall("ESENT.dll\JetCreateTableColumnIndex2A", "ptr", sesid, "uint", dbid, "ptr", ptablecreate, "int")
        return result
    }

    /**
     * Learn more about: JetCreateTableColumnIndex2 Function
     * @param {Pointer} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<JET_TABLECREATE2_W>} ptablecreate 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreatetablecolumnindex2-function
     */
    static JetCreateTableColumnIndex2W(sesid, dbid, ptablecreate) {
        result := DllCall("ESENT.dll\JetCreateTableColumnIndex2W", "ptr", sesid, "uint", dbid, "ptr", ptablecreate, "int")
        return result
    }

    /**
     * Learn more about: JetCreateTableColumnIndex3 Function
     * @param {Pointer} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<JET_TABLECREATE3_A>} ptablecreate 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreatetablecolumnindex3-function
     */
    static JetCreateTableColumnIndex3A(sesid, dbid, ptablecreate) {
        result := DllCall("ESENT.dll\JetCreateTableColumnIndex3A", "ptr", sesid, "uint", dbid, "ptr", ptablecreate, "int")
        return result
    }

    /**
     * Learn more about: JetCreateTableColumnIndex3 Function
     * @param {Pointer} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<JET_TABLECREATE3_W>} ptablecreate 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreatetablecolumnindex3-function
     */
    static JetCreateTableColumnIndex3W(sesid, dbid, ptablecreate) {
        result := DllCall("ESENT.dll\JetCreateTableColumnIndex3W", "ptr", sesid, "uint", dbid, "ptr", ptablecreate, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<JET_TABLECREATE4_A>} ptablecreate 
     * @returns {Integer} 
     */
    static JetCreateTableColumnIndex4A(sesid, dbid, ptablecreate) {
        result := DllCall("ESENT.dll\JetCreateTableColumnIndex4A", "ptr", sesid, "uint", dbid, "ptr", ptablecreate, "int")
        return result
    }

    /**
     * Learn more about: JetCreateTableColumnIndex4W Function
     * @param {Pointer} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<JET_TABLECREATE4_W>} ptablecreate 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreatetablecolumnindex4w-function
     */
    static JetCreateTableColumnIndex4W(sesid, dbid, ptablecreate) {
        result := DllCall("ESENT.dll\JetCreateTableColumnIndex4W", "ptr", sesid, "uint", dbid, "ptr", ptablecreate, "int")
        return result
    }

    /**
     * Learn more about: JetDeleteTable Function
     * @param {Pointer} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<SByte>} szTableName 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetdeletetable-function
     */
    static JetDeleteTableA(sesid, dbid, szTableName) {
        result := DllCall("ESENT.dll\JetDeleteTableA", "ptr", sesid, "uint", dbid, "ptr", szTableName, "int")
        return result
    }

    /**
     * Learn more about: JetDeleteTable Function
     * @param {Pointer} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<UInt16>} szTableName 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetdeletetable-function
     */
    static JetDeleteTableW(sesid, dbid, szTableName) {
        result := DllCall("ESENT.dll\JetDeleteTableW", "ptr", sesid, "uint", dbid, "ptr", szTableName, "int")
        return result
    }

    /**
     * Learn more about: JetRenameTable Function
     * @param {Pointer} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<SByte>} szName 
     * @param {Pointer<SByte>} szNameNew 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetrenametable-function
     */
    static JetRenameTableA(sesid, dbid, szName, szNameNew) {
        result := DllCall("ESENT.dll\JetRenameTableA", "ptr", sesid, "uint", dbid, "ptr", szName, "ptr", szNameNew, "int")
        return result
    }

    /**
     * Learn more about: JetRenameTable Function
     * @param {Pointer} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<UInt16>} szName 
     * @param {Pointer<UInt16>} szNameNew 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetrenametable-function
     */
    static JetRenameTableW(sesid, dbid, szName, szNameNew) {
        result := DllCall("ESENT.dll\JetRenameTableW", "ptr", sesid, "uint", dbid, "ptr", szName, "ptr", szNameNew, "int")
        return result
    }

    /**
     * Learn more about: JetGetTableColumnInfo Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<SByte>} szColumnName 
     * @param {Pointer<Void>} pvResult 
     * @param {Integer} cbMax 
     * @param {Integer} InfoLevel 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgettablecolumninfo-function
     */
    static JetGetTableColumnInfoA(sesid, tableid, szColumnName, pvResult, cbMax, InfoLevel) {
        result := DllCall("ESENT.dll\JetGetTableColumnInfoA", "ptr", sesid, "ptr", tableid, "ptr", szColumnName, "ptr", pvResult, "uint", cbMax, "uint", InfoLevel, "int")
        return result
    }

    /**
     * Learn more about: JetGetTableColumnInfo Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<UInt16>} szColumnName 
     * @param {Pointer<Void>} pvResult 
     * @param {Integer} cbMax 
     * @param {Integer} InfoLevel 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgettablecolumninfo-function
     */
    static JetGetTableColumnInfoW(sesid, tableid, szColumnName, pvResult, cbMax, InfoLevel) {
        result := DllCall("ESENT.dll\JetGetTableColumnInfoW", "ptr", sesid, "ptr", tableid, "ptr", szColumnName, "ptr", pvResult, "uint", cbMax, "uint", InfoLevel, "int")
        return result
    }

    /**
     * Learn more about: JetGetColumnInfo Function
     * @param {Pointer} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<SByte>} szTableName 
     * @param {Pointer<SByte>} pColumnNameOrId 
     * @param {Pointer<Void>} pvResult 
     * @param {Integer} cbMax 
     * @param {Integer} InfoLevel 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetcolumninfo-function
     */
    static JetGetColumnInfoA(sesid, dbid, szTableName, pColumnNameOrId, pvResult, cbMax, InfoLevel) {
        result := DllCall("ESENT.dll\JetGetColumnInfoA", "ptr", sesid, "uint", dbid, "ptr", szTableName, "ptr", pColumnNameOrId, "ptr", pvResult, "uint", cbMax, "uint", InfoLevel, "int")
        return result
    }

    /**
     * Learn more about: JetGetColumnInfo Function
     * @param {Pointer} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<UInt16>} szTableName 
     * @param {Pointer<UInt16>} pwColumnNameOrId 
     * @param {Pointer<Void>} pvResult 
     * @param {Integer} cbMax 
     * @param {Integer} InfoLevel 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetcolumninfo-function
     */
    static JetGetColumnInfoW(sesid, dbid, szTableName, pwColumnNameOrId, pvResult, cbMax, InfoLevel) {
        result := DllCall("ESENT.dll\JetGetColumnInfoW", "ptr", sesid, "uint", dbid, "ptr", szTableName, "ptr", pwColumnNameOrId, "ptr", pvResult, "uint", cbMax, "uint", InfoLevel, "int")
        return result
    }

    /**
     * Learn more about: JetAddColumn Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<SByte>} szColumnName 
     * @param {Pointer<JET_COLUMNDEF>} pcolumndef 
     * @param {Pointer<Void>} pvDefault 
     * @param {Integer} cbDefault 
     * @param {Pointer<UInt32>} pcolumnid 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetaddcolumn-function
     */
    static JetAddColumnA(sesid, tableid, szColumnName, pcolumndef, pvDefault, cbDefault, pcolumnid) {
        result := DllCall("ESENT.dll\JetAddColumnA", "ptr", sesid, "ptr", tableid, "ptr", szColumnName, "ptr", pcolumndef, "ptr", pvDefault, "uint", cbDefault, "ptr", pcolumnid, "int")
        return result
    }

    /**
     * Learn more about: JetAddColumn Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<UInt16>} szColumnName 
     * @param {Pointer<JET_COLUMNDEF>} pcolumndef 
     * @param {Pointer<Void>} pvDefault 
     * @param {Integer} cbDefault 
     * @param {Pointer<UInt32>} pcolumnid 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetaddcolumn-function
     */
    static JetAddColumnW(sesid, tableid, szColumnName, pcolumndef, pvDefault, cbDefault, pcolumnid) {
        result := DllCall("ESENT.dll\JetAddColumnW", "ptr", sesid, "ptr", tableid, "ptr", szColumnName, "ptr", pcolumndef, "ptr", pvDefault, "uint", cbDefault, "ptr", pcolumnid, "int")
        return result
    }

    /**
     * Learn more about: JetDeleteColumn Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<SByte>} szColumnName 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetdeletecolumn-function
     */
    static JetDeleteColumnA(sesid, tableid, szColumnName) {
        result := DllCall("ESENT.dll\JetDeleteColumnA", "ptr", sesid, "ptr", tableid, "ptr", szColumnName, "int")
        return result
    }

    /**
     * Learn more about: JetDeleteColumn Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<UInt16>} szColumnName 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetdeletecolumn-function
     */
    static JetDeleteColumnW(sesid, tableid, szColumnName) {
        result := DllCall("ESENT.dll\JetDeleteColumnW", "ptr", sesid, "ptr", tableid, "ptr", szColumnName, "int")
        return result
    }

    /**
     * Learn more about: JetDeleteColumn2 Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<SByte>} szColumnName 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetdeletecolumn2-function
     */
    static JetDeleteColumn2A(sesid, tableid, szColumnName, grbit) {
        result := DllCall("ESENT.dll\JetDeleteColumn2A", "ptr", sesid, "ptr", tableid, "ptr", szColumnName, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetDeleteColumn2 Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<UInt16>} szColumnName 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetdeletecolumn2-function
     */
    static JetDeleteColumn2W(sesid, tableid, szColumnName, grbit) {
        result := DllCall("ESENT.dll\JetDeleteColumn2W", "ptr", sesid, "ptr", tableid, "ptr", szColumnName, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<SByte>} szName 
     * @param {Pointer<SByte>} szNameNew 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetRenameColumnA(sesid, tableid, szName, szNameNew, grbit) {
        result := DllCall("ESENT.dll\JetRenameColumnA", "ptr", sesid, "ptr", tableid, "ptr", szName, "ptr", szNameNew, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<UInt16>} szName 
     * @param {Pointer<UInt16>} szNameNew 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetRenameColumnW(sesid, tableid, szName, szNameNew, grbit) {
        result := DllCall("ESENT.dll\JetRenameColumnW", "ptr", sesid, "ptr", tableid, "ptr", szName, "ptr", szNameNew, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<SByte>} szTableName 
     * @param {Pointer<SByte>} szColumnName 
     * @param {Pointer<Void>} pvData 
     * @param {Integer} cbData 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetSetColumnDefaultValueA(sesid, dbid, szTableName, szColumnName, pvData, cbData, grbit) {
        result := DllCall("ESENT.dll\JetSetColumnDefaultValueA", "ptr", sesid, "uint", dbid, "ptr", szTableName, "ptr", szColumnName, "ptr", pvData, "uint", cbData, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<UInt16>} szTableName 
     * @param {Pointer<UInt16>} szColumnName 
     * @param {Pointer<Void>} pvData 
     * @param {Integer} cbData 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetSetColumnDefaultValueW(sesid, dbid, szTableName, szColumnName, pvData, cbData, grbit) {
        result := DllCall("ESENT.dll\JetSetColumnDefaultValueW", "ptr", sesid, "uint", dbid, "ptr", szTableName, "ptr", szColumnName, "ptr", pvData, "uint", cbData, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetGetTableIndexInfo Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<SByte>} szIndexName 
     * @param {Pointer<Void>} pvResult 
     * @param {Integer} cbResult 
     * @param {Integer} InfoLevel 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgettableindexinfo-function
     */
    static JetGetTableIndexInfoA(sesid, tableid, szIndexName, pvResult, cbResult, InfoLevel) {
        result := DllCall("ESENT.dll\JetGetTableIndexInfoA", "ptr", sesid, "ptr", tableid, "ptr", szIndexName, "ptr", pvResult, "uint", cbResult, "uint", InfoLevel, "int")
        return result
    }

    /**
     * Learn more about: JetGetTableIndexInfo Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<UInt16>} szIndexName 
     * @param {Pointer<Void>} pvResult 
     * @param {Integer} cbResult 
     * @param {Integer} InfoLevel 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgettableindexinfo-function
     */
    static JetGetTableIndexInfoW(sesid, tableid, szIndexName, pvResult, cbResult, InfoLevel) {
        result := DllCall("ESENT.dll\JetGetTableIndexInfoW", "ptr", sesid, "ptr", tableid, "ptr", szIndexName, "ptr", pvResult, "uint", cbResult, "uint", InfoLevel, "int")
        return result
    }

    /**
     * Learn more about: JetGetIndexInfo Function
     * @param {Pointer} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<SByte>} szTableName 
     * @param {Pointer<SByte>} szIndexName 
     * @param {Pointer<Void>} pvResult 
     * @param {Integer} cbResult 
     * @param {Integer} InfoLevel 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetindexinfo-function
     */
    static JetGetIndexInfoA(sesid, dbid, szTableName, szIndexName, pvResult, cbResult, InfoLevel) {
        result := DllCall("ESENT.dll\JetGetIndexInfoA", "ptr", sesid, "uint", dbid, "ptr", szTableName, "ptr", szIndexName, "ptr", pvResult, "uint", cbResult, "uint", InfoLevel, "int")
        return result
    }

    /**
     * Learn more about: JetGetIndexInfo Function
     * @param {Pointer} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<UInt16>} szTableName 
     * @param {Pointer<UInt16>} szIndexName 
     * @param {Pointer<Void>} pvResult 
     * @param {Integer} cbResult 
     * @param {Integer} InfoLevel 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetindexinfo-function
     */
    static JetGetIndexInfoW(sesid, dbid, szTableName, szIndexName, pvResult, cbResult, InfoLevel) {
        result := DllCall("ESENT.dll\JetGetIndexInfoW", "ptr", sesid, "uint", dbid, "ptr", szTableName, "ptr", szIndexName, "ptr", pvResult, "uint", cbResult, "uint", InfoLevel, "int")
        return result
    }

    /**
     * Learn more about: JetCreateIndex Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<SByte>} szIndexName 
     * @param {Integer} grbit 
     * @param {Pointer<PSTR>} szKey 
     * @param {Integer} cbKey 
     * @param {Integer} lDensity 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreateindex-function
     */
    static JetCreateIndexA(sesid, tableid, szIndexName, grbit, szKey, cbKey, lDensity) {
        szKey := szKey is String? StrPtr(szKey) : szKey

        result := DllCall("ESENT.dll\JetCreateIndexA", "ptr", sesid, "ptr", tableid, "ptr", szIndexName, "uint", grbit, "ptr", szKey, "uint", cbKey, "uint", lDensity, "int")
        return result
    }

    /**
     * Learn more about: JetCreateIndex Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<UInt16>} szIndexName 
     * @param {Integer} grbit 
     * @param {Pointer<PWSTR>} szKey 
     * @param {Integer} cbKey 
     * @param {Integer} lDensity 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreateindex-function
     */
    static JetCreateIndexW(sesid, tableid, szIndexName, grbit, szKey, cbKey, lDensity) {
        szKey := szKey is String? StrPtr(szKey) : szKey

        result := DllCall("ESENT.dll\JetCreateIndexW", "ptr", sesid, "ptr", tableid, "ptr", szIndexName, "uint", grbit, "ptr", szKey, "uint", cbKey, "uint", lDensity, "int")
        return result
    }

    /**
     * Learn more about: JetCreateIndex2 Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<JET_INDEXCREATE_A>} pindexcreate 
     * @param {Integer} cIndexCreate 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreateindex2-function
     */
    static JetCreateIndex2A(sesid, tableid, pindexcreate, cIndexCreate) {
        result := DllCall("ESENT.dll\JetCreateIndex2A", "ptr", sesid, "ptr", tableid, "ptr", pindexcreate, "uint", cIndexCreate, "int")
        return result
    }

    /**
     * Learn more about: JetCreateIndex2 Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<JET_INDEXCREATE_W>} pindexcreate 
     * @param {Integer} cIndexCreate 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreateindex2-function
     */
    static JetCreateIndex2W(sesid, tableid, pindexcreate, cIndexCreate) {
        result := DllCall("ESENT.dll\JetCreateIndex2W", "ptr", sesid, "ptr", tableid, "ptr", pindexcreate, "uint", cIndexCreate, "int")
        return result
    }

    /**
     * Learn more about: JetCreateIndex3 Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<JET_INDEXCREATE2_A>} pindexcreate 
     * @param {Integer} cIndexCreate 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreateindex3-function
     */
    static JetCreateIndex3A(sesid, tableid, pindexcreate, cIndexCreate) {
        result := DllCall("ESENT.dll\JetCreateIndex3A", "ptr", sesid, "ptr", tableid, "ptr", pindexcreate, "uint", cIndexCreate, "int")
        return result
    }

    /**
     * Learn more about: JetCreateIndex3 Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<JET_INDEXCREATE2_W>} pindexcreate 
     * @param {Integer} cIndexCreate 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreateindex3-function
     */
    static JetCreateIndex3W(sesid, tableid, pindexcreate, cIndexCreate) {
        result := DllCall("ESENT.dll\JetCreateIndex3W", "ptr", sesid, "ptr", tableid, "ptr", pindexcreate, "uint", cIndexCreate, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<JET_INDEXCREATE3_A>} pindexcreate 
     * @param {Integer} cIndexCreate 
     * @returns {Integer} 
     */
    static JetCreateIndex4A(sesid, tableid, pindexcreate, cIndexCreate) {
        result := DllCall("ESENT.dll\JetCreateIndex4A", "ptr", sesid, "ptr", tableid, "ptr", pindexcreate, "uint", cIndexCreate, "int")
        return result
    }

    /**
     * Learn more about: JetCreateIndex4W Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<JET_INDEXCREATE3_W>} pindexcreate 
     * @param {Integer} cIndexCreate 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreateindex4w-function
     */
    static JetCreateIndex4W(sesid, tableid, pindexcreate, cIndexCreate) {
        result := DllCall("ESENT.dll\JetCreateIndex4W", "ptr", sesid, "ptr", tableid, "ptr", pindexcreate, "uint", cIndexCreate, "int")
        return result
    }

    /**
     * Learn more about: JetDeleteIndex Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<SByte>} szIndexName 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetdeleteindex-function
     */
    static JetDeleteIndexA(sesid, tableid, szIndexName) {
        result := DllCall("ESENT.dll\JetDeleteIndexA", "ptr", sesid, "ptr", tableid, "ptr", szIndexName, "int")
        return result
    }

    /**
     * Learn more about: JetDeleteIndex Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<UInt16>} szIndexName 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetdeleteindex-function
     */
    static JetDeleteIndexW(sesid, tableid, szIndexName) {
        result := DllCall("ESENT.dll\JetDeleteIndexW", "ptr", sesid, "ptr", tableid, "ptr", szIndexName, "int")
        return result
    }

    /**
     * Learn more about: JetBeginTransaction Function
     * @param {Pointer} sesid 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetbegintransaction-function
     */
    static JetBeginTransaction(sesid) {
        result := DllCall("ESENT.dll\JetBeginTransaction", "ptr", sesid, "int")
        return result
    }

    /**
     * Learn more about: JetBeginTransaction2 Function
     * @param {Pointer} sesid 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetbegintransaction2-function
     */
    static JetBeginTransaction2(sesid, grbit) {
        result := DllCall("ESENT.dll\JetBeginTransaction2", "ptr", sesid, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetBeginTransaction3 Function
     * @param {Pointer} sesid 
     * @param {Integer} trxid 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetbegintransaction3-function
     */
    static JetBeginTransaction3(sesid, trxid, grbit) {
        result := DllCall("ESENT.dll\JetBeginTransaction3", "ptr", sesid, "int64", trxid, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetCommitTransaction Function
     * @param {Pointer} sesid 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcommittransaction-function
     */
    static JetCommitTransaction(sesid, grbit) {
        result := DllCall("ESENT.dll\JetCommitTransaction", "ptr", sesid, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetCommitTransaction2 Function
     * @param {Pointer} sesid 
     * @param {Integer} grbit 
     * @param {Integer} cmsecDurableCommit 
     * @param {Pointer<JET_COMMIT_ID>} pCommitId 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcommittransaction2-function
     */
    static JetCommitTransaction2(sesid, grbit, cmsecDurableCommit, pCommitId) {
        result := DllCall("ESENT.dll\JetCommitTransaction2", "ptr", sesid, "uint", grbit, "uint", cmsecDurableCommit, "ptr", pCommitId, "int")
        return result
    }

    /**
     * Learn more about: JetRollback Function
     * @param {Pointer} sesid 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetrollback-function
     */
    static JetRollback(sesid, grbit) {
        result := DllCall("ESENT.dll\JetRollback", "ptr", sesid, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<Void>} pvResult 
     * @param {Integer} cbMax 
     * @param {Integer} InfoLevel 
     * @returns {Integer} 
     */
    static JetGetDatabaseInfoA(sesid, dbid, pvResult, cbMax, InfoLevel) {
        result := DllCall("ESENT.dll\JetGetDatabaseInfoA", "ptr", sesid, "uint", dbid, "ptr", pvResult, "uint", cbMax, "uint", InfoLevel, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<Void>} pvResult 
     * @param {Integer} cbMax 
     * @param {Integer} InfoLevel 
     * @returns {Integer} 
     */
    static JetGetDatabaseInfoW(sesid, dbid, pvResult, cbMax, InfoLevel) {
        result := DllCall("ESENT.dll\JetGetDatabaseInfoW", "ptr", sesid, "uint", dbid, "ptr", pvResult, "uint", cbMax, "uint", InfoLevel, "int")
        return result
    }

    /**
     * Learn more about: JetGetDatabaseFileInfo Function
     * @param {Pointer<SByte>} szDatabaseName 
     * @param {Pointer<Void>} pvResult 
     * @param {Integer} cbMax 
     * @param {Integer} InfoLevel 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetdatabasefileinfo-function
     */
    static JetGetDatabaseFileInfoA(szDatabaseName, pvResult, cbMax, InfoLevel) {
        result := DllCall("ESENT.dll\JetGetDatabaseFileInfoA", "ptr", szDatabaseName, "ptr", pvResult, "uint", cbMax, "uint", InfoLevel, "int")
        return result
    }

    /**
     * Learn more about: JetGetDatabaseFileInfo Function
     * @param {Pointer<UInt16>} szDatabaseName 
     * @param {Pointer<Void>} pvResult 
     * @param {Integer} cbMax 
     * @param {Integer} InfoLevel 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetdatabasefileinfo-function
     */
    static JetGetDatabaseFileInfoW(szDatabaseName, pvResult, cbMax, InfoLevel) {
        result := DllCall("ESENT.dll\JetGetDatabaseFileInfoW", "ptr", szDatabaseName, "ptr", pvResult, "uint", cbMax, "uint", InfoLevel, "int")
        return result
    }

    /**
     * Learn more about: JetOpenDatabase Function
     * @param {Pointer} sesid 
     * @param {Pointer<SByte>} szFilename 
     * @param {Pointer<SByte>} szConnect 
     * @param {Pointer<UInt32>} pdbid 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetopendatabase-function
     */
    static JetOpenDatabaseA(sesid, szFilename, szConnect, pdbid, grbit) {
        result := DllCall("ESENT.dll\JetOpenDatabaseA", "ptr", sesid, "ptr", szFilename, "ptr", szConnect, "ptr", pdbid, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetOpenDatabase Function
     * @param {Pointer} sesid 
     * @param {Pointer<UInt16>} szFilename 
     * @param {Pointer<UInt16>} szConnect 
     * @param {Pointer<UInt32>} pdbid 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetopendatabase-function
     */
    static JetOpenDatabaseW(sesid, szFilename, szConnect, pdbid, grbit) {
        result := DllCall("ESENT.dll\JetOpenDatabaseW", "ptr", sesid, "ptr", szFilename, "ptr", szConnect, "ptr", pdbid, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetCloseDatabase Function
     * @param {Pointer} sesid 
     * @param {Integer} dbid 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetclosedatabase-function
     */
    static JetCloseDatabase(sesid, dbid, grbit) {
        result := DllCall("ESENT.dll\JetCloseDatabase", "ptr", sesid, "uint", dbid, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetOpenTable Function
     * @param {Pointer} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<SByte>} szTableName 
     * @param {Pointer<Void>} pvParameters 
     * @param {Integer} cbParameters 
     * @param {Integer} grbit 
     * @param {Pointer<UIntPtr>} ptableid 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetopentable-function
     */
    static JetOpenTableA(sesid, dbid, szTableName, pvParameters, cbParameters, grbit, ptableid) {
        result := DllCall("ESENT.dll\JetOpenTableA", "ptr", sesid, "uint", dbid, "ptr", szTableName, "ptr", pvParameters, "uint", cbParameters, "uint", grbit, "ptr", ptableid, "int")
        return result
    }

    /**
     * Learn more about: JetOpenTable Function
     * @param {Pointer} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<UInt16>} szTableName 
     * @param {Pointer<Void>} pvParameters 
     * @param {Integer} cbParameters 
     * @param {Integer} grbit 
     * @param {Pointer<UIntPtr>} ptableid 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetopentable-function
     */
    static JetOpenTableW(sesid, dbid, szTableName, pvParameters, cbParameters, grbit, ptableid) {
        result := DllCall("ESENT.dll\JetOpenTableW", "ptr", sesid, "uint", dbid, "ptr", szTableName, "ptr", pvParameters, "uint", cbParameters, "uint", grbit, "ptr", ptableid, "int")
        return result
    }

    /**
     * Learn more about: JetSetTableSequential Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetsettablesequential-function
     */
    static JetSetTableSequential(sesid, tableid, grbit) {
        result := DllCall("ESENT.dll\JetSetTableSequential", "ptr", sesid, "ptr", tableid, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetResetTableSequential Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetresettablesequential-function
     */
    static JetResetTableSequential(sesid, tableid, grbit) {
        result := DllCall("ESENT.dll\JetResetTableSequential", "ptr", sesid, "ptr", tableid, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetCloseTable Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetclosetable-function
     */
    static JetCloseTable(sesid, tableid) {
        result := DllCall("ESENT.dll\JetCloseTable", "ptr", sesid, "ptr", tableid, "int")
        return result
    }

    /**
     * Learn more about: JetDelete Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetdelete-function
     */
    static JetDelete(sesid, tableid) {
        result := DllCall("ESENT.dll\JetDelete", "ptr", sesid, "ptr", tableid, "int")
        return result
    }

    /**
     * Learn more about: JetUpdate Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<Void>} pvBookmark 
     * @param {Integer} cbBookmark 
     * @param {Pointer<UInt32>} pcbActual 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetupdate-function
     */
    static JetUpdate(sesid, tableid, pvBookmark, cbBookmark, pcbActual) {
        result := DllCall("ESENT.dll\JetUpdate", "ptr", sesid, "ptr", tableid, "ptr", pvBookmark, "uint", cbBookmark, "ptr", pcbActual, "int")
        return result
    }

    /**
     * Learn more about: JetUpdate2 Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<Void>} pvBookmark 
     * @param {Integer} cbBookmark 
     * @param {Pointer<UInt32>} pcbActual 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetupdate2-function
     */
    static JetUpdate2(sesid, tableid, pvBookmark, cbBookmark, pcbActual, grbit) {
        result := DllCall("ESENT.dll\JetUpdate2", "ptr", sesid, "ptr", tableid, "ptr", pvBookmark, "uint", cbBookmark, "ptr", pcbActual, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetEscrowUpdate Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Integer} columnid 
     * @param {Pointer<Void>} pv 
     * @param {Integer} cbMax 
     * @param {Pointer<Void>} pvOld 
     * @param {Integer} cbOldMax 
     * @param {Pointer<UInt32>} pcbOldActual 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetescrowupdate-function
     */
    static JetEscrowUpdate(sesid, tableid, columnid, pv, cbMax, pvOld, cbOldMax, pcbOldActual, grbit) {
        result := DllCall("ESENT.dll\JetEscrowUpdate", "ptr", sesid, "ptr", tableid, "uint", columnid, "ptr", pv, "uint", cbMax, "ptr", pvOld, "uint", cbOldMax, "ptr", pcbOldActual, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetRetrieveColumn Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Integer} columnid 
     * @param {Pointer<Void>} pvData 
     * @param {Integer} cbData 
     * @param {Pointer<UInt32>} pcbActual 
     * @param {Integer} grbit 
     * @param {Pointer<JET_RETINFO>} pretinfo 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetretrievecolumn-function
     */
    static JetRetrieveColumn(sesid, tableid, columnid, pvData, cbData, pcbActual, grbit, pretinfo) {
        result := DllCall("ESENT.dll\JetRetrieveColumn", "ptr", sesid, "ptr", tableid, "uint", columnid, "ptr", pvData, "uint", cbData, "ptr", pcbActual, "uint", grbit, "ptr", pretinfo, "int")
        return result
    }

    /**
     * Learn more about: JetRetrieveColumns Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<JET_RETRIEVECOLUMN>} pretrievecolumn 
     * @param {Integer} cretrievecolumn 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetretrievecolumns-function
     */
    static JetRetrieveColumns(sesid, tableid, pretrievecolumn, cretrievecolumn) {
        result := DllCall("ESENT.dll\JetRetrieveColumns", "ptr", sesid, "ptr", tableid, "ptr", pretrievecolumn, "uint", cretrievecolumn, "int")
        return result
    }

    /**
     * Describes the JetEnumerateColumns function and provides the function's parameters, return value, remarks, and requirements.
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Integer} cEnumColumnId 
     * @param {Pointer<JET_ENUMCOLUMNID>} rgEnumColumnId 
     * @param {Pointer<UInt32>} pcEnumColumn 
     * @param {Pointer<JET_ENUMCOLUMN>} prgEnumColumn 
     * @param {Pointer<JET_PFNREALLOC>} pfnRealloc 
     * @param {Pointer<Void>} pvReallocContext 
     * @param {Integer} cbDataMost 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetenumeratecolumns-function
     */
    static JetEnumerateColumns(sesid, tableid, cEnumColumnId, rgEnumColumnId, pcEnumColumn, prgEnumColumn, pfnRealloc, pvReallocContext, cbDataMost, grbit) {
        result := DllCall("ESENT.dll\JetEnumerateColumns", "ptr", sesid, "ptr", tableid, "uint", cEnumColumnId, "ptr", rgEnumColumnId, "ptr", pcEnumColumn, "ptr", prgEnumColumn, "ptr", pfnRealloc, "ptr", pvReallocContext, "uint", cbDataMost, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetGetRecordSize Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<JET_RECSIZE>} precsize 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetrecordsize-function
     */
    static JetGetRecordSize(sesid, tableid, precsize, grbit) {
        result := DllCall("ESENT.dll\JetGetRecordSize", "ptr", sesid, "ptr", tableid, "ptr", precsize, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetGetRecordSize2 Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<JET_RECSIZE2>} precsize 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetrecordsize2-function
     */
    static JetGetRecordSize2(sesid, tableid, precsize, grbit) {
        result := DllCall("ESENT.dll\JetGetRecordSize2", "ptr", sesid, "ptr", tableid, "ptr", precsize, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetSetColumn Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Integer} columnid 
     * @param {Pointer<Void>} pvData 
     * @param {Integer} cbData 
     * @param {Integer} grbit 
     * @param {Pointer<JET_SETINFO>} psetinfo 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetsetcolumn-function
     */
    static JetSetColumn(sesid, tableid, columnid, pvData, cbData, grbit, psetinfo) {
        result := DllCall("ESENT.dll\JetSetColumn", "ptr", sesid, "ptr", tableid, "uint", columnid, "ptr", pvData, "uint", cbData, "uint", grbit, "ptr", psetinfo, "int")
        return result
    }

    /**
     * Learn more about: JetSetColumns Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<JET_SETCOLUMN>} psetcolumn 
     * @param {Integer} csetcolumn 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetsetcolumns-function
     */
    static JetSetColumns(sesid, tableid, psetcolumn, csetcolumn) {
        result := DllCall("ESENT.dll\JetSetColumns", "ptr", sesid, "ptr", tableid, "ptr", psetcolumn, "uint", csetcolumn, "int")
        return result
    }

    /**
     * Learn more about: JetPrepareUpdate Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Integer} prep 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetprepareupdate-function
     */
    static JetPrepareUpdate(sesid, tableid, prep) {
        result := DllCall("ESENT.dll\JetPrepareUpdate", "ptr", sesid, "ptr", tableid, "uint", prep, "int")
        return result
    }

    /**
     * Learn more about: JetGetRecordPosition Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<JET_RECPOS>} precpos 
     * @param {Integer} cbRecpos 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetrecordposition-function
     */
    static JetGetRecordPosition(sesid, tableid, precpos, cbRecpos) {
        result := DllCall("ESENT.dll\JetGetRecordPosition", "ptr", sesid, "ptr", tableid, "ptr", precpos, "uint", cbRecpos, "int")
        return result
    }

    /**
     * Learn more about: JetGotoPosition Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<JET_RECPOS>} precpos 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgotoposition-function
     */
    static JetGotoPosition(sesid, tableid, precpos) {
        result := DllCall("ESENT.dll\JetGotoPosition", "ptr", sesid, "ptr", tableid, "ptr", precpos, "int")
        return result
    }

    /**
     * Learn more about: JetGetCursorInfo Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<Void>} pvResult 
     * @param {Integer} cbMax 
     * @param {Integer} InfoLevel 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetcursorinfo-function
     */
    static JetGetCursorInfo(sesid, tableid, pvResult, cbMax, InfoLevel) {
        result := DllCall("ESENT.dll\JetGetCursorInfo", "ptr", sesid, "ptr", tableid, "ptr", pvResult, "uint", cbMax, "uint", InfoLevel, "int")
        return result
    }

    /**
     * Learn more about: JetDupCursor Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<UIntPtr>} ptableid 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetdupcursor-function
     */
    static JetDupCursor(sesid, tableid, ptableid, grbit) {
        result := DllCall("ESENT.dll\JetDupCursor", "ptr", sesid, "ptr", tableid, "ptr", ptableid, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetGetCurrentIndex Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<SByte>} szIndexName 
     * @param {Integer} cbIndexName 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetcurrentindex-function
     */
    static JetGetCurrentIndexA(sesid, tableid, szIndexName, cbIndexName) {
        result := DllCall("ESENT.dll\JetGetCurrentIndexA", "ptr", sesid, "ptr", tableid, "ptr", szIndexName, "uint", cbIndexName, "int")
        return result
    }

    /**
     * Learn more about: JetGetCurrentIndex Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<UInt16>} szIndexName 
     * @param {Integer} cbIndexName 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetcurrentindex-function
     */
    static JetGetCurrentIndexW(sesid, tableid, szIndexName, cbIndexName) {
        result := DllCall("ESENT.dll\JetGetCurrentIndexW", "ptr", sesid, "ptr", tableid, "ptr", szIndexName, "uint", cbIndexName, "int")
        return result
    }

    /**
     * Learn more about: JetSetCurrentIndex Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<SByte>} szIndexName 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetsetcurrentindex-function
     */
    static JetSetCurrentIndexA(sesid, tableid, szIndexName) {
        result := DllCall("ESENT.dll\JetSetCurrentIndexA", "ptr", sesid, "ptr", tableid, "ptr", szIndexName, "int")
        return result
    }

    /**
     * Learn more about: JetSetCurrentIndex Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<UInt16>} szIndexName 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetsetcurrentindex-function
     */
    static JetSetCurrentIndexW(sesid, tableid, szIndexName) {
        result := DllCall("ESENT.dll\JetSetCurrentIndexW", "ptr", sesid, "ptr", tableid, "ptr", szIndexName, "int")
        return result
    }

    /**
     * Learn more about: JetSetCurrentIndex2 Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<SByte>} szIndexName 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetsetcurrentindex2-function
     */
    static JetSetCurrentIndex2A(sesid, tableid, szIndexName, grbit) {
        result := DllCall("ESENT.dll\JetSetCurrentIndex2A", "ptr", sesid, "ptr", tableid, "ptr", szIndexName, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetSetCurrentIndex2 Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<UInt16>} szIndexName 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetsetcurrentindex2-function
     */
    static JetSetCurrentIndex2W(sesid, tableid, szIndexName, grbit) {
        result := DllCall("ESENT.dll\JetSetCurrentIndex2W", "ptr", sesid, "ptr", tableid, "ptr", szIndexName, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetSetCurrentIndex3 Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<SByte>} szIndexName 
     * @param {Integer} grbit 
     * @param {Integer} itagSequence 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetsetcurrentindex3-function
     */
    static JetSetCurrentIndex3A(sesid, tableid, szIndexName, grbit, itagSequence) {
        result := DllCall("ESENT.dll\JetSetCurrentIndex3A", "ptr", sesid, "ptr", tableid, "ptr", szIndexName, "uint", grbit, "uint", itagSequence, "int")
        return result
    }

    /**
     * Learn more about: JetSetCurrentIndex3 Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<UInt16>} szIndexName 
     * @param {Integer} grbit 
     * @param {Integer} itagSequence 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetsetcurrentindex3-function
     */
    static JetSetCurrentIndex3W(sesid, tableid, szIndexName, grbit, itagSequence) {
        result := DllCall("ESENT.dll\JetSetCurrentIndex3W", "ptr", sesid, "ptr", tableid, "ptr", szIndexName, "uint", grbit, "uint", itagSequence, "int")
        return result
    }

    /**
     * Learn more about: JetSetCurrentIndex4 Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<SByte>} szIndexName 
     * @param {Pointer<JET_INDEXID>} pindexid 
     * @param {Integer} grbit 
     * @param {Integer} itagSequence 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetsetcurrentindex4-function
     */
    static JetSetCurrentIndex4A(sesid, tableid, szIndexName, pindexid, grbit, itagSequence) {
        result := DllCall("ESENT.dll\JetSetCurrentIndex4A", "ptr", sesid, "ptr", tableid, "ptr", szIndexName, "ptr", pindexid, "uint", grbit, "uint", itagSequence, "int")
        return result
    }

    /**
     * Learn more about: JetSetCurrentIndex4 Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<UInt16>} szIndexName 
     * @param {Pointer<JET_INDEXID>} pindexid 
     * @param {Integer} grbit 
     * @param {Integer} itagSequence 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetsetcurrentindex4-function
     */
    static JetSetCurrentIndex4W(sesid, tableid, szIndexName, pindexid, grbit, itagSequence) {
        result := DllCall("ESENT.dll\JetSetCurrentIndex4W", "ptr", sesid, "ptr", tableid, "ptr", szIndexName, "ptr", pindexid, "uint", grbit, "uint", itagSequence, "int")
        return result
    }

    /**
     * Learn more about: JetMove Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Integer} cRow 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetmove-function
     */
    static JetMove(sesid, tableid, cRow, grbit) {
        result := DllCall("ESENT.dll\JetMove", "ptr", sesid, "ptr", tableid, "int", cRow, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetSetCursorFilter Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<JET_INDEX_COLUMN>} rgColumnFilters 
     * @param {Integer} cColumnFilters 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetsetcursorfilter-function
     */
    static JetSetCursorFilter(sesid, tableid, rgColumnFilters, cColumnFilters, grbit) {
        result := DllCall("ESENT.dll\JetSetCursorFilter", "ptr", sesid, "ptr", tableid, "ptr", rgColumnFilters, "uint", cColumnFilters, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetGetLock Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetlock-function
     */
    static JetGetLock(sesid, tableid, grbit) {
        result := DllCall("ESENT.dll\JetGetLock", "ptr", sesid, "ptr", tableid, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetMakeKey Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<Void>} pvData 
     * @param {Integer} cbData 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetmakekey-function
     */
    static JetMakeKey(sesid, tableid, pvData, cbData, grbit) {
        result := DllCall("ESENT.dll\JetMakeKey", "ptr", sesid, "ptr", tableid, "ptr", pvData, "uint", cbData, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetSeek Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetseek-function
     */
    static JetSeek(sesid, tableid, grbit) {
        result := DllCall("ESENT.dll\JetSeek", "ptr", sesid, "ptr", tableid, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetPrereadKeys Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<Void>} rgpvKeys 
     * @param {Pointer<UInt32>} rgcbKeys 
     * @param {Integer} ckeys 
     * @param {Pointer<Int32>} pckeysPreread 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetprereadkeys-function
     */
    static JetPrereadKeys(sesid, tableid, rgpvKeys, rgcbKeys, ckeys, pckeysPreread, grbit) {
        result := DllCall("ESENT.dll\JetPrereadKeys", "ptr", sesid, "ptr", tableid, "ptr", rgpvKeys, "ptr", rgcbKeys, "int", ckeys, "ptr", pckeysPreread, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetPrereadIndexRanges Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<JET_INDEX_RANGE>} rgIndexRanges 
     * @param {Integer} cIndexRanges 
     * @param {Pointer<UInt32>} pcRangesPreread 
     * @param {Pointer<UInt32>} rgcolumnidPreread 
     * @param {Integer} ccolumnidPreread 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetprereadindexranges-function
     */
    static JetPrereadIndexRanges(sesid, tableid, rgIndexRanges, cIndexRanges, pcRangesPreread, rgcolumnidPreread, ccolumnidPreread, grbit) {
        result := DllCall("ESENT.dll\JetPrereadIndexRanges", "ptr", sesid, "ptr", tableid, "ptr", rgIndexRanges, "uint", cIndexRanges, "ptr", pcRangesPreread, "ptr", rgcolumnidPreread, "uint", ccolumnidPreread, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetGetBookmark Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<Void>} pvBookmark 
     * @param {Integer} cbMax 
     * @param {Pointer<UInt32>} pcbActual 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetbookmark-function
     */
    static JetGetBookmark(sesid, tableid, pvBookmark, cbMax, pcbActual) {
        result := DllCall("ESENT.dll\JetGetBookmark", "ptr", sesid, "ptr", tableid, "ptr", pvBookmark, "uint", cbMax, "ptr", pcbActual, "int")
        return result
    }

    /**
     * Learn more about: JetGetSecondaryIndexBookmark Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<Void>} pvSecondaryKey 
     * @param {Integer} cbSecondaryKeyMax 
     * @param {Pointer<UInt32>} pcbSecondaryKeyActual 
     * @param {Pointer<Void>} pvPrimaryBookmark 
     * @param {Integer} cbPrimaryBookmarkMax 
     * @param {Pointer<UInt32>} pcbPrimaryBookmarkActual 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetsecondaryindexbookmark-function
     */
    static JetGetSecondaryIndexBookmark(sesid, tableid, pvSecondaryKey, cbSecondaryKeyMax, pcbSecondaryKeyActual, pvPrimaryBookmark, cbPrimaryBookmarkMax, pcbPrimaryBookmarkActual, grbit) {
        result := DllCall("ESENT.dll\JetGetSecondaryIndexBookmark", "ptr", sesid, "ptr", tableid, "ptr", pvSecondaryKey, "uint", cbSecondaryKeyMax, "ptr", pcbSecondaryKeyActual, "ptr", pvPrimaryBookmark, "uint", cbPrimaryBookmarkMax, "ptr", pcbPrimaryBookmarkActual, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetCompact Function
     * @param {Pointer} sesid 
     * @param {Pointer<SByte>} szDatabaseSrc 
     * @param {Pointer<SByte>} szDatabaseDest 
     * @param {Pointer<JET_PFNSTATUS>} pfnStatus 
     * @param {Pointer<JET_CONVERT_A>} pconvert 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcompact-function
     */
    static JetCompactA(sesid, szDatabaseSrc, szDatabaseDest, pfnStatus, pconvert, grbit) {
        result := DllCall("ESENT.dll\JetCompactA", "ptr", sesid, "ptr", szDatabaseSrc, "ptr", szDatabaseDest, "ptr", pfnStatus, "ptr", pconvert, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetCompact Function
     * @param {Pointer} sesid 
     * @param {Pointer<UInt16>} szDatabaseSrc 
     * @param {Pointer<UInt16>} szDatabaseDest 
     * @param {Pointer<JET_PFNSTATUS>} pfnStatus 
     * @param {Pointer<JET_CONVERT_W>} pconvert 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcompact-function
     */
    static JetCompactW(sesid, szDatabaseSrc, szDatabaseDest, pfnStatus, pconvert, grbit) {
        result := DllCall("ESENT.dll\JetCompactW", "ptr", sesid, "ptr", szDatabaseSrc, "ptr", szDatabaseDest, "ptr", pfnStatus, "ptr", pconvert, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetDefragment Function
     * @param {Pointer} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<SByte>} szTableName 
     * @param {Pointer<UInt32>} pcPasses 
     * @param {Pointer<UInt32>} pcSeconds 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetdefragment-function
     */
    static JetDefragmentA(sesid, dbid, szTableName, pcPasses, pcSeconds, grbit) {
        result := DllCall("ESENT.dll\JetDefragmentA", "ptr", sesid, "uint", dbid, "ptr", szTableName, "ptr", pcPasses, "ptr", pcSeconds, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetDefragment Function
     * @param {Pointer} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<UInt16>} szTableName 
     * @param {Pointer<UInt32>} pcPasses 
     * @param {Pointer<UInt32>} pcSeconds 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetdefragment-function
     */
    static JetDefragmentW(sesid, dbid, szTableName, pcPasses, pcSeconds, grbit) {
        result := DllCall("ESENT.dll\JetDefragmentW", "ptr", sesid, "uint", dbid, "ptr", szTableName, "ptr", pcPasses, "ptr", pcSeconds, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetDefragment2 Function
     * @param {Pointer} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<SByte>} szTableName 
     * @param {Pointer<UInt32>} pcPasses 
     * @param {Pointer<UInt32>} pcSeconds 
     * @param {Pointer<JET_CALLBACK>} callback 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetdefragment2-function
     */
    static JetDefragment2A(sesid, dbid, szTableName, pcPasses, pcSeconds, callback, grbit) {
        result := DllCall("ESENT.dll\JetDefragment2A", "ptr", sesid, "uint", dbid, "ptr", szTableName, "ptr", pcPasses, "ptr", pcSeconds, "ptr", callback, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetDefragment2 Function
     * @param {Pointer} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<UInt16>} szTableName 
     * @param {Pointer<UInt32>} pcPasses 
     * @param {Pointer<UInt32>} pcSeconds 
     * @param {Pointer<JET_CALLBACK>} callback 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetdefragment2-function
     */
    static JetDefragment2W(sesid, dbid, szTableName, pcPasses, pcSeconds, callback, grbit) {
        result := DllCall("ESENT.dll\JetDefragment2W", "ptr", sesid, "uint", dbid, "ptr", szTableName, "ptr", pcPasses, "ptr", pcSeconds, "ptr", callback, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} sesid 
     * @param {Pointer<SByte>} szDatabaseName 
     * @param {Pointer<SByte>} szTableName 
     * @param {Pointer<UInt32>} pcPasses 
     * @param {Pointer<UInt32>} pcSeconds 
     * @param {Pointer<JET_CALLBACK>} callback 
     * @param {Pointer<Void>} pvContext 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetDefragment3A(sesid, szDatabaseName, szTableName, pcPasses, pcSeconds, callback, pvContext, grbit) {
        result := DllCall("ESENT.dll\JetDefragment3A", "ptr", sesid, "ptr", szDatabaseName, "ptr", szTableName, "ptr", pcPasses, "ptr", pcSeconds, "ptr", callback, "ptr", pvContext, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} sesid 
     * @param {Pointer<UInt16>} szDatabaseName 
     * @param {Pointer<UInt16>} szTableName 
     * @param {Pointer<UInt32>} pcPasses 
     * @param {Pointer<UInt32>} pcSeconds 
     * @param {Pointer<JET_CALLBACK>} callback 
     * @param {Pointer<Void>} pvContext 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetDefragment3W(sesid, szDatabaseName, szTableName, pcPasses, pcSeconds, callback, pvContext, grbit) {
        result := DllCall("ESENT.dll\JetDefragment3W", "ptr", sesid, "ptr", szDatabaseName, "ptr", szTableName, "ptr", pcPasses, "ptr", pcSeconds, "ptr", callback, "ptr", pvContext, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetSetDatabaseSize Function
     * @param {Pointer} sesid 
     * @param {Pointer<SByte>} szDatabaseName 
     * @param {Integer} cpg 
     * @param {Pointer<UInt32>} pcpgReal 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetsetdatabasesize-function
     */
    static JetSetDatabaseSizeA(sesid, szDatabaseName, cpg, pcpgReal) {
        result := DllCall("ESENT.dll\JetSetDatabaseSizeA", "ptr", sesid, "ptr", szDatabaseName, "uint", cpg, "ptr", pcpgReal, "int")
        return result
    }

    /**
     * Learn more about: JetSetDatabaseSize Function
     * @param {Pointer} sesid 
     * @param {Pointer<UInt16>} szDatabaseName 
     * @param {Integer} cpg 
     * @param {Pointer<UInt32>} pcpgReal 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetsetdatabasesize-function
     */
    static JetSetDatabaseSizeW(sesid, szDatabaseName, cpg, pcpgReal) {
        result := DllCall("ESENT.dll\JetSetDatabaseSizeW", "ptr", sesid, "ptr", szDatabaseName, "uint", cpg, "ptr", pcpgReal, "int")
        return result
    }

    /**
     * Learn more about: JetGrowDatabase Function
     * @param {Pointer} sesid 
     * @param {Integer} dbid 
     * @param {Integer} cpg 
     * @param {Pointer<UInt32>} pcpgReal 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgrowdatabase-function
     */
    static JetGrowDatabase(sesid, dbid, cpg, pcpgReal) {
        result := DllCall("ESENT.dll\JetGrowDatabase", "ptr", sesid, "uint", dbid, "uint", cpg, "ptr", pcpgReal, "int")
        return result
    }

    /**
     * Learn more about: JetResizeDatabase Function
     * @param {Pointer} sesid 
     * @param {Integer} dbid 
     * @param {Integer} cpgTarget 
     * @param {Pointer<UInt32>} pcpgActual 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetresizedatabase-function
     */
    static JetResizeDatabase(sesid, dbid, cpgTarget, pcpgActual, grbit) {
        result := DllCall("ESENT.dll\JetResizeDatabase", "ptr", sesid, "uint", dbid, "uint", cpgTarget, "ptr", pcpgActual, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetSetSessionContext Function
     * @param {Pointer} sesid 
     * @param {Pointer} ulContext 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetsetsessioncontext-function
     */
    static JetSetSessionContext(sesid, ulContext) {
        result := DllCall("ESENT.dll\JetSetSessionContext", "ptr", sesid, "ptr", ulContext, "int")
        return result
    }

    /**
     * Learn more about: JetResetSessionContext Function
     * @param {Pointer} sesid 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetresetsessioncontext-function
     */
    static JetResetSessionContext(sesid) {
        result := DllCall("ESENT.dll\JetResetSessionContext", "ptr", sesid, "int")
        return result
    }

    /**
     * Learn more about: JetGotoBookmark Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<Void>} pvBookmark 
     * @param {Integer} cbBookmark 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgotobookmark-function
     */
    static JetGotoBookmark(sesid, tableid, pvBookmark, cbBookmark) {
        result := DllCall("ESENT.dll\JetGotoBookmark", "ptr", sesid, "ptr", tableid, "ptr", pvBookmark, "uint", cbBookmark, "int")
        return result
    }

    /**
     * Learn more about: JetGotoSecondaryIndexBookmark Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<Void>} pvSecondaryKey 
     * @param {Integer} cbSecondaryKey 
     * @param {Pointer<Void>} pvPrimaryBookmark 
     * @param {Integer} cbPrimaryBookmark 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgotosecondaryindexbookmark-function
     */
    static JetGotoSecondaryIndexBookmark(sesid, tableid, pvSecondaryKey, cbSecondaryKey, pvPrimaryBookmark, cbPrimaryBookmark, grbit) {
        result := DllCall("ESENT.dll\JetGotoSecondaryIndexBookmark", "ptr", sesid, "ptr", tableid, "ptr", pvSecondaryKey, "uint", cbSecondaryKey, "ptr", pvPrimaryBookmark, "uint", cbPrimaryBookmark, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetIntersectIndexes Function
     * @param {Pointer} sesid 
     * @param {Pointer<JET_INDEXRANGE>} rgindexrange 
     * @param {Integer} cindexrange 
     * @param {Pointer<JET_RECORDLIST>} precordlist 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetintersectindexes-function
     */
    static JetIntersectIndexes(sesid, rgindexrange, cindexrange, precordlist, grbit) {
        result := DllCall("ESENT.dll\JetIntersectIndexes", "ptr", sesid, "ptr", rgindexrange, "uint", cindexrange, "ptr", precordlist, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetComputeStats Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcomputestats-function
     */
    static JetComputeStats(sesid, tableid) {
        result := DllCall("ESENT.dll\JetComputeStats", "ptr", sesid, "ptr", tableid, "int")
        return result
    }

    /**
     * Learn more about: JetOpenTempTable Function
     * @param {Pointer} sesid 
     * @param {Pointer<JET_COLUMNDEF>} prgcolumndef 
     * @param {Integer} ccolumn 
     * @param {Integer} grbit 
     * @param {Pointer<UIntPtr>} ptableid 
     * @param {Pointer<UInt32>} prgcolumnid 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetopentemptable-function
     */
    static JetOpenTempTable(sesid, prgcolumndef, ccolumn, grbit, ptableid, prgcolumnid) {
        result := DllCall("ESENT.dll\JetOpenTempTable", "ptr", sesid, "ptr", prgcolumndef, "uint", ccolumn, "uint", grbit, "ptr", ptableid, "ptr", prgcolumnid, "int")
        return result
    }

    /**
     * Learn more about: JetOpenTempTable2 Function
     * @param {Pointer} sesid 
     * @param {Pointer<JET_COLUMNDEF>} prgcolumndef 
     * @param {Integer} ccolumn 
     * @param {Integer} lcid 
     * @param {Integer} grbit 
     * @param {Pointer<UIntPtr>} ptableid 
     * @param {Pointer<UInt32>} prgcolumnid 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetopentemptable2-function
     */
    static JetOpenTempTable2(sesid, prgcolumndef, ccolumn, lcid, grbit, ptableid, prgcolumnid) {
        result := DllCall("ESENT.dll\JetOpenTempTable2", "ptr", sesid, "ptr", prgcolumndef, "uint", ccolumn, "uint", lcid, "uint", grbit, "ptr", ptableid, "ptr", prgcolumnid, "int")
        return result
    }

    /**
     * Learn more about: JetOpenTempTable3 Function
     * @param {Pointer} sesid 
     * @param {Pointer<JET_COLUMNDEF>} prgcolumndef 
     * @param {Integer} ccolumn 
     * @param {Pointer<JET_UNICODEINDEX>} pidxunicode 
     * @param {Integer} grbit 
     * @param {Pointer<UIntPtr>} ptableid 
     * @param {Pointer<UInt32>} prgcolumnid 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetopentemptable3-function
     */
    static JetOpenTempTable3(sesid, prgcolumndef, ccolumn, pidxunicode, grbit, ptableid, prgcolumnid) {
        result := DllCall("ESENT.dll\JetOpenTempTable3", "ptr", sesid, "ptr", prgcolumndef, "uint", ccolumn, "ptr", pidxunicode, "uint", grbit, "ptr", ptableid, "ptr", prgcolumnid, "int")
        return result
    }

    /**
     * Learn more about: JetOpenTemporaryTable Function
     * @param {Pointer} sesid 
     * @param {Pointer<JET_OPENTEMPORARYTABLE>} popentemporarytable 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetopentemporarytable-function
     */
    static JetOpenTemporaryTable(sesid, popentemporarytable) {
        result := DllCall("ESENT.dll\JetOpenTemporaryTable", "ptr", sesid, "ptr", popentemporarytable, "int")
        return result
    }

    /**
     * Learn more about: JetOpenTemporaryTable2 Function
     * @param {Pointer} sesid 
     * @param {Pointer<JET_OPENTEMPORARYTABLE2>} popentemporarytable 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetopentemporarytable2-function
     */
    static JetOpenTemporaryTable2(sesid, popentemporarytable) {
        result := DllCall("ESENT.dll\JetOpenTemporaryTable2", "ptr", sesid, "ptr", popentemporarytable, "int")
        return result
    }

    /**
     * Learn more about: JetBackup Function
     * @param {Pointer<SByte>} szBackupPath 
     * @param {Integer} grbit 
     * @param {Pointer<JET_PFNSTATUS>} pfnStatus 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetbackup-function
     */
    static JetBackupA(szBackupPath, grbit, pfnStatus) {
        result := DllCall("ESENT.dll\JetBackupA", "ptr", szBackupPath, "uint", grbit, "ptr", pfnStatus, "int")
        return result
    }

    /**
     * Learn more about: JetBackup Function
     * @param {Pointer<UInt16>} szBackupPath 
     * @param {Integer} grbit 
     * @param {Pointer<JET_PFNSTATUS>} pfnStatus 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetbackup-function
     */
    static JetBackupW(szBackupPath, grbit, pfnStatus) {
        result := DllCall("ESENT.dll\JetBackupW", "ptr", szBackupPath, "uint", grbit, "ptr", pfnStatus, "int")
        return result
    }

    /**
     * Learn more about: JetBackupInstance Function
     * @param {Pointer} instance 
     * @param {Pointer<SByte>} szBackupPath 
     * @param {Integer} grbit 
     * @param {Pointer<JET_PFNSTATUS>} pfnStatus 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetbackupinstance-function
     */
    static JetBackupInstanceA(instance, szBackupPath, grbit, pfnStatus) {
        result := DllCall("ESENT.dll\JetBackupInstanceA", "ptr", instance, "ptr", szBackupPath, "uint", grbit, "ptr", pfnStatus, "int")
        return result
    }

    /**
     * Learn more about: JetBackupInstance Function
     * @param {Pointer} instance 
     * @param {Pointer<UInt16>} szBackupPath 
     * @param {Integer} grbit 
     * @param {Pointer<JET_PFNSTATUS>} pfnStatus 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetbackupinstance-function
     */
    static JetBackupInstanceW(instance, szBackupPath, grbit, pfnStatus) {
        result := DllCall("ESENT.dll\JetBackupInstanceW", "ptr", instance, "ptr", szBackupPath, "uint", grbit, "ptr", pfnStatus, "int")
        return result
    }

    /**
     * Learn more about: JetRestore Function
     * @param {Pointer<SByte>} szSource 
     * @param {Pointer<JET_PFNSTATUS>} pfn 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetrestore-function
     */
    static JetRestoreA(szSource, pfn) {
        result := DllCall("ESENT.dll\JetRestoreA", "ptr", szSource, "ptr", pfn, "int")
        return result
    }

    /**
     * Learn more about: JetRestore Function
     * @param {Pointer<UInt16>} szSource 
     * @param {Pointer<JET_PFNSTATUS>} pfn 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetrestore-function
     */
    static JetRestoreW(szSource, pfn) {
        result := DllCall("ESENT.dll\JetRestoreW", "ptr", szSource, "ptr", pfn, "int")
        return result
    }

    /**
     * Learn more about: JetRestore2 Function
     * @param {Pointer<SByte>} sz 
     * @param {Pointer<SByte>} szDest 
     * @param {Pointer<JET_PFNSTATUS>} pfn 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetrestore2-function
     */
    static JetRestore2A(sz, szDest, pfn) {
        result := DllCall("ESENT.dll\JetRestore2A", "ptr", sz, "ptr", szDest, "ptr", pfn, "int")
        return result
    }

    /**
     * Learn more about: JetRestore2 Function
     * @param {Pointer<UInt16>} sz 
     * @param {Pointer<UInt16>} szDest 
     * @param {Pointer<JET_PFNSTATUS>} pfn 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetrestore2-function
     */
    static JetRestore2W(sz, szDest, pfn) {
        result := DllCall("ESENT.dll\JetRestore2W", "ptr", sz, "ptr", szDest, "ptr", pfn, "int")
        return result
    }

    /**
     * Learn more about: JetRestoreInstance Function
     * @param {Pointer} instance 
     * @param {Pointer<SByte>} sz 
     * @param {Pointer<SByte>} szDest 
     * @param {Pointer<JET_PFNSTATUS>} pfn 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetrestoreinstance-function
     */
    static JetRestoreInstanceA(instance, sz, szDest, pfn) {
        result := DllCall("ESENT.dll\JetRestoreInstanceA", "ptr", instance, "ptr", sz, "ptr", szDest, "ptr", pfn, "int")
        return result
    }

    /**
     * Learn more about: JetRestoreInstance Function
     * @param {Pointer} instance 
     * @param {Pointer<UInt16>} sz 
     * @param {Pointer<UInt16>} szDest 
     * @param {Pointer<JET_PFNSTATUS>} pfn 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetrestoreinstance-function
     */
    static JetRestoreInstanceW(instance, sz, szDest, pfn) {
        result := DllCall("ESENT.dll\JetRestoreInstanceW", "ptr", instance, "ptr", sz, "ptr", szDest, "ptr", pfn, "int")
        return result
    }

    /**
     * Learn more about: JetSetIndexRange Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableidSrc 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetsetindexrange-function
     */
    static JetSetIndexRange(sesid, tableidSrc, grbit) {
        result := DllCall("ESENT.dll\JetSetIndexRange", "ptr", sesid, "ptr", tableidSrc, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetIndexRecordCount Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<UInt32>} pcrec 
     * @param {Integer} crecMax 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetindexrecordcount-function
     */
    static JetIndexRecordCount(sesid, tableid, pcrec, crecMax) {
        result := DllCall("ESENT.dll\JetIndexRecordCount", "ptr", sesid, "ptr", tableid, "ptr", pcrec, "uint", crecMax, "int")
        return result
    }

    /**
     * Learn more about: JetRetrieveKey Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<Void>} pvKey 
     * @param {Integer} cbMax 
     * @param {Pointer<UInt32>} pcbActual 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetretrievekey-function
     */
    static JetRetrieveKey(sesid, tableid, pvKey, cbMax, pcbActual, grbit) {
        result := DllCall("ESENT.dll\JetRetrieveKey", "ptr", sesid, "ptr", tableid, "ptr", pvKey, "uint", cbMax, "ptr", pcbActual, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetBeginExternalBackup Function
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetbeginexternalbackup-function
     */
    static JetBeginExternalBackup(grbit) {
        result := DllCall("ESENT.dll\JetBeginExternalBackup", "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetBeginExternalBackupInstance Function
     * @param {Pointer} instance 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetbeginexternalbackupinstance-function
     */
    static JetBeginExternalBackupInstance(instance, grbit) {
        result := DllCall("ESENT.dll\JetBeginExternalBackupInstance", "ptr", instance, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetGetAttachInfo Function
     * @param {Pointer<SByte>} szzDatabases 
     * @param {Integer} cbMax 
     * @param {Pointer<UInt32>} pcbActual 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetattachinfo-function
     */
    static JetGetAttachInfoA(szzDatabases, cbMax, pcbActual) {
        result := DllCall("ESENT.dll\JetGetAttachInfoA", "ptr", szzDatabases, "uint", cbMax, "ptr", pcbActual, "int")
        return result
    }

    /**
     * Learn more about: JetGetAttachInfo Function
     * @param {Pointer<UInt16>} wszzDatabases 
     * @param {Integer} cbMax 
     * @param {Pointer<UInt32>} pcbActual 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetattachinfo-function
     */
    static JetGetAttachInfoW(wszzDatabases, cbMax, pcbActual) {
        result := DllCall("ESENT.dll\JetGetAttachInfoW", "ptr", wszzDatabases, "uint", cbMax, "ptr", pcbActual, "int")
        return result
    }

    /**
     * Learn more about: JetGetAttachInfoInstance Function
     * @param {Pointer} instance 
     * @param {Pointer<SByte>} szzDatabases 
     * @param {Integer} cbMax 
     * @param {Pointer<UInt32>} pcbActual 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetattachinfoinstance-function
     */
    static JetGetAttachInfoInstanceA(instance, szzDatabases, cbMax, pcbActual) {
        result := DllCall("ESENT.dll\JetGetAttachInfoInstanceA", "ptr", instance, "ptr", szzDatabases, "uint", cbMax, "ptr", pcbActual, "int")
        return result
    }

    /**
     * Learn more about: JetGetAttachInfoInstance Function
     * @param {Pointer} instance 
     * @param {Pointer<UInt16>} szzDatabases 
     * @param {Integer} cbMax 
     * @param {Pointer<UInt32>} pcbActual 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetattachinfoinstance-function
     */
    static JetGetAttachInfoInstanceW(instance, szzDatabases, cbMax, pcbActual) {
        result := DllCall("ESENT.dll\JetGetAttachInfoInstanceW", "ptr", instance, "ptr", szzDatabases, "uint", cbMax, "ptr", pcbActual, "int")
        return result
    }

    /**
     * Learn more about: JetOpenFile Function
     * @param {Pointer<SByte>} szFileName 
     * @param {Pointer<UIntPtr>} phfFile 
     * @param {Pointer<UInt32>} pulFileSizeLow 
     * @param {Pointer<UInt32>} pulFileSizeHigh 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetopenfile-function
     */
    static JetOpenFileA(szFileName, phfFile, pulFileSizeLow, pulFileSizeHigh) {
        result := DllCall("ESENT.dll\JetOpenFileA", "ptr", szFileName, "ptr", phfFile, "ptr", pulFileSizeLow, "ptr", pulFileSizeHigh, "int")
        return result
    }

    /**
     * Learn more about: JetOpenFile Function
     * @param {Pointer<UInt16>} szFileName 
     * @param {Pointer<UIntPtr>} phfFile 
     * @param {Pointer<UInt32>} pulFileSizeLow 
     * @param {Pointer<UInt32>} pulFileSizeHigh 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetopenfile-function
     */
    static JetOpenFileW(szFileName, phfFile, pulFileSizeLow, pulFileSizeHigh) {
        result := DllCall("ESENT.dll\JetOpenFileW", "ptr", szFileName, "ptr", phfFile, "ptr", pulFileSizeLow, "ptr", pulFileSizeHigh, "int")
        return result
    }

    /**
     * Learn more about: JetOpenFileInstance Function
     * @param {Pointer} instance 
     * @param {Pointer<SByte>} szFileName 
     * @param {Pointer<UIntPtr>} phfFile 
     * @param {Pointer<UInt32>} pulFileSizeLow 
     * @param {Pointer<UInt32>} pulFileSizeHigh 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetopenfileinstance-function
     */
    static JetOpenFileInstanceA(instance, szFileName, phfFile, pulFileSizeLow, pulFileSizeHigh) {
        result := DllCall("ESENT.dll\JetOpenFileInstanceA", "ptr", instance, "ptr", szFileName, "ptr", phfFile, "ptr", pulFileSizeLow, "ptr", pulFileSizeHigh, "int")
        return result
    }

    /**
     * Learn more about: JetOpenFileInstance Function
     * @param {Pointer} instance 
     * @param {Pointer<UInt16>} szFileName 
     * @param {Pointer<UIntPtr>} phfFile 
     * @param {Pointer<UInt32>} pulFileSizeLow 
     * @param {Pointer<UInt32>} pulFileSizeHigh 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetopenfileinstance-function
     */
    static JetOpenFileInstanceW(instance, szFileName, phfFile, pulFileSizeLow, pulFileSizeHigh) {
        result := DllCall("ESENT.dll\JetOpenFileInstanceW", "ptr", instance, "ptr", szFileName, "ptr", phfFile, "ptr", pulFileSizeLow, "ptr", pulFileSizeHigh, "int")
        return result
    }

    /**
     * Learn more about: JetReadFile Function
     * @param {Pointer} hfFile 
     * @param {Pointer<Void>} pv 
     * @param {Integer} cb 
     * @param {Pointer<UInt32>} pcbActual 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetreadfile-function
     */
    static JetReadFile(hfFile, pv, cb, pcbActual) {
        result := DllCall("ESENT.dll\JetReadFile", "ptr", hfFile, "ptr", pv, "uint", cb, "ptr", pcbActual, "int")
        return result
    }

    /**
     * Learn more about: JetReadFileInstance Function
     * @param {Pointer} instance 
     * @param {Pointer} hfFile 
     * @param {Pointer<Void>} pv 
     * @param {Integer} cb 
     * @param {Pointer<UInt32>} pcbActual 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetreadfileinstance-function
     */
    static JetReadFileInstance(instance, hfFile, pv, cb, pcbActual) {
        result := DllCall("ESENT.dll\JetReadFileInstance", "ptr", instance, "ptr", hfFile, "ptr", pv, "uint", cb, "ptr", pcbActual, "int")
        return result
    }

    /**
     * Learn more about: JetCloseFile Function
     * @param {Pointer} hfFile 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetclosefile-function
     */
    static JetCloseFile(hfFile) {
        result := DllCall("ESENT.dll\JetCloseFile", "ptr", hfFile, "int")
        return result
    }

    /**
     * Learn more about: JetCloseFileInstance Function
     * @param {Pointer} instance 
     * @param {Pointer} hfFile 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetclosefileinstance-function
     */
    static JetCloseFileInstance(instance, hfFile) {
        result := DllCall("ESENT.dll\JetCloseFileInstance", "ptr", instance, "ptr", hfFile, "int")
        return result
    }

    /**
     * Learn more about: JetGetLogInfo Function
     * @param {Pointer<SByte>} szzLogs 
     * @param {Integer} cbMax 
     * @param {Pointer<UInt32>} pcbActual 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetloginfo-function
     */
    static JetGetLogInfoA(szzLogs, cbMax, pcbActual) {
        result := DllCall("ESENT.dll\JetGetLogInfoA", "ptr", szzLogs, "uint", cbMax, "ptr", pcbActual, "int")
        return result
    }

    /**
     * Learn more about: JetGetLogInfo Function
     * @param {Pointer<UInt16>} szzLogs 
     * @param {Integer} cbMax 
     * @param {Pointer<UInt32>} pcbActual 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetloginfo-function
     */
    static JetGetLogInfoW(szzLogs, cbMax, pcbActual) {
        result := DllCall("ESENT.dll\JetGetLogInfoW", "ptr", szzLogs, "uint", cbMax, "ptr", pcbActual, "int")
        return result
    }

    /**
     * Learn more about: JetGetLogInfoInstance Function
     * @param {Pointer} instance 
     * @param {Pointer<SByte>} szzLogs 
     * @param {Integer} cbMax 
     * @param {Pointer<UInt32>} pcbActual 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetloginfoinstance-function
     */
    static JetGetLogInfoInstanceA(instance, szzLogs, cbMax, pcbActual) {
        result := DllCall("ESENT.dll\JetGetLogInfoInstanceA", "ptr", instance, "ptr", szzLogs, "uint", cbMax, "ptr", pcbActual, "int")
        return result
    }

    /**
     * Learn more about: JetGetLogInfoInstance Function
     * @param {Pointer} instance 
     * @param {Pointer<UInt16>} wszzLogs 
     * @param {Integer} cbMax 
     * @param {Pointer<UInt32>} pcbActual 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetloginfoinstance-function
     */
    static JetGetLogInfoInstanceW(instance, wszzLogs, cbMax, pcbActual) {
        result := DllCall("ESENT.dll\JetGetLogInfoInstanceW", "ptr", instance, "ptr", wszzLogs, "uint", cbMax, "ptr", pcbActual, "int")
        return result
    }

    /**
     * Learn more about: JetGetLogInfoInstance2 Function
     * @param {Pointer} instance 
     * @param {Pointer<SByte>} szzLogs 
     * @param {Integer} cbMax 
     * @param {Pointer<UInt32>} pcbActual 
     * @param {Pointer<JET_LOGINFO_A>} pLogInfo 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetloginfoinstance2-function
     */
    static JetGetLogInfoInstance2A(instance, szzLogs, cbMax, pcbActual, pLogInfo) {
        result := DllCall("ESENT.dll\JetGetLogInfoInstance2A", "ptr", instance, "ptr", szzLogs, "uint", cbMax, "ptr", pcbActual, "ptr", pLogInfo, "int")
        return result
    }

    /**
     * Learn more about: JetGetLogInfoInstance2 Function
     * @param {Pointer} instance 
     * @param {Pointer<UInt16>} wszzLogs 
     * @param {Integer} cbMax 
     * @param {Pointer<UInt32>} pcbActual 
     * @param {Pointer<JET_LOGINFO_W>} pLogInfo 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetloginfoinstance2-function
     */
    static JetGetLogInfoInstance2W(instance, wszzLogs, cbMax, pcbActual, pLogInfo) {
        result := DllCall("ESENT.dll\JetGetLogInfoInstance2W", "ptr", instance, "ptr", wszzLogs, "uint", cbMax, "ptr", pcbActual, "ptr", pLogInfo, "int")
        return result
    }

    /**
     * Learn more about: JetGetTruncateLogInfoInstance Function
     * @param {Pointer} instance 
     * @param {Pointer<SByte>} szzLogs 
     * @param {Integer} cbMax 
     * @param {Pointer<UInt32>} pcbActual 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgettruncateloginfoinstance-function
     */
    static JetGetTruncateLogInfoInstanceA(instance, szzLogs, cbMax, pcbActual) {
        result := DllCall("ESENT.dll\JetGetTruncateLogInfoInstanceA", "ptr", instance, "ptr", szzLogs, "uint", cbMax, "ptr", pcbActual, "int")
        return result
    }

    /**
     * Learn more about: JetGetTruncateLogInfoInstance Function
     * @param {Pointer} instance 
     * @param {Pointer<UInt16>} wszzLogs 
     * @param {Integer} cbMax 
     * @param {Pointer<UInt32>} pcbActual 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgettruncateloginfoinstance-function
     */
    static JetGetTruncateLogInfoInstanceW(instance, wszzLogs, cbMax, pcbActual) {
        result := DllCall("ESENT.dll\JetGetTruncateLogInfoInstanceW", "ptr", instance, "ptr", wszzLogs, "uint", cbMax, "ptr", pcbActual, "int")
        return result
    }

    /**
     * Learn more about: JetTruncateLog Function
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jettruncatelog-function
     */
    static JetTruncateLog() {
        result := DllCall("ESENT.dll\JetTruncateLog", "int")
        return result
    }

    /**
     * Learn more about: JetTruncateLogInstance Function
     * @param {Pointer} instance 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jettruncateloginstance-function
     */
    static JetTruncateLogInstance(instance) {
        result := DllCall("ESENT.dll\JetTruncateLogInstance", "ptr", instance, "int")
        return result
    }

    /**
     * Learn more about: JetEndExternalBackup Function
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetendexternalbackup-function
     */
    static JetEndExternalBackup() {
        result := DllCall("ESENT.dll\JetEndExternalBackup", "int")
        return result
    }

    /**
     * Learn more about: JetEndExternalBackupInstance Function
     * @param {Pointer} instance 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetendexternalbackupinstance-function
     */
    static JetEndExternalBackupInstance(instance) {
        result := DllCall("ESENT.dll\JetEndExternalBackupInstance", "ptr", instance, "int")
        return result
    }

    /**
     * Learn more about: JetEndExternalBackupInstance2 Function
     * @param {Pointer} instance 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetendexternalbackupinstance2-function
     */
    static JetEndExternalBackupInstance2(instance, grbit) {
        result := DllCall("ESENT.dll\JetEndExternalBackupInstance2", "ptr", instance, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetExternalRestore Function
     * @param {Pointer<SByte>} szCheckpointFilePath 
     * @param {Pointer<SByte>} szLogPath 
     * @param {Pointer<JET_RSTMAP_A>} rgrstmap 
     * @param {Integer} crstfilemap 
     * @param {Pointer<SByte>} szBackupLogPath 
     * @param {Integer} genLow 
     * @param {Integer} genHigh 
     * @param {Pointer<JET_PFNSTATUS>} pfn 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetexternalrestore-function
     */
    static JetExternalRestoreA(szCheckpointFilePath, szLogPath, rgrstmap, crstfilemap, szBackupLogPath, genLow, genHigh, pfn) {
        result := DllCall("ESENT.dll\JetExternalRestoreA", "ptr", szCheckpointFilePath, "ptr", szLogPath, "ptr", rgrstmap, "int", crstfilemap, "ptr", szBackupLogPath, "int", genLow, "int", genHigh, "ptr", pfn, "int")
        return result
    }

    /**
     * Learn more about: JetExternalRestore Function
     * @param {Pointer<UInt16>} szCheckpointFilePath 
     * @param {Pointer<UInt16>} szLogPath 
     * @param {Pointer<JET_RSTMAP_W>} rgrstmap 
     * @param {Integer} crstfilemap 
     * @param {Pointer<UInt16>} szBackupLogPath 
     * @param {Integer} genLow 
     * @param {Integer} genHigh 
     * @param {Pointer<JET_PFNSTATUS>} pfn 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetexternalrestore-function
     */
    static JetExternalRestoreW(szCheckpointFilePath, szLogPath, rgrstmap, crstfilemap, szBackupLogPath, genLow, genHigh, pfn) {
        result := DllCall("ESENT.dll\JetExternalRestoreW", "ptr", szCheckpointFilePath, "ptr", szLogPath, "ptr", rgrstmap, "int", crstfilemap, "ptr", szBackupLogPath, "int", genLow, "int", genHigh, "ptr", pfn, "int")
        return result
    }

    /**
     * Learn more about: JetExternalRestore2 Function
     * @param {Pointer<SByte>} szCheckpointFilePath 
     * @param {Pointer<SByte>} szLogPath 
     * @param {Pointer<JET_RSTMAP_A>} rgrstmap 
     * @param {Integer} crstfilemap 
     * @param {Pointer<SByte>} szBackupLogPath 
     * @param {Pointer<JET_LOGINFO_A>} pLogInfo 
     * @param {Pointer<SByte>} szTargetInstanceName 
     * @param {Pointer<SByte>} szTargetInstanceLogPath 
     * @param {Pointer<SByte>} szTargetInstanceCheckpointPath 
     * @param {Pointer<JET_PFNSTATUS>} pfn 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetexternalrestore2-function
     */
    static JetExternalRestore2A(szCheckpointFilePath, szLogPath, rgrstmap, crstfilemap, szBackupLogPath, pLogInfo, szTargetInstanceName, szTargetInstanceLogPath, szTargetInstanceCheckpointPath, pfn) {
        result := DllCall("ESENT.dll\JetExternalRestore2A", "ptr", szCheckpointFilePath, "ptr", szLogPath, "ptr", rgrstmap, "int", crstfilemap, "ptr", szBackupLogPath, "ptr", pLogInfo, "ptr", szTargetInstanceName, "ptr", szTargetInstanceLogPath, "ptr", szTargetInstanceCheckpointPath, "ptr", pfn, "int")
        return result
    }

    /**
     * Learn more about: JetExternalRestore2 Function
     * @param {Pointer<UInt16>} szCheckpointFilePath 
     * @param {Pointer<UInt16>} szLogPath 
     * @param {Pointer<JET_RSTMAP_W>} rgrstmap 
     * @param {Integer} crstfilemap 
     * @param {Pointer<UInt16>} szBackupLogPath 
     * @param {Pointer<JET_LOGINFO_W>} pLogInfo 
     * @param {Pointer<UInt16>} szTargetInstanceName 
     * @param {Pointer<UInt16>} szTargetInstanceLogPath 
     * @param {Pointer<UInt16>} szTargetInstanceCheckpointPath 
     * @param {Pointer<JET_PFNSTATUS>} pfn 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetexternalrestore2-function
     */
    static JetExternalRestore2W(szCheckpointFilePath, szLogPath, rgrstmap, crstfilemap, szBackupLogPath, pLogInfo, szTargetInstanceName, szTargetInstanceLogPath, szTargetInstanceCheckpointPath, pfn) {
        result := DllCall("ESENT.dll\JetExternalRestore2W", "ptr", szCheckpointFilePath, "ptr", szLogPath, "ptr", rgrstmap, "int", crstfilemap, "ptr", szBackupLogPath, "ptr", pLogInfo, "ptr", szTargetInstanceName, "ptr", szTargetInstanceLogPath, "ptr", szTargetInstanceCheckpointPath, "ptr", pfn, "int")
        return result
    }

    /**
     * Learn more about: JetRegisterCallback Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Integer} cbtyp 
     * @param {Pointer<JET_CALLBACK>} pCallback 
     * @param {Pointer<Void>} pvContext 
     * @param {Pointer<UIntPtr>} phCallbackId 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetregistercallback-function
     */
    static JetRegisterCallback(sesid, tableid, cbtyp, pCallback, pvContext, phCallbackId) {
        result := DllCall("ESENT.dll\JetRegisterCallback", "ptr", sesid, "ptr", tableid, "uint", cbtyp, "ptr", pCallback, "ptr", pvContext, "ptr", phCallbackId, "int")
        return result
    }

    /**
     * Learn more about: JetUnregisterCallback Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Integer} cbtyp 
     * @param {Pointer} hCallbackId 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetunregistercallback-function
     */
    static JetUnregisterCallback(sesid, tableid, cbtyp, hCallbackId) {
        result := DllCall("ESENT.dll\JetUnregisterCallback", "ptr", sesid, "ptr", tableid, "uint", cbtyp, "ptr", hCallbackId, "int")
        return result
    }

    /**
     * Learn more about: JetGetInstanceInfo Function
     * @param {Pointer<UInt32>} pcInstanceInfo 
     * @param {Pointer<JET_INSTANCE_INFO_A>} paInstanceInfo 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetinstanceinfo-function
     */
    static JetGetInstanceInfoA(pcInstanceInfo, paInstanceInfo) {
        result := DllCall("ESENT.dll\JetGetInstanceInfoA", "ptr", pcInstanceInfo, "ptr", paInstanceInfo, "int")
        return result
    }

    /**
     * Learn more about: JetGetInstanceInfo Function
     * @param {Pointer<UInt32>} pcInstanceInfo 
     * @param {Pointer<JET_INSTANCE_INFO_W>} paInstanceInfo 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetinstanceinfo-function
     */
    static JetGetInstanceInfoW(pcInstanceInfo, paInstanceInfo) {
        result := DllCall("ESENT.dll\JetGetInstanceInfoW", "ptr", pcInstanceInfo, "ptr", paInstanceInfo, "int")
        return result
    }

    /**
     * Learn more about: JetFreeBuffer Function
     * @param {Pointer<PSTR>} pbBuf 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetfreebuffer-function
     */
    static JetFreeBuffer(pbBuf) {
        pbBuf := pbBuf is String? StrPtr(pbBuf) : pbBuf

        result := DllCall("ESENT.dll\JetFreeBuffer", "ptr", pbBuf, "int")
        return result
    }

    /**
     * Learn more about: JetSetLS Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer} ls 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetsetls-function
     */
    static JetSetLS(sesid, tableid, ls, grbit) {
        result := DllCall("ESENT.dll\JetSetLS", "ptr", sesid, "ptr", tableid, "ptr", ls, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetGetLS Function
     * @param {Pointer} sesid 
     * @param {Pointer} tableid 
     * @param {Pointer<UIntPtr>} pls 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetls-function
     */
    static JetGetLS(sesid, tableid, pls, grbit) {
        result := DllCall("ESENT.dll\JetGetLS", "ptr", sesid, "ptr", tableid, "ptr", pls, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetOSSnapshotPrepare Function
     * @param {Pointer<UIntPtr>} psnapId 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetossnapshotprepare-function
     */
    static JetOSSnapshotPrepare(psnapId, grbit) {
        result := DllCall("ESENT.dll\JetOSSnapshotPrepare", "ptr", psnapId, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetOSSnapshotPrepareInstance Function
     * @param {Pointer} snapId 
     * @param {Pointer} instance 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetossnapshotprepareinstance-function
     */
    static JetOSSnapshotPrepareInstance(snapId, instance, grbit) {
        result := DllCall("ESENT.dll\JetOSSnapshotPrepareInstance", "ptr", snapId, "ptr", instance, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetOSSnapshotFreeze Function
     * @param {Pointer} snapId 
     * @param {Pointer<UInt32>} pcInstanceInfo 
     * @param {Pointer<JET_INSTANCE_INFO_A>} paInstanceInfo 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetossnapshotfreeze-function
     */
    static JetOSSnapshotFreezeA(snapId, pcInstanceInfo, paInstanceInfo, grbit) {
        result := DllCall("ESENT.dll\JetOSSnapshotFreezeA", "ptr", snapId, "ptr", pcInstanceInfo, "ptr", paInstanceInfo, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetOSSnapshotFreeze Function
     * @param {Pointer} snapId 
     * @param {Pointer<UInt32>} pcInstanceInfo 
     * @param {Pointer<JET_INSTANCE_INFO_W>} paInstanceInfo 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetossnapshotfreeze-function
     */
    static JetOSSnapshotFreezeW(snapId, pcInstanceInfo, paInstanceInfo, grbit) {
        result := DllCall("ESENT.dll\JetOSSnapshotFreezeW", "ptr", snapId, "ptr", pcInstanceInfo, "ptr", paInstanceInfo, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetOSSnapshotThaw Function
     * @param {Pointer} snapId 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetossnapshotthaw-function
     */
    static JetOSSnapshotThaw(snapId, grbit) {
        result := DllCall("ESENT.dll\JetOSSnapshotThaw", "ptr", snapId, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetOSSnapshotAbort Function
     * @param {Pointer} snapId 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetossnapshotabort-function
     */
    static JetOSSnapshotAbort(snapId, grbit) {
        result := DllCall("ESENT.dll\JetOSSnapshotAbort", "ptr", snapId, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetOSSnapshotTruncateLog Function
     * @param {Pointer} snapId 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetossnapshottruncatelog-function
     */
    static JetOSSnapshotTruncateLog(snapId, grbit) {
        result := DllCall("ESENT.dll\JetOSSnapshotTruncateLog", "ptr", snapId, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetOSSnapshotTruncateLogInstance Function
     * @param {Pointer} snapId 
     * @param {Pointer} instance 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetossnapshottruncateloginstance-function
     */
    static JetOSSnapshotTruncateLogInstance(snapId, instance, grbit) {
        result := DllCall("ESENT.dll\JetOSSnapshotTruncateLogInstance", "ptr", snapId, "ptr", instance, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetOSSnapshotGetFreezeInfo Function
     * @param {Pointer} snapId 
     * @param {Pointer<UInt32>} pcInstanceInfo 
     * @param {Pointer<JET_INSTANCE_INFO_A>} paInstanceInfo 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetossnapshotgetfreezeinfo-function
     */
    static JetOSSnapshotGetFreezeInfoA(snapId, pcInstanceInfo, paInstanceInfo, grbit) {
        result := DllCall("ESENT.dll\JetOSSnapshotGetFreezeInfoA", "ptr", snapId, "ptr", pcInstanceInfo, "ptr", paInstanceInfo, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetOSSnapshotGetFreezeInfo Function
     * @param {Pointer} snapId 
     * @param {Pointer<UInt32>} pcInstanceInfo 
     * @param {Pointer<JET_INSTANCE_INFO_W>} paInstanceInfo 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetossnapshotgetfreezeinfo-function
     */
    static JetOSSnapshotGetFreezeInfoW(snapId, pcInstanceInfo, paInstanceInfo, grbit) {
        result := DllCall("ESENT.dll\JetOSSnapshotGetFreezeInfoW", "ptr", snapId, "ptr", pcInstanceInfo, "ptr", paInstanceInfo, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetOSSnapshotEnd Function
     * @param {Pointer} snapId 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetossnapshotend-function
     */
    static JetOSSnapshotEnd(snapId, grbit) {
        result := DllCall("ESENT.dll\JetOSSnapshotEnd", "ptr", snapId, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetConfigureProcessForCrashDump(grbit) {
        result := DllCall("ESENT.dll\JetConfigureProcessForCrashDump", "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetGetErrorInfoW Function
     * @param {Pointer<Void>} pvContext 
     * @param {Pointer<Void>} pvResult 
     * @param {Integer} cbMax 
     * @param {Integer} InfoLevel 
     * @param {Integer} grbit 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgeterrorinfow-function
     */
    static JetGetErrorInfoW(pvContext, pvResult, cbMax, InfoLevel, grbit) {
        result := DllCall("ESENT.dll\JetGetErrorInfoW", "ptr", pvContext, "ptr", pvResult, "uint", cbMax, "uint", InfoLevel, "uint", grbit, "int")
        return result
    }

    /**
     * Learn more about: JetSetSessionParameter Function
     * @param {Pointer} sesid 
     * @param {Integer} sesparamid 
     * @param {Pointer<Void>} pvParam 
     * @param {Integer} cbParam 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetsetsessionparameter-function
     */
    static JetSetSessionParameter(sesid, sesparamid, pvParam, cbParam) {
        result := DllCall("ESENT.dll\JetSetSessionParameter", "ptr", sesid, "uint", sesparamid, "ptr", pvParam, "uint", cbParam, "int")
        return result
    }

    /**
     * Learn more about: JetGetSessionParameter Function
     * @param {Pointer} sesid 
     * @param {Integer} sesparamid 
     * @param {Pointer<Void>} pvParam 
     * @param {Integer} cbParamMax 
     * @param {Pointer<UInt32>} pcbParamActual 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetsessionparameter-function
     */
    static JetGetSessionParameter(sesid, sesparamid, pvParam, cbParamMax, pcbParamActual) {
        result := DllCall("ESENT.dll\JetGetSessionParameter", "ptr", sesid, "uint", sesparamid, "ptr", pvParam, "uint", cbParamMax, "ptr", pcbParamActual, "int")
        return result
    }

;@endregion Methods
}

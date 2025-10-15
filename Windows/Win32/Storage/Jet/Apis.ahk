#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
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
    static JET_efvUseEngineDefault => 1073741825

    /**
     * @type {Integer (UInt32)}
     */
    static JET_efvUsePersistedFormat => 1073741826

    /**
     * @type {Integer (UInt32)}
     */
    static JET_efvAllowHigherPersistedFormat => 1090519040

    /**
     * @type {Integer (UInt32)}
     */
    static JET_efvWindows19H1Rtm => 8920

    /**
     * @type {Integer (UInt32)}
     */
    static JET_efvWindows10v2004 => 9180

    /**
     * @type {Integer (UInt32)}
     */
    static JET_efvWindowsServer2022 => 9360

    /**
     * @type {Integer (UInt32)}
     */
    static JET_efvWindows11v21H2 => 9400

    /**
     * @type {Integer (UInt32)}
     */
    static JET_efvWindows11v22H2 => 9480

    /**
     * @type {Integer (UInt32)}
     */
    static JET_efvWindows11v23H2 => 9600

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
    static JET_paramEngineFormatVersion => 194

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
    static JET_paramEnableBlockCache => 218

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramTraceFlags => 223

    /**
     * @type {Integer (UInt32)}
     */
    static JET_paramMaxValueInvalid => 232

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
    static JET_bitTTMaterializeBBT => 512

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
     * @type {Integer (Int32)}
     */
    static JET_errBBTNodeCorrupted => -364

    /**
     * @type {Integer (Int32)}
     */
    static JET_errBBTBuffCorrupted => -365

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
    static JET_errLogOperationInconsistentWithDatabase => -626

    /**
     * @type {Integer (Int32)}
     */
    static JET_errInsertKeyOutOfOrder => -627

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
    static JET_errSetAutoIncrementTooHigh => -1624

    /**
     * @type {Integer (Int32)}
     */
    static JET_errAutoIncrementNotSet => -1625

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
     * @type {Integer (Int32)}
     */
    static JET_errClientSpaceBegin => -10000

    /**
     * @type {Integer (Int32)}
     */
    static JET_errClientSpaceEnd => -11999

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
     * 
     * @param {Pointer<JET_INSTANCE>} pinstance 
     * @returns {Integer} 
     */
    static JetInit(pinstance) {
        result := DllCall("ESENT.dll\JetInit", "ptr", pinstance, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<JET_INSTANCE>} pinstance 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetInit2(pinstance, grbit) {
        result := DllCall("ESENT.dll\JetInit2", "ptr", pinstance, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<JET_INSTANCE>} pinstance 
     * @param {Pointer<JET_RSTINFO_A>} prstInfo 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetInit3A(pinstance, prstInfo, grbit) {
        result := DllCall("ESENT.dll\JetInit3A", "ptr", pinstance, "ptr", prstInfo, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<JET_INSTANCE>} pinstance 
     * @param {Pointer<JET_RSTINFO_W>} prstInfo 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetInit3W(pinstance, prstInfo, grbit) {
        result := DllCall("ESENT.dll\JetInit3W", "ptr", pinstance, "ptr", prstInfo, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<JET_INSTANCE>} pinstance 
     * @param {Pointer<SByte>} szInstanceName 
     * @returns {Integer} 
     */
    static JetCreateInstanceA(pinstance, szInstanceName) {
        result := DllCall("ESENT.dll\JetCreateInstanceA", "ptr", pinstance, "char*", szInstanceName, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<JET_INSTANCE>} pinstance 
     * @param {Pointer<UInt16>} szInstanceName 
     * @returns {Integer} 
     */
    static JetCreateInstanceW(pinstance, szInstanceName) {
        result := DllCall("ESENT.dll\JetCreateInstanceW", "ptr", pinstance, "ushort*", szInstanceName, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<JET_INSTANCE>} pinstance 
     * @param {Pointer<SByte>} szInstanceName 
     * @param {Pointer<SByte>} szDisplayName 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetCreateInstance2A(pinstance, szInstanceName, szDisplayName, grbit) {
        result := DllCall("ESENT.dll\JetCreateInstance2A", "ptr", pinstance, "char*", szInstanceName, "char*", szDisplayName, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<JET_INSTANCE>} pinstance 
     * @param {Pointer<UInt16>} szInstanceName 
     * @param {Pointer<UInt16>} szDisplayName 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetCreateInstance2W(pinstance, szInstanceName, szDisplayName, grbit) {
        result := DllCall("ESENT.dll\JetCreateInstance2W", "ptr", pinstance, "ushort*", szInstanceName, "ushort*", szDisplayName, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_INSTANCE} instance 
     * @param {Pointer} pvResult 
     * @param {Integer} cbMax 
     * @param {Integer} InfoLevel 
     * @returns {Integer} 
     */
    static JetGetInstanceMiscInfo(instance, pvResult, cbMax, InfoLevel) {
        instance := instance is Win32Handle ? NumGet(instance, "ptr") : instance

        result := DllCall("ESENT.dll\JetGetInstanceMiscInfo", "ptr", instance, "ptr", pvResult, "uint", cbMax, "uint", InfoLevel, "int")
        return result
    }

    /**
     * 
     * @param {JET_INSTANCE} instance 
     * @returns {Integer} 
     */
    static JetTerm(instance) {
        instance := instance is Win32Handle ? NumGet(instance, "ptr") : instance

        result := DllCall("ESENT.dll\JetTerm", "ptr", instance, "int")
        return result
    }

    /**
     * 
     * @param {JET_INSTANCE} instance 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetTerm2(instance, grbit) {
        instance := instance is Win32Handle ? NumGet(instance, "ptr") : instance

        result := DllCall("ESENT.dll\JetTerm2", "ptr", instance, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static JetStopService() {
        result := DllCall("ESENT.dll\JetStopService", "int")
        return result
    }

    /**
     * 
     * @param {JET_INSTANCE} instance 
     * @returns {Integer} 
     */
    static JetStopServiceInstance(instance) {
        instance := instance is Win32Handle ? NumGet(instance, "ptr") : instance

        result := DllCall("ESENT.dll\JetStopServiceInstance", "ptr", instance, "int")
        return result
    }

    /**
     * 
     * @param {JET_INSTANCE} instance 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetStopServiceInstance2(instance, grbit) {
        instance := instance is Win32Handle ? NumGet(instance, "ptr") : instance

        result := DllCall("ESENT.dll\JetStopServiceInstance2", "ptr", instance, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static JetStopBackup() {
        result := DllCall("ESENT.dll\JetStopBackup", "int")
        return result
    }

    /**
     * 
     * @param {JET_INSTANCE} instance 
     * @returns {Integer} 
     */
    static JetStopBackupInstance(instance) {
        instance := instance is Win32Handle ? NumGet(instance, "ptr") : instance

        result := DllCall("ESENT.dll\JetStopBackupInstance", "ptr", instance, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<JET_INSTANCE>} pinstance 
     * @param {JET_SESID} sesid 
     * @param {Integer} paramid 
     * @param {JET_API_PTR} lParam 
     * @param {Pointer<SByte>} szParam 
     * @returns {Integer} 
     */
    static JetSetSystemParameterA(pinstance, sesid, paramid, lParam, szParam) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        lParam := lParam is Win32Handle ? NumGet(lParam, "ptr") : lParam

        result := DllCall("ESENT.dll\JetSetSystemParameterA", "ptr", pinstance, "ptr", sesid, "uint", paramid, "ptr", lParam, "char*", szParam, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<JET_INSTANCE>} pinstance 
     * @param {JET_SESID} sesid 
     * @param {Integer} paramid 
     * @param {JET_API_PTR} lParam 
     * @param {Pointer<UInt16>} szParam 
     * @returns {Integer} 
     */
    static JetSetSystemParameterW(pinstance, sesid, paramid, lParam, szParam) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        lParam := lParam is Win32Handle ? NumGet(lParam, "ptr") : lParam

        result := DllCall("ESENT.dll\JetSetSystemParameterW", "ptr", pinstance, "ptr", sesid, "uint", paramid, "ptr", lParam, "ushort*", szParam, "int")
        return result
    }

    /**
     * 
     * @param {JET_INSTANCE} instance 
     * @param {JET_SESID} sesid 
     * @param {Integer} paramid 
     * @param {Pointer<JET_API_PTR>} plParam 
     * @param {Pointer} szParam 
     * @param {Integer} cbMax 
     * @returns {Integer} 
     */
    static JetGetSystemParameterA(instance, sesid, paramid, plParam, szParam, cbMax) {
        instance := instance is Win32Handle ? NumGet(instance, "ptr") : instance
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetGetSystemParameterA", "ptr", instance, "ptr", sesid, "uint", paramid, "ptr", plParam, "ptr", szParam, "uint", cbMax, "int")
        return result
    }

    /**
     * 
     * @param {JET_INSTANCE} instance 
     * @param {JET_SESID} sesid 
     * @param {Integer} paramid 
     * @param {Pointer<JET_API_PTR>} plParam 
     * @param {Pointer} szParam 
     * @param {Integer} cbMax 
     * @returns {Integer} 
     */
    static JetGetSystemParameterW(instance, sesid, paramid, plParam, szParam, cbMax) {
        instance := instance is Win32Handle ? NumGet(instance, "ptr") : instance
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetGetSystemParameterW", "ptr", instance, "ptr", sesid, "uint", paramid, "ptr", plParam, "ptr", szParam, "uint", cbMax, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<JET_SETSYSPARAM_A>} psetsysparam 
     * @param {Integer} csetsysparam 
     * @param {Pointer<UInt32>} pcsetsucceed 
     * @returns {Integer} 
     */
    static JetEnableMultiInstanceA(psetsysparam, csetsysparam, pcsetsucceed) {
        result := DllCall("ESENT.dll\JetEnableMultiInstanceA", "ptr", psetsysparam, "uint", csetsysparam, "uint*", pcsetsucceed, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<JET_SETSYSPARAM_W>} psetsysparam 
     * @param {Integer} csetsysparam 
     * @param {Pointer<UInt32>} pcsetsucceed 
     * @returns {Integer} 
     */
    static JetEnableMultiInstanceW(psetsysparam, csetsysparam, pcsetsucceed) {
        result := DllCall("ESENT.dll\JetEnableMultiInstanceW", "ptr", psetsysparam, "uint", csetsysparam, "uint*", pcsetsucceed, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} pvResult 
     * @param {Integer} cbMax 
     * @returns {Integer} 
     */
    static JetGetThreadStats(pvResult, cbMax) {
        result := DllCall("ESENT.dll\JetGetThreadStats", "ptr", pvResult, "uint", cbMax, "int")
        return result
    }

    /**
     * 
     * @param {JET_INSTANCE} instance 
     * @param {Pointer<JET_SESID>} psesid 
     * @param {Pointer<SByte>} szUserName 
     * @param {Pointer<SByte>} szPassword 
     * @returns {Integer} 
     */
    static JetBeginSessionA(instance, psesid, szUserName, szPassword) {
        instance := instance is Win32Handle ? NumGet(instance, "ptr") : instance

        result := DllCall("ESENT.dll\JetBeginSessionA", "ptr", instance, "ptr", psesid, "char*", szUserName, "char*", szPassword, "int")
        return result
    }

    /**
     * 
     * @param {JET_INSTANCE} instance 
     * @param {Pointer<JET_SESID>} psesid 
     * @param {Pointer<UInt16>} szUserName 
     * @param {Pointer<UInt16>} szPassword 
     * @returns {Integer} 
     */
    static JetBeginSessionW(instance, psesid, szUserName, szPassword) {
        instance := instance is Win32Handle ? NumGet(instance, "ptr") : instance

        result := DllCall("ESENT.dll\JetBeginSessionW", "ptr", instance, "ptr", psesid, "ushort*", szUserName, "ushort*", szPassword, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Pointer<JET_SESID>} psesid 
     * @returns {Integer} 
     */
    static JetDupSession(sesid, psesid) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetDupSession", "ptr", sesid, "ptr", psesid, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetEndSession(sesid, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetEndSession", "ptr", sesid, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Pointer<UInt32>} pwVersion 
     * @returns {Integer} 
     */
    static JetGetVersion(sesid, pwVersion) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetGetVersion", "ptr", sesid, "uint*", pwVersion, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetIdle(sesid, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetIdle", "ptr", sesid, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Pointer<SByte>} szFilename 
     * @param {Pointer<SByte>} szConnect 
     * @param {Pointer<UInt32>} pdbid 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetCreateDatabaseA(sesid, szFilename, szConnect, pdbid, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetCreateDatabaseA", "ptr", sesid, "char*", szFilename, "char*", szConnect, "uint*", pdbid, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Pointer<UInt16>} szFilename 
     * @param {Pointer<UInt16>} szConnect 
     * @param {Pointer<UInt32>} pdbid 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetCreateDatabaseW(sesid, szFilename, szConnect, pdbid, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetCreateDatabaseW", "ptr", sesid, "ushort*", szFilename, "ushort*", szConnect, "uint*", pdbid, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Pointer<SByte>} szFilename 
     * @param {Integer} cpgDatabaseSizeMax 
     * @param {Pointer<UInt32>} pdbid 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetCreateDatabase2A(sesid, szFilename, cpgDatabaseSizeMax, pdbid, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetCreateDatabase2A", "ptr", sesid, "char*", szFilename, "uint", cpgDatabaseSizeMax, "uint*", pdbid, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Pointer<UInt16>} szFilename 
     * @param {Integer} cpgDatabaseSizeMax 
     * @param {Pointer<UInt32>} pdbid 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetCreateDatabase2W(sesid, szFilename, cpgDatabaseSizeMax, pdbid, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetCreateDatabase2W", "ptr", sesid, "ushort*", szFilename, "uint", cpgDatabaseSizeMax, "uint*", pdbid, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Pointer<SByte>} szFilename 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetAttachDatabaseA(sesid, szFilename, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetAttachDatabaseA", "ptr", sesid, "char*", szFilename, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Pointer<UInt16>} szFilename 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetAttachDatabaseW(sesid, szFilename, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetAttachDatabaseW", "ptr", sesid, "ushort*", szFilename, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Pointer<SByte>} szFilename 
     * @param {Integer} cpgDatabaseSizeMax 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetAttachDatabase2A(sesid, szFilename, cpgDatabaseSizeMax, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetAttachDatabase2A", "ptr", sesid, "char*", szFilename, "uint", cpgDatabaseSizeMax, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Pointer<UInt16>} szFilename 
     * @param {Integer} cpgDatabaseSizeMax 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetAttachDatabase2W(sesid, szFilename, cpgDatabaseSizeMax, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetAttachDatabase2W", "ptr", sesid, "ushort*", szFilename, "uint", cpgDatabaseSizeMax, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Pointer<SByte>} szFilename 
     * @returns {Integer} 
     */
    static JetDetachDatabaseA(sesid, szFilename) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetDetachDatabaseA", "ptr", sesid, "char*", szFilename, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Pointer<UInt16>} szFilename 
     * @returns {Integer} 
     */
    static JetDetachDatabaseW(sesid, szFilename) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetDetachDatabaseW", "ptr", sesid, "ushort*", szFilename, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Pointer<SByte>} szFilename 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetDetachDatabase2A(sesid, szFilename, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetDetachDatabase2A", "ptr", sesid, "char*", szFilename, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Pointer<UInt16>} szFilename 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetDetachDatabase2W(sesid, szFilename, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetDetachDatabase2W", "ptr", sesid, "ushort*", szFilename, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Integer} dbid 
     * @param {Integer} objtyp 
     * @param {Pointer<SByte>} szContainerName 
     * @param {Pointer<SByte>} szObjectName 
     * @param {Pointer} pvResult 
     * @param {Integer} cbMax 
     * @param {Integer} InfoLevel 
     * @returns {Integer} 
     */
    static JetGetObjectInfoA(sesid, dbid, objtyp, szContainerName, szObjectName, pvResult, cbMax, InfoLevel) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetGetObjectInfoA", "ptr", sesid, "uint", dbid, "uint", objtyp, "char*", szContainerName, "char*", szObjectName, "ptr", pvResult, "uint", cbMax, "uint", InfoLevel, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Integer} dbid 
     * @param {Integer} objtyp 
     * @param {Pointer<UInt16>} szContainerName 
     * @param {Pointer<UInt16>} szObjectName 
     * @param {Pointer} pvResult 
     * @param {Integer} cbMax 
     * @param {Integer} InfoLevel 
     * @returns {Integer} 
     */
    static JetGetObjectInfoW(sesid, dbid, objtyp, szContainerName, szObjectName, pvResult, cbMax, InfoLevel) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetGetObjectInfoW", "ptr", sesid, "uint", dbid, "uint", objtyp, "ushort*", szContainerName, "ushort*", szObjectName, "ptr", pvResult, "uint", cbMax, "uint", InfoLevel, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer} pvResult 
     * @param {Integer} cbMax 
     * @param {Integer} InfoLevel 
     * @returns {Integer} 
     */
    static JetGetTableInfoA(sesid, tableid, pvResult, cbMax, InfoLevel) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetGetTableInfoA", "ptr", sesid, "ptr", tableid, "ptr", pvResult, "uint", cbMax, "uint", InfoLevel, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer} pvResult 
     * @param {Integer} cbMax 
     * @param {Integer} InfoLevel 
     * @returns {Integer} 
     */
    static JetGetTableInfoW(sesid, tableid, pvResult, cbMax, InfoLevel) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetGetTableInfoW", "ptr", sesid, "ptr", tableid, "ptr", pvResult, "uint", cbMax, "uint", InfoLevel, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<SByte>} szTableName 
     * @param {Integer} lPages 
     * @param {Integer} lDensity 
     * @param {Pointer<JET_TABLEID>} ptableid 
     * @returns {Integer} 
     */
    static JetCreateTableA(sesid, dbid, szTableName, lPages, lDensity, ptableid) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetCreateTableA", "ptr", sesid, "uint", dbid, "char*", szTableName, "uint", lPages, "uint", lDensity, "ptr", ptableid, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<UInt16>} szTableName 
     * @param {Integer} lPages 
     * @param {Integer} lDensity 
     * @param {Pointer<JET_TABLEID>} ptableid 
     * @returns {Integer} 
     */
    static JetCreateTableW(sesid, dbid, szTableName, lPages, lDensity, ptableid) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetCreateTableW", "ptr", sesid, "uint", dbid, "ushort*", szTableName, "uint", lPages, "uint", lDensity, "ptr", ptableid, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<JET_TABLECREATE_A>} ptablecreate 
     * @returns {Integer} 
     */
    static JetCreateTableColumnIndexA(sesid, dbid, ptablecreate) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetCreateTableColumnIndexA", "ptr", sesid, "uint", dbid, "ptr", ptablecreate, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<JET_TABLECREATE_W>} ptablecreate 
     * @returns {Integer} 
     */
    static JetCreateTableColumnIndexW(sesid, dbid, ptablecreate) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetCreateTableColumnIndexW", "ptr", sesid, "uint", dbid, "ptr", ptablecreate, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<JET_TABLECREATE2_A>} ptablecreate 
     * @returns {Integer} 
     */
    static JetCreateTableColumnIndex2A(sesid, dbid, ptablecreate) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetCreateTableColumnIndex2A", "ptr", sesid, "uint", dbid, "ptr", ptablecreate, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<JET_TABLECREATE2_W>} ptablecreate 
     * @returns {Integer} 
     */
    static JetCreateTableColumnIndex2W(sesid, dbid, ptablecreate) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetCreateTableColumnIndex2W", "ptr", sesid, "uint", dbid, "ptr", ptablecreate, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<JET_TABLECREATE3_A>} ptablecreate 
     * @returns {Integer} 
     */
    static JetCreateTableColumnIndex3A(sesid, dbid, ptablecreate) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetCreateTableColumnIndex3A", "ptr", sesid, "uint", dbid, "ptr", ptablecreate, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<JET_TABLECREATE3_W>} ptablecreate 
     * @returns {Integer} 
     */
    static JetCreateTableColumnIndex3W(sesid, dbid, ptablecreate) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetCreateTableColumnIndex3W", "ptr", sesid, "uint", dbid, "ptr", ptablecreate, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<JET_TABLECREATE4_A>} ptablecreate 
     * @returns {Integer} 
     */
    static JetCreateTableColumnIndex4A(sesid, dbid, ptablecreate) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetCreateTableColumnIndex4A", "ptr", sesid, "uint", dbid, "ptr", ptablecreate, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<JET_TABLECREATE4_W>} ptablecreate 
     * @returns {Integer} 
     */
    static JetCreateTableColumnIndex4W(sesid, dbid, ptablecreate) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetCreateTableColumnIndex4W", "ptr", sesid, "uint", dbid, "ptr", ptablecreate, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<SByte>} szTableName 
     * @returns {Integer} 
     */
    static JetDeleteTableA(sesid, dbid, szTableName) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetDeleteTableA", "ptr", sesid, "uint", dbid, "char*", szTableName, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<UInt16>} szTableName 
     * @returns {Integer} 
     */
    static JetDeleteTableW(sesid, dbid, szTableName) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetDeleteTableW", "ptr", sesid, "uint", dbid, "ushort*", szTableName, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<SByte>} szName 
     * @param {Pointer<SByte>} szNameNew 
     * @returns {Integer} 
     */
    static JetRenameTableA(sesid, dbid, szName, szNameNew) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetRenameTableA", "ptr", sesid, "uint", dbid, "char*", szName, "char*", szNameNew, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<UInt16>} szName 
     * @param {Pointer<UInt16>} szNameNew 
     * @returns {Integer} 
     */
    static JetRenameTableW(sesid, dbid, szName, szNameNew) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetRenameTableW", "ptr", sesid, "uint", dbid, "ushort*", szName, "ushort*", szNameNew, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer<SByte>} szColumnName 
     * @param {Pointer} pvResult 
     * @param {Integer} cbMax 
     * @param {Integer} InfoLevel 
     * @returns {Integer} 
     */
    static JetGetTableColumnInfoA(sesid, tableid, szColumnName, pvResult, cbMax, InfoLevel) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetGetTableColumnInfoA", "ptr", sesid, "ptr", tableid, "char*", szColumnName, "ptr", pvResult, "uint", cbMax, "uint", InfoLevel, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer<UInt16>} szColumnName 
     * @param {Pointer} pvResult 
     * @param {Integer} cbMax 
     * @param {Integer} InfoLevel 
     * @returns {Integer} 
     */
    static JetGetTableColumnInfoW(sesid, tableid, szColumnName, pvResult, cbMax, InfoLevel) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetGetTableColumnInfoW", "ptr", sesid, "ptr", tableid, "ushort*", szColumnName, "ptr", pvResult, "uint", cbMax, "uint", InfoLevel, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<SByte>} szTableName 
     * @param {Pointer<SByte>} pColumnNameOrId 
     * @param {Pointer} pvResult 
     * @param {Integer} cbMax 
     * @param {Integer} InfoLevel 
     * @returns {Integer} 
     */
    static JetGetColumnInfoA(sesid, dbid, szTableName, pColumnNameOrId, pvResult, cbMax, InfoLevel) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetGetColumnInfoA", "ptr", sesid, "uint", dbid, "char*", szTableName, "char*", pColumnNameOrId, "ptr", pvResult, "uint", cbMax, "uint", InfoLevel, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<UInt16>} szTableName 
     * @param {Pointer<UInt16>} pwColumnNameOrId 
     * @param {Pointer} pvResult 
     * @param {Integer} cbMax 
     * @param {Integer} InfoLevel 
     * @returns {Integer} 
     */
    static JetGetColumnInfoW(sesid, dbid, szTableName, pwColumnNameOrId, pvResult, cbMax, InfoLevel) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetGetColumnInfoW", "ptr", sesid, "uint", dbid, "ushort*", szTableName, "ushort*", pwColumnNameOrId, "ptr", pvResult, "uint", cbMax, "uint", InfoLevel, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer<SByte>} szColumnName 
     * @param {Pointer<JET_COLUMNDEF>} pcolumndef 
     * @param {Pointer} pvDefault 
     * @param {Integer} cbDefault 
     * @param {Pointer<UInt32>} pcolumnid 
     * @returns {Integer} 
     */
    static JetAddColumnA(sesid, tableid, szColumnName, pcolumndef, pvDefault, cbDefault, pcolumnid) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetAddColumnA", "ptr", sesid, "ptr", tableid, "char*", szColumnName, "ptr", pcolumndef, "ptr", pvDefault, "uint", cbDefault, "uint*", pcolumnid, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer<UInt16>} szColumnName 
     * @param {Pointer<JET_COLUMNDEF>} pcolumndef 
     * @param {Pointer} pvDefault 
     * @param {Integer} cbDefault 
     * @param {Pointer<UInt32>} pcolumnid 
     * @returns {Integer} 
     */
    static JetAddColumnW(sesid, tableid, szColumnName, pcolumndef, pvDefault, cbDefault, pcolumnid) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetAddColumnW", "ptr", sesid, "ptr", tableid, "ushort*", szColumnName, "ptr", pcolumndef, "ptr", pvDefault, "uint", cbDefault, "uint*", pcolumnid, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer<SByte>} szColumnName 
     * @returns {Integer} 
     */
    static JetDeleteColumnA(sesid, tableid, szColumnName) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetDeleteColumnA", "ptr", sesid, "ptr", tableid, "char*", szColumnName, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer<UInt16>} szColumnName 
     * @returns {Integer} 
     */
    static JetDeleteColumnW(sesid, tableid, szColumnName) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetDeleteColumnW", "ptr", sesid, "ptr", tableid, "ushort*", szColumnName, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer<SByte>} szColumnName 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetDeleteColumn2A(sesid, tableid, szColumnName, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetDeleteColumn2A", "ptr", sesid, "ptr", tableid, "char*", szColumnName, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer<UInt16>} szColumnName 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetDeleteColumn2W(sesid, tableid, szColumnName, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetDeleteColumn2W", "ptr", sesid, "ptr", tableid, "ushort*", szColumnName, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer<SByte>} szName 
     * @param {Pointer<SByte>} szNameNew 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetRenameColumnA(sesid, tableid, szName, szNameNew, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetRenameColumnA", "ptr", sesid, "ptr", tableid, "char*", szName, "char*", szNameNew, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer<UInt16>} szName 
     * @param {Pointer<UInt16>} szNameNew 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetRenameColumnW(sesid, tableid, szName, szNameNew, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetRenameColumnW", "ptr", sesid, "ptr", tableid, "ushort*", szName, "ushort*", szNameNew, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<SByte>} szTableName 
     * @param {Pointer<SByte>} szColumnName 
     * @param {Pointer} pvData 
     * @param {Integer} cbData 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetSetColumnDefaultValueA(sesid, dbid, szTableName, szColumnName, pvData, cbData, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetSetColumnDefaultValueA", "ptr", sesid, "uint", dbid, "char*", szTableName, "char*", szColumnName, "ptr", pvData, "uint", cbData, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<UInt16>} szTableName 
     * @param {Pointer<UInt16>} szColumnName 
     * @param {Pointer} pvData 
     * @param {Integer} cbData 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetSetColumnDefaultValueW(sesid, dbid, szTableName, szColumnName, pvData, cbData, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetSetColumnDefaultValueW", "ptr", sesid, "uint", dbid, "ushort*", szTableName, "ushort*", szColumnName, "ptr", pvData, "uint", cbData, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer<SByte>} szIndexName 
     * @param {Pointer} pvResult 
     * @param {Integer} cbResult 
     * @param {Integer} InfoLevel 
     * @returns {Integer} 
     */
    static JetGetTableIndexInfoA(sesid, tableid, szIndexName, pvResult, cbResult, InfoLevel) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetGetTableIndexInfoA", "ptr", sesid, "ptr", tableid, "char*", szIndexName, "ptr", pvResult, "uint", cbResult, "uint", InfoLevel, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer<UInt16>} szIndexName 
     * @param {Pointer} pvResult 
     * @param {Integer} cbResult 
     * @param {Integer} InfoLevel 
     * @returns {Integer} 
     */
    static JetGetTableIndexInfoW(sesid, tableid, szIndexName, pvResult, cbResult, InfoLevel) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetGetTableIndexInfoW", "ptr", sesid, "ptr", tableid, "ushort*", szIndexName, "ptr", pvResult, "uint", cbResult, "uint", InfoLevel, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<SByte>} szTableName 
     * @param {Pointer<SByte>} szIndexName 
     * @param {Pointer} pvResult 
     * @param {Integer} cbResult 
     * @param {Integer} InfoLevel 
     * @returns {Integer} 
     */
    static JetGetIndexInfoA(sesid, dbid, szTableName, szIndexName, pvResult, cbResult, InfoLevel) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetGetIndexInfoA", "ptr", sesid, "uint", dbid, "char*", szTableName, "char*", szIndexName, "ptr", pvResult, "uint", cbResult, "uint", InfoLevel, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<UInt16>} szTableName 
     * @param {Pointer<UInt16>} szIndexName 
     * @param {Pointer} pvResult 
     * @param {Integer} cbResult 
     * @param {Integer} InfoLevel 
     * @returns {Integer} 
     */
    static JetGetIndexInfoW(sesid, dbid, szTableName, szIndexName, pvResult, cbResult, InfoLevel) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetGetIndexInfoW", "ptr", sesid, "uint", dbid, "ushort*", szTableName, "ushort*", szIndexName, "ptr", pvResult, "uint", cbResult, "uint", InfoLevel, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer<SByte>} szIndexName 
     * @param {Integer} grbit 
     * @param {Pointer} szKey 
     * @param {Integer} cbKey 
     * @param {Integer} lDensity 
     * @returns {Integer} 
     */
    static JetCreateIndexA(sesid, tableid, szIndexName, grbit, szKey, cbKey, lDensity) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetCreateIndexA", "ptr", sesid, "ptr", tableid, "char*", szIndexName, "uint", grbit, "ptr", szKey, "uint", cbKey, "uint", lDensity, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer<UInt16>} szIndexName 
     * @param {Integer} grbit 
     * @param {Pointer} szKey 
     * @param {Integer} cbKey 
     * @param {Integer} lDensity 
     * @returns {Integer} 
     */
    static JetCreateIndexW(sesid, tableid, szIndexName, grbit, szKey, cbKey, lDensity) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetCreateIndexW", "ptr", sesid, "ptr", tableid, "ushort*", szIndexName, "uint", grbit, "ptr", szKey, "uint", cbKey, "uint", lDensity, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer<JET_INDEXCREATE_A>} pindexcreate 
     * @param {Integer} cIndexCreate 
     * @returns {Integer} 
     */
    static JetCreateIndex2A(sesid, tableid, pindexcreate, cIndexCreate) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetCreateIndex2A", "ptr", sesid, "ptr", tableid, "ptr", pindexcreate, "uint", cIndexCreate, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer<JET_INDEXCREATE_W>} pindexcreate 
     * @param {Integer} cIndexCreate 
     * @returns {Integer} 
     */
    static JetCreateIndex2W(sesid, tableid, pindexcreate, cIndexCreate) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetCreateIndex2W", "ptr", sesid, "ptr", tableid, "ptr", pindexcreate, "uint", cIndexCreate, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer<JET_INDEXCREATE2_A>} pindexcreate 
     * @param {Integer} cIndexCreate 
     * @returns {Integer} 
     */
    static JetCreateIndex3A(sesid, tableid, pindexcreate, cIndexCreate) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetCreateIndex3A", "ptr", sesid, "ptr", tableid, "ptr", pindexcreate, "uint", cIndexCreate, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer<JET_INDEXCREATE2_W>} pindexcreate 
     * @param {Integer} cIndexCreate 
     * @returns {Integer} 
     */
    static JetCreateIndex3W(sesid, tableid, pindexcreate, cIndexCreate) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetCreateIndex3W", "ptr", sesid, "ptr", tableid, "ptr", pindexcreate, "uint", cIndexCreate, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer<JET_INDEXCREATE3_A>} pindexcreate 
     * @param {Integer} cIndexCreate 
     * @returns {Integer} 
     */
    static JetCreateIndex4A(sesid, tableid, pindexcreate, cIndexCreate) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetCreateIndex4A", "ptr", sesid, "ptr", tableid, "ptr", pindexcreate, "uint", cIndexCreate, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer<JET_INDEXCREATE3_W>} pindexcreate 
     * @param {Integer} cIndexCreate 
     * @returns {Integer} 
     */
    static JetCreateIndex4W(sesid, tableid, pindexcreate, cIndexCreate) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetCreateIndex4W", "ptr", sesid, "ptr", tableid, "ptr", pindexcreate, "uint", cIndexCreate, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer<SByte>} szIndexName 
     * @returns {Integer} 
     */
    static JetDeleteIndexA(sesid, tableid, szIndexName) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetDeleteIndexA", "ptr", sesid, "ptr", tableid, "char*", szIndexName, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer<UInt16>} szIndexName 
     * @returns {Integer} 
     */
    static JetDeleteIndexW(sesid, tableid, szIndexName) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetDeleteIndexW", "ptr", sesid, "ptr", tableid, "ushort*", szIndexName, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @returns {Integer} 
     */
    static JetBeginTransaction(sesid) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetBeginTransaction", "ptr", sesid, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetBeginTransaction2(sesid, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetBeginTransaction2", "ptr", sesid, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Integer} trxid 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetBeginTransaction3(sesid, trxid, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetBeginTransaction3", "ptr", sesid, "int64", trxid, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetCommitTransaction(sesid, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetCommitTransaction", "ptr", sesid, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Integer} grbit 
     * @param {Integer} cmsecDurableCommit 
     * @param {Pointer<JET_COMMIT_ID>} pCommitId 
     * @returns {Integer} 
     */
    static JetCommitTransaction2(sesid, grbit, cmsecDurableCommit, pCommitId) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetCommitTransaction2", "ptr", sesid, "uint", grbit, "uint", cmsecDurableCommit, "ptr", pCommitId, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetRollback(sesid, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetRollback", "ptr", sesid, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Integer} dbid 
     * @param {Pointer} pvResult 
     * @param {Integer} cbMax 
     * @param {Integer} InfoLevel 
     * @returns {Integer} 
     */
    static JetGetDatabaseInfoA(sesid, dbid, pvResult, cbMax, InfoLevel) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetGetDatabaseInfoA", "ptr", sesid, "uint", dbid, "ptr", pvResult, "uint", cbMax, "uint", InfoLevel, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Integer} dbid 
     * @param {Pointer} pvResult 
     * @param {Integer} cbMax 
     * @param {Integer} InfoLevel 
     * @returns {Integer} 
     */
    static JetGetDatabaseInfoW(sesid, dbid, pvResult, cbMax, InfoLevel) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetGetDatabaseInfoW", "ptr", sesid, "uint", dbid, "ptr", pvResult, "uint", cbMax, "uint", InfoLevel, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<SByte>} szDatabaseName 
     * @param {Pointer} pvResult 
     * @param {Integer} cbMax 
     * @param {Integer} InfoLevel 
     * @returns {Integer} 
     */
    static JetGetDatabaseFileInfoA(szDatabaseName, pvResult, cbMax, InfoLevel) {
        result := DllCall("ESENT.dll\JetGetDatabaseFileInfoA", "char*", szDatabaseName, "ptr", pvResult, "uint", cbMax, "uint", InfoLevel, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} szDatabaseName 
     * @param {Pointer} pvResult 
     * @param {Integer} cbMax 
     * @param {Integer} InfoLevel 
     * @returns {Integer} 
     */
    static JetGetDatabaseFileInfoW(szDatabaseName, pvResult, cbMax, InfoLevel) {
        result := DllCall("ESENT.dll\JetGetDatabaseFileInfoW", "ushort*", szDatabaseName, "ptr", pvResult, "uint", cbMax, "uint", InfoLevel, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Pointer<SByte>} szFilename 
     * @param {Pointer<SByte>} szConnect 
     * @param {Pointer<UInt32>} pdbid 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetOpenDatabaseA(sesid, szFilename, szConnect, pdbid, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetOpenDatabaseA", "ptr", sesid, "char*", szFilename, "char*", szConnect, "uint*", pdbid, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Pointer<UInt16>} szFilename 
     * @param {Pointer<UInt16>} szConnect 
     * @param {Pointer<UInt32>} pdbid 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetOpenDatabaseW(sesid, szFilename, szConnect, pdbid, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetOpenDatabaseW", "ptr", sesid, "ushort*", szFilename, "ushort*", szConnect, "uint*", pdbid, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Integer} dbid 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetCloseDatabase(sesid, dbid, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetCloseDatabase", "ptr", sesid, "uint", dbid, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<SByte>} szTableName 
     * @param {Pointer} pvParameters 
     * @param {Integer} cbParameters 
     * @param {Integer} grbit 
     * @param {Pointer<JET_TABLEID>} ptableid 
     * @returns {Integer} 
     */
    static JetOpenTableA(sesid, dbid, szTableName, pvParameters, cbParameters, grbit, ptableid) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetOpenTableA", "ptr", sesid, "uint", dbid, "char*", szTableName, "ptr", pvParameters, "uint", cbParameters, "uint", grbit, "ptr", ptableid, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<UInt16>} szTableName 
     * @param {Pointer} pvParameters 
     * @param {Integer} cbParameters 
     * @param {Integer} grbit 
     * @param {Pointer<JET_TABLEID>} ptableid 
     * @returns {Integer} 
     */
    static JetOpenTableW(sesid, dbid, szTableName, pvParameters, cbParameters, grbit, ptableid) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetOpenTableW", "ptr", sesid, "uint", dbid, "ushort*", szTableName, "ptr", pvParameters, "uint", cbParameters, "uint", grbit, "ptr", ptableid, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetSetTableSequential(sesid, tableid, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetSetTableSequential", "ptr", sesid, "ptr", tableid, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetResetTableSequential(sesid, tableid, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetResetTableSequential", "ptr", sesid, "ptr", tableid, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @returns {Integer} 
     */
    static JetCloseTable(sesid, tableid) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetCloseTable", "ptr", sesid, "ptr", tableid, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @returns {Integer} 
     */
    static JetDelete(sesid, tableid) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetDelete", "ptr", sesid, "ptr", tableid, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer} pvBookmark 
     * @param {Integer} cbBookmark 
     * @param {Pointer<UInt32>} pcbActual 
     * @returns {Integer} 
     */
    static JetUpdate(sesid, tableid, pvBookmark, cbBookmark, pcbActual) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetUpdate", "ptr", sesid, "ptr", tableid, "ptr", pvBookmark, "uint", cbBookmark, "uint*", pcbActual, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer} pvBookmark 
     * @param {Integer} cbBookmark 
     * @param {Pointer<UInt32>} pcbActual 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetUpdate2(sesid, tableid, pvBookmark, cbBookmark, pcbActual, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetUpdate2", "ptr", sesid, "ptr", tableid, "ptr", pvBookmark, "uint", cbBookmark, "uint*", pcbActual, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Integer} columnid 
     * @param {Pointer} pv 
     * @param {Integer} cbMax 
     * @param {Pointer} pvOld 
     * @param {Integer} cbOldMax 
     * @param {Pointer<UInt32>} pcbOldActual 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetEscrowUpdate(sesid, tableid, columnid, pv, cbMax, pvOld, cbOldMax, pcbOldActual, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetEscrowUpdate", "ptr", sesid, "ptr", tableid, "uint", columnid, "ptr", pv, "uint", cbMax, "ptr", pvOld, "uint", cbOldMax, "uint*", pcbOldActual, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Integer} columnid 
     * @param {Pointer} pvData 
     * @param {Integer} cbData 
     * @param {Pointer<UInt32>} pcbActual 
     * @param {Integer} grbit 
     * @param {Pointer<JET_RETINFO>} pretinfo 
     * @returns {Integer} 
     */
    static JetRetrieveColumn(sesid, tableid, columnid, pvData, cbData, pcbActual, grbit, pretinfo) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetRetrieveColumn", "ptr", sesid, "ptr", tableid, "uint", columnid, "ptr", pvData, "uint", cbData, "uint*", pcbActual, "uint", grbit, "ptr", pretinfo, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer<JET_RETRIEVECOLUMN>} pretrievecolumn 
     * @param {Integer} cretrievecolumn 
     * @returns {Integer} 
     */
    static JetRetrieveColumns(sesid, tableid, pretrievecolumn, cretrievecolumn) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetRetrieveColumns", "ptr", sesid, "ptr", tableid, "ptr", pretrievecolumn, "uint", cretrievecolumn, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Integer} cEnumColumnId 
     * @param {Pointer<JET_ENUMCOLUMNID>} rgEnumColumnId 
     * @param {Pointer<UInt32>} pcEnumColumn 
     * @param {Pointer<JET_ENUMCOLUMN>} prgEnumColumn 
     * @param {Pointer<JET_PFNREALLOC>} pfnRealloc 
     * @param {Pointer<Void>} pvReallocContext 
     * @param {Integer} cbDataMost 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetEnumerateColumns(sesid, tableid, cEnumColumnId, rgEnumColumnId, pcEnumColumn, prgEnumColumn, pfnRealloc, pvReallocContext, cbDataMost, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetEnumerateColumns", "ptr", sesid, "ptr", tableid, "uint", cEnumColumnId, "ptr", rgEnumColumnId, "uint*", pcEnumColumn, "ptr", prgEnumColumn, "ptr", pfnRealloc, "ptr", pvReallocContext, "uint", cbDataMost, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer<JET_RECSIZE>} precsize 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetGetRecordSize(sesid, tableid, precsize, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetGetRecordSize", "ptr", sesid, "ptr", tableid, "ptr", precsize, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer<JET_RECSIZE2>} precsize 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetGetRecordSize2(sesid, tableid, precsize, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetGetRecordSize2", "ptr", sesid, "ptr", tableid, "ptr", precsize, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Integer} columnid 
     * @param {Pointer} pvData 
     * @param {Integer} cbData 
     * @param {Integer} grbit 
     * @param {Pointer<JET_SETINFO>} psetinfo 
     * @returns {Integer} 
     */
    static JetSetColumn(sesid, tableid, columnid, pvData, cbData, grbit, psetinfo) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetSetColumn", "ptr", sesid, "ptr", tableid, "uint", columnid, "ptr", pvData, "uint", cbData, "uint", grbit, "ptr", psetinfo, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer<JET_SETCOLUMN>} psetcolumn 
     * @param {Integer} csetcolumn 
     * @returns {Integer} 
     */
    static JetSetColumns(sesid, tableid, psetcolumn, csetcolumn) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetSetColumns", "ptr", sesid, "ptr", tableid, "ptr", psetcolumn, "uint", csetcolumn, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Integer} prep 
     * @returns {Integer} 
     */
    static JetPrepareUpdate(sesid, tableid, prep) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetPrepareUpdate", "ptr", sesid, "ptr", tableid, "uint", prep, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer} precpos 
     * @param {Integer} cbRecpos 
     * @returns {Integer} 
     */
    static JetGetRecordPosition(sesid, tableid, precpos, cbRecpos) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetGetRecordPosition", "ptr", sesid, "ptr", tableid, "ptr", precpos, "uint", cbRecpos, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer<JET_RECPOS>} precpos 
     * @returns {Integer} 
     */
    static JetGotoPosition(sesid, tableid, precpos) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetGotoPosition", "ptr", sesid, "ptr", tableid, "ptr", precpos, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer} pvResult 
     * @param {Integer} cbMax 
     * @param {Integer} InfoLevel 
     * @returns {Integer} 
     */
    static JetGetCursorInfo(sesid, tableid, pvResult, cbMax, InfoLevel) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetGetCursorInfo", "ptr", sesid, "ptr", tableid, "ptr", pvResult, "uint", cbMax, "uint", InfoLevel, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer<JET_TABLEID>} ptableid 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetDupCursor(sesid, tableid, ptableid, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetDupCursor", "ptr", sesid, "ptr", tableid, "ptr", ptableid, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer} szIndexName 
     * @param {Integer} cbIndexName 
     * @returns {Integer} 
     */
    static JetGetCurrentIndexA(sesid, tableid, szIndexName, cbIndexName) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetGetCurrentIndexA", "ptr", sesid, "ptr", tableid, "ptr", szIndexName, "uint", cbIndexName, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer} szIndexName 
     * @param {Integer} cbIndexName 
     * @returns {Integer} 
     */
    static JetGetCurrentIndexW(sesid, tableid, szIndexName, cbIndexName) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetGetCurrentIndexW", "ptr", sesid, "ptr", tableid, "ptr", szIndexName, "uint", cbIndexName, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer<SByte>} szIndexName 
     * @returns {Integer} 
     */
    static JetSetCurrentIndexA(sesid, tableid, szIndexName) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetSetCurrentIndexA", "ptr", sesid, "ptr", tableid, "char*", szIndexName, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer<UInt16>} szIndexName 
     * @returns {Integer} 
     */
    static JetSetCurrentIndexW(sesid, tableid, szIndexName) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetSetCurrentIndexW", "ptr", sesid, "ptr", tableid, "ushort*", szIndexName, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer<SByte>} szIndexName 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetSetCurrentIndex2A(sesid, tableid, szIndexName, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetSetCurrentIndex2A", "ptr", sesid, "ptr", tableid, "char*", szIndexName, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer<UInt16>} szIndexName 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetSetCurrentIndex2W(sesid, tableid, szIndexName, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetSetCurrentIndex2W", "ptr", sesid, "ptr", tableid, "ushort*", szIndexName, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer<SByte>} szIndexName 
     * @param {Integer} grbit 
     * @param {Integer} itagSequence 
     * @returns {Integer} 
     */
    static JetSetCurrentIndex3A(sesid, tableid, szIndexName, grbit, itagSequence) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetSetCurrentIndex3A", "ptr", sesid, "ptr", tableid, "char*", szIndexName, "uint", grbit, "uint", itagSequence, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer<UInt16>} szIndexName 
     * @param {Integer} grbit 
     * @param {Integer} itagSequence 
     * @returns {Integer} 
     */
    static JetSetCurrentIndex3W(sesid, tableid, szIndexName, grbit, itagSequence) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetSetCurrentIndex3W", "ptr", sesid, "ptr", tableid, "ushort*", szIndexName, "uint", grbit, "uint", itagSequence, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer<SByte>} szIndexName 
     * @param {Pointer<JET_INDEXID>} pindexid 
     * @param {Integer} grbit 
     * @param {Integer} itagSequence 
     * @returns {Integer} 
     */
    static JetSetCurrentIndex4A(sesid, tableid, szIndexName, pindexid, grbit, itagSequence) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetSetCurrentIndex4A", "ptr", sesid, "ptr", tableid, "char*", szIndexName, "ptr", pindexid, "uint", grbit, "uint", itagSequence, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer<UInt16>} szIndexName 
     * @param {Pointer<JET_INDEXID>} pindexid 
     * @param {Integer} grbit 
     * @param {Integer} itagSequence 
     * @returns {Integer} 
     */
    static JetSetCurrentIndex4W(sesid, tableid, szIndexName, pindexid, grbit, itagSequence) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetSetCurrentIndex4W", "ptr", sesid, "ptr", tableid, "ushort*", szIndexName, "ptr", pindexid, "uint", grbit, "uint", itagSequence, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Integer} cRow 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetMove(sesid, tableid, cRow, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetMove", "ptr", sesid, "ptr", tableid, "int", cRow, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer<JET_INDEX_COLUMN>} rgColumnFilters 
     * @param {Integer} cColumnFilters 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetSetCursorFilter(sesid, tableid, rgColumnFilters, cColumnFilters, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetSetCursorFilter", "ptr", sesid, "ptr", tableid, "ptr", rgColumnFilters, "uint", cColumnFilters, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetGetLock(sesid, tableid, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetGetLock", "ptr", sesid, "ptr", tableid, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer} pvData 
     * @param {Integer} cbData 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetMakeKey(sesid, tableid, pvData, cbData, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetMakeKey", "ptr", sesid, "ptr", tableid, "ptr", pvData, "uint", cbData, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetSeek(sesid, tableid, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetSeek", "ptr", sesid, "ptr", tableid, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer<Void>} rgpvKeys 
     * @param {Pointer<UInt32>} rgcbKeys 
     * @param {Integer} ckeys 
     * @param {Pointer<Int32>} pckeysPreread 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetPrereadKeys(sesid, tableid, rgpvKeys, rgcbKeys, ckeys, pckeysPreread, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetPrereadKeys", "ptr", sesid, "ptr", tableid, "ptr", rgpvKeys, "uint*", rgcbKeys, "int", ckeys, "int*", pckeysPreread, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer<JET_INDEX_RANGE>} rgIndexRanges 
     * @param {Integer} cIndexRanges 
     * @param {Pointer<UInt32>} pcRangesPreread 
     * @param {Pointer<UInt32>} rgcolumnidPreread 
     * @param {Integer} ccolumnidPreread 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetPrereadIndexRanges(sesid, tableid, rgIndexRanges, cIndexRanges, pcRangesPreread, rgcolumnidPreread, ccolumnidPreread, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetPrereadIndexRanges", "ptr", sesid, "ptr", tableid, "ptr", rgIndexRanges, "uint", cIndexRanges, "uint*", pcRangesPreread, "uint*", rgcolumnidPreread, "uint", ccolumnidPreread, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer} pvBookmark 
     * @param {Integer} cbMax 
     * @param {Pointer<UInt32>} pcbActual 
     * @returns {Integer} 
     */
    static JetGetBookmark(sesid, tableid, pvBookmark, cbMax, pcbActual) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetGetBookmark", "ptr", sesid, "ptr", tableid, "ptr", pvBookmark, "uint", cbMax, "uint*", pcbActual, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer} pvSecondaryKey 
     * @param {Integer} cbSecondaryKeyMax 
     * @param {Pointer<UInt32>} pcbSecondaryKeyActual 
     * @param {Pointer} pvPrimaryBookmark 
     * @param {Integer} cbPrimaryBookmarkMax 
     * @param {Pointer<UInt32>} pcbPrimaryBookmarkActual 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetGetSecondaryIndexBookmark(sesid, tableid, pvSecondaryKey, cbSecondaryKeyMax, pcbSecondaryKeyActual, pvPrimaryBookmark, cbPrimaryBookmarkMax, pcbPrimaryBookmarkActual, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetGetSecondaryIndexBookmark", "ptr", sesid, "ptr", tableid, "ptr", pvSecondaryKey, "uint", cbSecondaryKeyMax, "uint*", pcbSecondaryKeyActual, "ptr", pvPrimaryBookmark, "uint", cbPrimaryBookmarkMax, "uint*", pcbPrimaryBookmarkActual, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Pointer<SByte>} szDatabaseSrc 
     * @param {Pointer<SByte>} szDatabaseDest 
     * @param {Pointer<JET_PFNSTATUS>} pfnStatus 
     * @param {Pointer<JET_CONVERT_A>} pconvert 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetCompactA(sesid, szDatabaseSrc, szDatabaseDest, pfnStatus, pconvert, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetCompactA", "ptr", sesid, "char*", szDatabaseSrc, "char*", szDatabaseDest, "ptr", pfnStatus, "ptr", pconvert, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Pointer<UInt16>} szDatabaseSrc 
     * @param {Pointer<UInt16>} szDatabaseDest 
     * @param {Pointer<JET_PFNSTATUS>} pfnStatus 
     * @param {Pointer<JET_CONVERT_W>} pconvert 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetCompactW(sesid, szDatabaseSrc, szDatabaseDest, pfnStatus, pconvert, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetCompactW", "ptr", sesid, "ushort*", szDatabaseSrc, "ushort*", szDatabaseDest, "ptr", pfnStatus, "ptr", pconvert, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<SByte>} szTableName 
     * @param {Pointer<UInt32>} pcPasses 
     * @param {Pointer<UInt32>} pcSeconds 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetDefragmentA(sesid, dbid, szTableName, pcPasses, pcSeconds, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetDefragmentA", "ptr", sesid, "uint", dbid, "char*", szTableName, "uint*", pcPasses, "uint*", pcSeconds, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<UInt16>} szTableName 
     * @param {Pointer<UInt32>} pcPasses 
     * @param {Pointer<UInt32>} pcSeconds 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetDefragmentW(sesid, dbid, szTableName, pcPasses, pcSeconds, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetDefragmentW", "ptr", sesid, "uint", dbid, "ushort*", szTableName, "uint*", pcPasses, "uint*", pcSeconds, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<SByte>} szTableName 
     * @param {Pointer<UInt32>} pcPasses 
     * @param {Pointer<UInt32>} pcSeconds 
     * @param {Pointer<JET_CALLBACK>} callback 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetDefragment2A(sesid, dbid, szTableName, pcPasses, pcSeconds, callback, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetDefragment2A", "ptr", sesid, "uint", dbid, "char*", szTableName, "uint*", pcPasses, "uint*", pcSeconds, "ptr", callback, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Integer} dbid 
     * @param {Pointer<UInt16>} szTableName 
     * @param {Pointer<UInt32>} pcPasses 
     * @param {Pointer<UInt32>} pcSeconds 
     * @param {Pointer<JET_CALLBACK>} callback 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetDefragment2W(sesid, dbid, szTableName, pcPasses, pcSeconds, callback, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetDefragment2W", "ptr", sesid, "uint", dbid, "ushort*", szTableName, "uint*", pcPasses, "uint*", pcSeconds, "ptr", callback, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
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
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetDefragment3A", "ptr", sesid, "char*", szDatabaseName, "char*", szTableName, "uint*", pcPasses, "uint*", pcSeconds, "ptr", callback, "ptr", pvContext, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
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
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetDefragment3W", "ptr", sesid, "ushort*", szDatabaseName, "ushort*", szTableName, "uint*", pcPasses, "uint*", pcSeconds, "ptr", callback, "ptr", pvContext, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Pointer<SByte>} szDatabaseName 
     * @param {Integer} cpg 
     * @param {Pointer<UInt32>} pcpgReal 
     * @returns {Integer} 
     */
    static JetSetDatabaseSizeA(sesid, szDatabaseName, cpg, pcpgReal) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetSetDatabaseSizeA", "ptr", sesid, "char*", szDatabaseName, "uint", cpg, "uint*", pcpgReal, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Pointer<UInt16>} szDatabaseName 
     * @param {Integer} cpg 
     * @param {Pointer<UInt32>} pcpgReal 
     * @returns {Integer} 
     */
    static JetSetDatabaseSizeW(sesid, szDatabaseName, cpg, pcpgReal) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetSetDatabaseSizeW", "ptr", sesid, "ushort*", szDatabaseName, "uint", cpg, "uint*", pcpgReal, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Integer} dbid 
     * @param {Integer} cpg 
     * @param {Pointer<UInt32>} pcpgReal 
     * @returns {Integer} 
     */
    static JetGrowDatabase(sesid, dbid, cpg, pcpgReal) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetGrowDatabase", "ptr", sesid, "uint", dbid, "uint", cpg, "uint*", pcpgReal, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Integer} dbid 
     * @param {Integer} cpgTarget 
     * @param {Pointer<UInt32>} pcpgActual 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetResizeDatabase(sesid, dbid, cpgTarget, pcpgActual, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetResizeDatabase", "ptr", sesid, "uint", dbid, "uint", cpgTarget, "uint*", pcpgActual, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_API_PTR} ulContext 
     * @returns {Integer} 
     */
    static JetSetSessionContext(sesid, ulContext) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        ulContext := ulContext is Win32Handle ? NumGet(ulContext, "ptr") : ulContext

        result := DllCall("ESENT.dll\JetSetSessionContext", "ptr", sesid, "ptr", ulContext, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @returns {Integer} 
     */
    static JetResetSessionContext(sesid) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetResetSessionContext", "ptr", sesid, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer} pvBookmark 
     * @param {Integer} cbBookmark 
     * @returns {Integer} 
     */
    static JetGotoBookmark(sesid, tableid, pvBookmark, cbBookmark) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetGotoBookmark", "ptr", sesid, "ptr", tableid, "ptr", pvBookmark, "uint", cbBookmark, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer} pvSecondaryKey 
     * @param {Integer} cbSecondaryKey 
     * @param {Pointer} pvPrimaryBookmark 
     * @param {Integer} cbPrimaryBookmark 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetGotoSecondaryIndexBookmark(sesid, tableid, pvSecondaryKey, cbSecondaryKey, pvPrimaryBookmark, cbPrimaryBookmark, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetGotoSecondaryIndexBookmark", "ptr", sesid, "ptr", tableid, "ptr", pvSecondaryKey, "uint", cbSecondaryKey, "ptr", pvPrimaryBookmark, "uint", cbPrimaryBookmark, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Pointer<JET_INDEXRANGE>} rgindexrange 
     * @param {Integer} cindexrange 
     * @param {Pointer<JET_RECORDLIST>} precordlist 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetIntersectIndexes(sesid, rgindexrange, cindexrange, precordlist, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetIntersectIndexes", "ptr", sesid, "ptr", rgindexrange, "uint", cindexrange, "ptr", precordlist, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @returns {Integer} 
     */
    static JetComputeStats(sesid, tableid) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetComputeStats", "ptr", sesid, "ptr", tableid, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Pointer<JET_COLUMNDEF>} prgcolumndef 
     * @param {Integer} ccolumn 
     * @param {Integer} grbit 
     * @param {Pointer<JET_TABLEID>} ptableid 
     * @param {Pointer<UInt32>} prgcolumnid 
     * @returns {Integer} 
     */
    static JetOpenTempTable(sesid, prgcolumndef, ccolumn, grbit, ptableid, prgcolumnid) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetOpenTempTable", "ptr", sesid, "ptr", prgcolumndef, "uint", ccolumn, "uint", grbit, "ptr", ptableid, "uint*", prgcolumnid, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Pointer<JET_COLUMNDEF>} prgcolumndef 
     * @param {Integer} ccolumn 
     * @param {Integer} lcid 
     * @param {Integer} grbit 
     * @param {Pointer<JET_TABLEID>} ptableid 
     * @param {Pointer<UInt32>} prgcolumnid 
     * @returns {Integer} 
     */
    static JetOpenTempTable2(sesid, prgcolumndef, ccolumn, lcid, grbit, ptableid, prgcolumnid) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetOpenTempTable2", "ptr", sesid, "ptr", prgcolumndef, "uint", ccolumn, "uint", lcid, "uint", grbit, "ptr", ptableid, "uint*", prgcolumnid, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Pointer<JET_COLUMNDEF>} prgcolumndef 
     * @param {Integer} ccolumn 
     * @param {Pointer<JET_UNICODEINDEX>} pidxunicode 
     * @param {Integer} grbit 
     * @param {Pointer<JET_TABLEID>} ptableid 
     * @param {Pointer<UInt32>} prgcolumnid 
     * @returns {Integer} 
     */
    static JetOpenTempTable3(sesid, prgcolumndef, ccolumn, pidxunicode, grbit, ptableid, prgcolumnid) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetOpenTempTable3", "ptr", sesid, "ptr", prgcolumndef, "uint", ccolumn, "ptr", pidxunicode, "uint", grbit, "ptr", ptableid, "uint*", prgcolumnid, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Pointer<JET_OPENTEMPORARYTABLE>} popentemporarytable 
     * @returns {Integer} 
     */
    static JetOpenTemporaryTable(sesid, popentemporarytable) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetOpenTemporaryTable", "ptr", sesid, "ptr", popentemporarytable, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Pointer<JET_OPENTEMPORARYTABLE2>} popentemporarytable 
     * @returns {Integer} 
     */
    static JetOpenTemporaryTable2(sesid, popentemporarytable) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetOpenTemporaryTable2", "ptr", sesid, "ptr", popentemporarytable, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<SByte>} szBackupPath 
     * @param {Integer} grbit 
     * @param {Pointer<JET_PFNSTATUS>} pfnStatus 
     * @returns {Integer} 
     */
    static JetBackupA(szBackupPath, grbit, pfnStatus) {
        result := DllCall("ESENT.dll\JetBackupA", "char*", szBackupPath, "uint", grbit, "ptr", pfnStatus, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} szBackupPath 
     * @param {Integer} grbit 
     * @param {Pointer<JET_PFNSTATUS>} pfnStatus 
     * @returns {Integer} 
     */
    static JetBackupW(szBackupPath, grbit, pfnStatus) {
        result := DllCall("ESENT.dll\JetBackupW", "ushort*", szBackupPath, "uint", grbit, "ptr", pfnStatus, "int")
        return result
    }

    /**
     * 
     * @param {JET_INSTANCE} instance 
     * @param {Pointer<SByte>} szBackupPath 
     * @param {Integer} grbit 
     * @param {Pointer<JET_PFNSTATUS>} pfnStatus 
     * @returns {Integer} 
     */
    static JetBackupInstanceA(instance, szBackupPath, grbit, pfnStatus) {
        instance := instance is Win32Handle ? NumGet(instance, "ptr") : instance

        result := DllCall("ESENT.dll\JetBackupInstanceA", "ptr", instance, "char*", szBackupPath, "uint", grbit, "ptr", pfnStatus, "int")
        return result
    }

    /**
     * 
     * @param {JET_INSTANCE} instance 
     * @param {Pointer<UInt16>} szBackupPath 
     * @param {Integer} grbit 
     * @param {Pointer<JET_PFNSTATUS>} pfnStatus 
     * @returns {Integer} 
     */
    static JetBackupInstanceW(instance, szBackupPath, grbit, pfnStatus) {
        instance := instance is Win32Handle ? NumGet(instance, "ptr") : instance

        result := DllCall("ESENT.dll\JetBackupInstanceW", "ptr", instance, "ushort*", szBackupPath, "uint", grbit, "ptr", pfnStatus, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<SByte>} szSource 
     * @param {Pointer<JET_PFNSTATUS>} pfn 
     * @returns {Integer} 
     */
    static JetRestoreA(szSource, pfn) {
        result := DllCall("ESENT.dll\JetRestoreA", "char*", szSource, "ptr", pfn, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} szSource 
     * @param {Pointer<JET_PFNSTATUS>} pfn 
     * @returns {Integer} 
     */
    static JetRestoreW(szSource, pfn) {
        result := DllCall("ESENT.dll\JetRestoreW", "ushort*", szSource, "ptr", pfn, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<SByte>} sz 
     * @param {Pointer<SByte>} szDest 
     * @param {Pointer<JET_PFNSTATUS>} pfn 
     * @returns {Integer} 
     */
    static JetRestore2A(sz, szDest, pfn) {
        result := DllCall("ESENT.dll\JetRestore2A", "char*", sz, "char*", szDest, "ptr", pfn, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} sz 
     * @param {Pointer<UInt16>} szDest 
     * @param {Pointer<JET_PFNSTATUS>} pfn 
     * @returns {Integer} 
     */
    static JetRestore2W(sz, szDest, pfn) {
        result := DllCall("ESENT.dll\JetRestore2W", "ushort*", sz, "ushort*", szDest, "ptr", pfn, "int")
        return result
    }

    /**
     * 
     * @param {JET_INSTANCE} instance 
     * @param {Pointer<SByte>} sz 
     * @param {Pointer<SByte>} szDest 
     * @param {Pointer<JET_PFNSTATUS>} pfn 
     * @returns {Integer} 
     */
    static JetRestoreInstanceA(instance, sz, szDest, pfn) {
        instance := instance is Win32Handle ? NumGet(instance, "ptr") : instance

        result := DllCall("ESENT.dll\JetRestoreInstanceA", "ptr", instance, "char*", sz, "char*", szDest, "ptr", pfn, "int")
        return result
    }

    /**
     * 
     * @param {JET_INSTANCE} instance 
     * @param {Pointer<UInt16>} sz 
     * @param {Pointer<UInt16>} szDest 
     * @param {Pointer<JET_PFNSTATUS>} pfn 
     * @returns {Integer} 
     */
    static JetRestoreInstanceW(instance, sz, szDest, pfn) {
        instance := instance is Win32Handle ? NumGet(instance, "ptr") : instance

        result := DllCall("ESENT.dll\JetRestoreInstanceW", "ptr", instance, "ushort*", sz, "ushort*", szDest, "ptr", pfn, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableidSrc 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetSetIndexRange(sesid, tableidSrc, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableidSrc := tableidSrc is Win32Handle ? NumGet(tableidSrc, "ptr") : tableidSrc

        result := DllCall("ESENT.dll\JetSetIndexRange", "ptr", sesid, "ptr", tableidSrc, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer<UInt32>} pcrec 
     * @param {Integer} crecMax 
     * @returns {Integer} 
     */
    static JetIndexRecordCount(sesid, tableid, pcrec, crecMax) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetIndexRecordCount", "ptr", sesid, "ptr", tableid, "uint*", pcrec, "uint", crecMax, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer} pvKey 
     * @param {Integer} cbMax 
     * @param {Pointer<UInt32>} pcbActual 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetRetrieveKey(sesid, tableid, pvKey, cbMax, pcbActual, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetRetrieveKey", "ptr", sesid, "ptr", tableid, "ptr", pvKey, "uint", cbMax, "uint*", pcbActual, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetBeginExternalBackup(grbit) {
        result := DllCall("ESENT.dll\JetBeginExternalBackup", "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_INSTANCE} instance 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetBeginExternalBackupInstance(instance, grbit) {
        instance := instance is Win32Handle ? NumGet(instance, "ptr") : instance

        result := DllCall("ESENT.dll\JetBeginExternalBackupInstance", "ptr", instance, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} szzDatabases 
     * @param {Integer} cbMax 
     * @param {Pointer<UInt32>} pcbActual 
     * @returns {Integer} 
     */
    static JetGetAttachInfoA(szzDatabases, cbMax, pcbActual) {
        result := DllCall("ESENT.dll\JetGetAttachInfoA", "ptr", szzDatabases, "uint", cbMax, "uint*", pcbActual, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} wszzDatabases 
     * @param {Integer} cbMax 
     * @param {Pointer<UInt32>} pcbActual 
     * @returns {Integer} 
     */
    static JetGetAttachInfoW(wszzDatabases, cbMax, pcbActual) {
        result := DllCall("ESENT.dll\JetGetAttachInfoW", "ptr", wszzDatabases, "uint", cbMax, "uint*", pcbActual, "int")
        return result
    }

    /**
     * 
     * @param {JET_INSTANCE} instance 
     * @param {Pointer} szzDatabases 
     * @param {Integer} cbMax 
     * @param {Pointer<UInt32>} pcbActual 
     * @returns {Integer} 
     */
    static JetGetAttachInfoInstanceA(instance, szzDatabases, cbMax, pcbActual) {
        instance := instance is Win32Handle ? NumGet(instance, "ptr") : instance

        result := DllCall("ESENT.dll\JetGetAttachInfoInstanceA", "ptr", instance, "ptr", szzDatabases, "uint", cbMax, "uint*", pcbActual, "int")
        return result
    }

    /**
     * 
     * @param {JET_INSTANCE} instance 
     * @param {Pointer} szzDatabases 
     * @param {Integer} cbMax 
     * @param {Pointer<UInt32>} pcbActual 
     * @returns {Integer} 
     */
    static JetGetAttachInfoInstanceW(instance, szzDatabases, cbMax, pcbActual) {
        instance := instance is Win32Handle ? NumGet(instance, "ptr") : instance

        result := DllCall("ESENT.dll\JetGetAttachInfoInstanceW", "ptr", instance, "ptr", szzDatabases, "uint", cbMax, "uint*", pcbActual, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<SByte>} szFileName 
     * @param {Pointer<JET_HANDLE>} phfFile 
     * @param {Pointer<UInt32>} pulFileSizeLow 
     * @param {Pointer<UInt32>} pulFileSizeHigh 
     * @returns {Integer} 
     */
    static JetOpenFileA(szFileName, phfFile, pulFileSizeLow, pulFileSizeHigh) {
        result := DllCall("ESENT.dll\JetOpenFileA", "char*", szFileName, "ptr", phfFile, "uint*", pulFileSizeLow, "uint*", pulFileSizeHigh, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} szFileName 
     * @param {Pointer<JET_HANDLE>} phfFile 
     * @param {Pointer<UInt32>} pulFileSizeLow 
     * @param {Pointer<UInt32>} pulFileSizeHigh 
     * @returns {Integer} 
     */
    static JetOpenFileW(szFileName, phfFile, pulFileSizeLow, pulFileSizeHigh) {
        result := DllCall("ESENT.dll\JetOpenFileW", "ushort*", szFileName, "ptr", phfFile, "uint*", pulFileSizeLow, "uint*", pulFileSizeHigh, "int")
        return result
    }

    /**
     * 
     * @param {JET_INSTANCE} instance 
     * @param {Pointer<SByte>} szFileName 
     * @param {Pointer<JET_HANDLE>} phfFile 
     * @param {Pointer<UInt32>} pulFileSizeLow 
     * @param {Pointer<UInt32>} pulFileSizeHigh 
     * @returns {Integer} 
     */
    static JetOpenFileInstanceA(instance, szFileName, phfFile, pulFileSizeLow, pulFileSizeHigh) {
        instance := instance is Win32Handle ? NumGet(instance, "ptr") : instance

        result := DllCall("ESENT.dll\JetOpenFileInstanceA", "ptr", instance, "char*", szFileName, "ptr", phfFile, "uint*", pulFileSizeLow, "uint*", pulFileSizeHigh, "int")
        return result
    }

    /**
     * 
     * @param {JET_INSTANCE} instance 
     * @param {Pointer<UInt16>} szFileName 
     * @param {Pointer<JET_HANDLE>} phfFile 
     * @param {Pointer<UInt32>} pulFileSizeLow 
     * @param {Pointer<UInt32>} pulFileSizeHigh 
     * @returns {Integer} 
     */
    static JetOpenFileInstanceW(instance, szFileName, phfFile, pulFileSizeLow, pulFileSizeHigh) {
        instance := instance is Win32Handle ? NumGet(instance, "ptr") : instance

        result := DllCall("ESENT.dll\JetOpenFileInstanceW", "ptr", instance, "ushort*", szFileName, "ptr", phfFile, "uint*", pulFileSizeLow, "uint*", pulFileSizeHigh, "int")
        return result
    }

    /**
     * 
     * @param {JET_HANDLE} hfFile 
     * @param {Pointer} pv 
     * @param {Integer} cb 
     * @param {Pointer<UInt32>} pcbActual 
     * @returns {Integer} 
     */
    static JetReadFile(hfFile, pv, cb, pcbActual) {
        hfFile := hfFile is Win32Handle ? NumGet(hfFile, "ptr") : hfFile

        result := DllCall("ESENT.dll\JetReadFile", "ptr", hfFile, "ptr", pv, "uint", cb, "uint*", pcbActual, "int")
        return result
    }

    /**
     * 
     * @param {JET_INSTANCE} instance 
     * @param {JET_HANDLE} hfFile 
     * @param {Pointer} pv 
     * @param {Integer} cb 
     * @param {Pointer<UInt32>} pcbActual 
     * @returns {Integer} 
     */
    static JetReadFileInstance(instance, hfFile, pv, cb, pcbActual) {
        instance := instance is Win32Handle ? NumGet(instance, "ptr") : instance
        hfFile := hfFile is Win32Handle ? NumGet(hfFile, "ptr") : hfFile

        result := DllCall("ESENT.dll\JetReadFileInstance", "ptr", instance, "ptr", hfFile, "ptr", pv, "uint", cb, "uint*", pcbActual, "int")
        return result
    }

    /**
     * 
     * @param {JET_HANDLE} hfFile 
     * @returns {Integer} 
     */
    static JetCloseFile(hfFile) {
        hfFile := hfFile is Win32Handle ? NumGet(hfFile, "ptr") : hfFile

        result := DllCall("ESENT.dll\JetCloseFile", "ptr", hfFile, "int")
        return result
    }

    /**
     * 
     * @param {JET_INSTANCE} instance 
     * @param {JET_HANDLE} hfFile 
     * @returns {Integer} 
     */
    static JetCloseFileInstance(instance, hfFile) {
        instance := instance is Win32Handle ? NumGet(instance, "ptr") : instance
        hfFile := hfFile is Win32Handle ? NumGet(hfFile, "ptr") : hfFile

        result := DllCall("ESENT.dll\JetCloseFileInstance", "ptr", instance, "ptr", hfFile, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} szzLogs 
     * @param {Integer} cbMax 
     * @param {Pointer<UInt32>} pcbActual 
     * @returns {Integer} 
     */
    static JetGetLogInfoA(szzLogs, cbMax, pcbActual) {
        result := DllCall("ESENT.dll\JetGetLogInfoA", "ptr", szzLogs, "uint", cbMax, "uint*", pcbActual, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} szzLogs 
     * @param {Integer} cbMax 
     * @param {Pointer<UInt32>} pcbActual 
     * @returns {Integer} 
     */
    static JetGetLogInfoW(szzLogs, cbMax, pcbActual) {
        result := DllCall("ESENT.dll\JetGetLogInfoW", "ptr", szzLogs, "uint", cbMax, "uint*", pcbActual, "int")
        return result
    }

    /**
     * 
     * @param {JET_INSTANCE} instance 
     * @param {Pointer} szzLogs 
     * @param {Integer} cbMax 
     * @param {Pointer<UInt32>} pcbActual 
     * @returns {Integer} 
     */
    static JetGetLogInfoInstanceA(instance, szzLogs, cbMax, pcbActual) {
        instance := instance is Win32Handle ? NumGet(instance, "ptr") : instance

        result := DllCall("ESENT.dll\JetGetLogInfoInstanceA", "ptr", instance, "ptr", szzLogs, "uint", cbMax, "uint*", pcbActual, "int")
        return result
    }

    /**
     * 
     * @param {JET_INSTANCE} instance 
     * @param {Pointer} wszzLogs 
     * @param {Integer} cbMax 
     * @param {Pointer<UInt32>} pcbActual 
     * @returns {Integer} 
     */
    static JetGetLogInfoInstanceW(instance, wszzLogs, cbMax, pcbActual) {
        instance := instance is Win32Handle ? NumGet(instance, "ptr") : instance

        result := DllCall("ESENT.dll\JetGetLogInfoInstanceW", "ptr", instance, "ptr", wszzLogs, "uint", cbMax, "uint*", pcbActual, "int")
        return result
    }

    /**
     * 
     * @param {JET_INSTANCE} instance 
     * @param {Pointer} szzLogs 
     * @param {Integer} cbMax 
     * @param {Pointer<UInt32>} pcbActual 
     * @param {Pointer<JET_LOGINFO_A>} pLogInfo 
     * @returns {Integer} 
     */
    static JetGetLogInfoInstance2A(instance, szzLogs, cbMax, pcbActual, pLogInfo) {
        instance := instance is Win32Handle ? NumGet(instance, "ptr") : instance

        result := DllCall("ESENT.dll\JetGetLogInfoInstance2A", "ptr", instance, "ptr", szzLogs, "uint", cbMax, "uint*", pcbActual, "ptr", pLogInfo, "int")
        return result
    }

    /**
     * 
     * @param {JET_INSTANCE} instance 
     * @param {Pointer} wszzLogs 
     * @param {Integer} cbMax 
     * @param {Pointer<UInt32>} pcbActual 
     * @param {Pointer<JET_LOGINFO_W>} pLogInfo 
     * @returns {Integer} 
     */
    static JetGetLogInfoInstance2W(instance, wszzLogs, cbMax, pcbActual, pLogInfo) {
        instance := instance is Win32Handle ? NumGet(instance, "ptr") : instance

        result := DllCall("ESENT.dll\JetGetLogInfoInstance2W", "ptr", instance, "ptr", wszzLogs, "uint", cbMax, "uint*", pcbActual, "ptr", pLogInfo, "int")
        return result
    }

    /**
     * 
     * @param {JET_INSTANCE} instance 
     * @param {Pointer} szzLogs 
     * @param {Integer} cbMax 
     * @param {Pointer<UInt32>} pcbActual 
     * @returns {Integer} 
     */
    static JetGetTruncateLogInfoInstanceA(instance, szzLogs, cbMax, pcbActual) {
        instance := instance is Win32Handle ? NumGet(instance, "ptr") : instance

        result := DllCall("ESENT.dll\JetGetTruncateLogInfoInstanceA", "ptr", instance, "ptr", szzLogs, "uint", cbMax, "uint*", pcbActual, "int")
        return result
    }

    /**
     * 
     * @param {JET_INSTANCE} instance 
     * @param {Pointer} wszzLogs 
     * @param {Integer} cbMax 
     * @param {Pointer<UInt32>} pcbActual 
     * @returns {Integer} 
     */
    static JetGetTruncateLogInfoInstanceW(instance, wszzLogs, cbMax, pcbActual) {
        instance := instance is Win32Handle ? NumGet(instance, "ptr") : instance

        result := DllCall("ESENT.dll\JetGetTruncateLogInfoInstanceW", "ptr", instance, "ptr", wszzLogs, "uint", cbMax, "uint*", pcbActual, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static JetTruncateLog() {
        result := DllCall("ESENT.dll\JetTruncateLog", "int")
        return result
    }

    /**
     * 
     * @param {JET_INSTANCE} instance 
     * @returns {Integer} 
     */
    static JetTruncateLogInstance(instance) {
        instance := instance is Win32Handle ? NumGet(instance, "ptr") : instance

        result := DllCall("ESENT.dll\JetTruncateLogInstance", "ptr", instance, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static JetEndExternalBackup() {
        result := DllCall("ESENT.dll\JetEndExternalBackup", "int")
        return result
    }

    /**
     * 
     * @param {JET_INSTANCE} instance 
     * @returns {Integer} 
     */
    static JetEndExternalBackupInstance(instance) {
        instance := instance is Win32Handle ? NumGet(instance, "ptr") : instance

        result := DllCall("ESENT.dll\JetEndExternalBackupInstance", "ptr", instance, "int")
        return result
    }

    /**
     * 
     * @param {JET_INSTANCE} instance 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetEndExternalBackupInstance2(instance, grbit) {
        instance := instance is Win32Handle ? NumGet(instance, "ptr") : instance

        result := DllCall("ESENT.dll\JetEndExternalBackupInstance2", "ptr", instance, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<SByte>} szCheckpointFilePath 
     * @param {Pointer<SByte>} szLogPath 
     * @param {Pointer<JET_RSTMAP_A>} rgrstmap 
     * @param {Integer} crstfilemap 
     * @param {Pointer<SByte>} szBackupLogPath 
     * @param {Integer} genLow 
     * @param {Integer} genHigh 
     * @param {Pointer<JET_PFNSTATUS>} pfn 
     * @returns {Integer} 
     */
    static JetExternalRestoreA(szCheckpointFilePath, szLogPath, rgrstmap, crstfilemap, szBackupLogPath, genLow, genHigh, pfn) {
        result := DllCall("ESENT.dll\JetExternalRestoreA", "char*", szCheckpointFilePath, "char*", szLogPath, "ptr", rgrstmap, "int", crstfilemap, "char*", szBackupLogPath, "int", genLow, "int", genHigh, "ptr", pfn, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} szCheckpointFilePath 
     * @param {Pointer<UInt16>} szLogPath 
     * @param {Pointer<JET_RSTMAP_W>} rgrstmap 
     * @param {Integer} crstfilemap 
     * @param {Pointer<UInt16>} szBackupLogPath 
     * @param {Integer} genLow 
     * @param {Integer} genHigh 
     * @param {Pointer<JET_PFNSTATUS>} pfn 
     * @returns {Integer} 
     */
    static JetExternalRestoreW(szCheckpointFilePath, szLogPath, rgrstmap, crstfilemap, szBackupLogPath, genLow, genHigh, pfn) {
        result := DllCall("ESENT.dll\JetExternalRestoreW", "ushort*", szCheckpointFilePath, "ushort*", szLogPath, "ptr", rgrstmap, "int", crstfilemap, "ushort*", szBackupLogPath, "int", genLow, "int", genHigh, "ptr", pfn, "int")
        return result
    }

    /**
     * 
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
     */
    static JetExternalRestore2A(szCheckpointFilePath, szLogPath, rgrstmap, crstfilemap, szBackupLogPath, pLogInfo, szTargetInstanceName, szTargetInstanceLogPath, szTargetInstanceCheckpointPath, pfn) {
        result := DllCall("ESENT.dll\JetExternalRestore2A", "char*", szCheckpointFilePath, "char*", szLogPath, "ptr", rgrstmap, "int", crstfilemap, "char*", szBackupLogPath, "ptr", pLogInfo, "char*", szTargetInstanceName, "char*", szTargetInstanceLogPath, "char*", szTargetInstanceCheckpointPath, "ptr", pfn, "int")
        return result
    }

    /**
     * 
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
     */
    static JetExternalRestore2W(szCheckpointFilePath, szLogPath, rgrstmap, crstfilemap, szBackupLogPath, pLogInfo, szTargetInstanceName, szTargetInstanceLogPath, szTargetInstanceCheckpointPath, pfn) {
        result := DllCall("ESENT.dll\JetExternalRestore2W", "ushort*", szCheckpointFilePath, "ushort*", szLogPath, "ptr", rgrstmap, "int", crstfilemap, "ushort*", szBackupLogPath, "ptr", pLogInfo, "ushort*", szTargetInstanceName, "ushort*", szTargetInstanceLogPath, "ushort*", szTargetInstanceCheckpointPath, "ptr", pfn, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Integer} cbtyp 
     * @param {Pointer<JET_CALLBACK>} pCallback 
     * @param {Pointer<Void>} pvContext 
     * @param {Pointer<JET_HANDLE>} phCallbackId 
     * @returns {Integer} 
     */
    static JetRegisterCallback(sesid, tableid, cbtyp, pCallback, pvContext, phCallbackId) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetRegisterCallback", "ptr", sesid, "ptr", tableid, "uint", cbtyp, "ptr", pCallback, "ptr", pvContext, "ptr", phCallbackId, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Integer} cbtyp 
     * @param {JET_HANDLE} hCallbackId 
     * @returns {Integer} 
     */
    static JetUnregisterCallback(sesid, tableid, cbtyp, hCallbackId) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid
        hCallbackId := hCallbackId is Win32Handle ? NumGet(hCallbackId, "ptr") : hCallbackId

        result := DllCall("ESENT.dll\JetUnregisterCallback", "ptr", sesid, "ptr", tableid, "uint", cbtyp, "ptr", hCallbackId, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcInstanceInfo 
     * @param {Pointer<JET_INSTANCE_INFO_A>} paInstanceInfo 
     * @returns {Integer} 
     */
    static JetGetInstanceInfoA(pcInstanceInfo, paInstanceInfo) {
        result := DllCall("ESENT.dll\JetGetInstanceInfoA", "uint*", pcInstanceInfo, "ptr", paInstanceInfo, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcInstanceInfo 
     * @param {Pointer<JET_INSTANCE_INFO_W>} paInstanceInfo 
     * @returns {Integer} 
     */
    static JetGetInstanceInfoW(pcInstanceInfo, paInstanceInfo) {
        result := DllCall("ESENT.dll\JetGetInstanceInfoW", "uint*", pcInstanceInfo, "ptr", paInstanceInfo, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<SByte>} pbBuf 
     * @returns {Integer} 
     */
    static JetFreeBuffer(pbBuf) {
        result := DllCall("ESENT.dll\JetFreeBuffer", "char*", pbBuf, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {JET_LS} ls 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetSetLS(sesid, tableid, ls, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid
        ls := ls is Win32Handle ? NumGet(ls, "ptr") : ls

        result := DllCall("ESENT.dll\JetSetLS", "ptr", sesid, "ptr", tableid, "ptr", ls, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {JET_TABLEID} tableid 
     * @param {Pointer<JET_LS>} pls 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetGetLS(sesid, tableid, pls, grbit) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid

        result := DllCall("ESENT.dll\JetGetLS", "ptr", sesid, "ptr", tableid, "ptr", pls, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<JET_OSSNAPID>} psnapId 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetOSSnapshotPrepare(psnapId, grbit) {
        result := DllCall("ESENT.dll\JetOSSnapshotPrepare", "ptr", psnapId, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_OSSNAPID} snapId 
     * @param {JET_INSTANCE} instance 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetOSSnapshotPrepareInstance(snapId, instance, grbit) {
        snapId := snapId is Win32Handle ? NumGet(snapId, "ptr") : snapId
        instance := instance is Win32Handle ? NumGet(instance, "ptr") : instance

        result := DllCall("ESENT.dll\JetOSSnapshotPrepareInstance", "ptr", snapId, "ptr", instance, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_OSSNAPID} snapId 
     * @param {Pointer<UInt32>} pcInstanceInfo 
     * @param {Pointer<JET_INSTANCE_INFO_A>} paInstanceInfo 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetOSSnapshotFreezeA(snapId, pcInstanceInfo, paInstanceInfo, grbit) {
        snapId := snapId is Win32Handle ? NumGet(snapId, "ptr") : snapId

        result := DllCall("ESENT.dll\JetOSSnapshotFreezeA", "ptr", snapId, "uint*", pcInstanceInfo, "ptr", paInstanceInfo, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_OSSNAPID} snapId 
     * @param {Pointer<UInt32>} pcInstanceInfo 
     * @param {Pointer<JET_INSTANCE_INFO_W>} paInstanceInfo 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetOSSnapshotFreezeW(snapId, pcInstanceInfo, paInstanceInfo, grbit) {
        snapId := snapId is Win32Handle ? NumGet(snapId, "ptr") : snapId

        result := DllCall("ESENT.dll\JetOSSnapshotFreezeW", "ptr", snapId, "uint*", pcInstanceInfo, "ptr", paInstanceInfo, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_OSSNAPID} snapId 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetOSSnapshotThaw(snapId, grbit) {
        snapId := snapId is Win32Handle ? NumGet(snapId, "ptr") : snapId

        result := DllCall("ESENT.dll\JetOSSnapshotThaw", "ptr", snapId, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_OSSNAPID} snapId 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetOSSnapshotAbort(snapId, grbit) {
        snapId := snapId is Win32Handle ? NumGet(snapId, "ptr") : snapId

        result := DllCall("ESENT.dll\JetOSSnapshotAbort", "ptr", snapId, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_OSSNAPID} snapId 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetOSSnapshotTruncateLog(snapId, grbit) {
        snapId := snapId is Win32Handle ? NumGet(snapId, "ptr") : snapId

        result := DllCall("ESENT.dll\JetOSSnapshotTruncateLog", "ptr", snapId, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_OSSNAPID} snapId 
     * @param {JET_INSTANCE} instance 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetOSSnapshotTruncateLogInstance(snapId, instance, grbit) {
        snapId := snapId is Win32Handle ? NumGet(snapId, "ptr") : snapId
        instance := instance is Win32Handle ? NumGet(instance, "ptr") : instance

        result := DllCall("ESENT.dll\JetOSSnapshotTruncateLogInstance", "ptr", snapId, "ptr", instance, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_OSSNAPID} snapId 
     * @param {Pointer<UInt32>} pcInstanceInfo 
     * @param {Pointer<JET_INSTANCE_INFO_A>} paInstanceInfo 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetOSSnapshotGetFreezeInfoA(snapId, pcInstanceInfo, paInstanceInfo, grbit) {
        snapId := snapId is Win32Handle ? NumGet(snapId, "ptr") : snapId

        result := DllCall("ESENT.dll\JetOSSnapshotGetFreezeInfoA", "ptr", snapId, "uint*", pcInstanceInfo, "ptr", paInstanceInfo, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_OSSNAPID} snapId 
     * @param {Pointer<UInt32>} pcInstanceInfo 
     * @param {Pointer<JET_INSTANCE_INFO_W>} paInstanceInfo 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetOSSnapshotGetFreezeInfoW(snapId, pcInstanceInfo, paInstanceInfo, grbit) {
        snapId := snapId is Win32Handle ? NumGet(snapId, "ptr") : snapId

        result := DllCall("ESENT.dll\JetOSSnapshotGetFreezeInfoW", "ptr", snapId, "uint*", pcInstanceInfo, "ptr", paInstanceInfo, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_OSSNAPID} snapId 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetOSSnapshotEnd(snapId, grbit) {
        snapId := snapId is Win32Handle ? NumGet(snapId, "ptr") : snapId

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
     * 
     * @param {Pointer<Void>} pvContext 
     * @param {Pointer} pvResult 
     * @param {Integer} cbMax 
     * @param {Integer} InfoLevel 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    static JetGetErrorInfoW(pvContext, pvResult, cbMax, InfoLevel, grbit) {
        result := DllCall("ESENT.dll\JetGetErrorInfoW", "ptr", pvContext, "ptr", pvResult, "uint", cbMax, "uint", InfoLevel, "uint", grbit, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Integer} sesparamid 
     * @param {Pointer} pvParam 
     * @param {Integer} cbParam 
     * @returns {Integer} 
     */
    static JetSetSessionParameter(sesid, sesparamid, pvParam, cbParam) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetSetSessionParameter", "ptr", sesid, "uint", sesparamid, "ptr", pvParam, "uint", cbParam, "int")
        return result
    }

    /**
     * 
     * @param {JET_SESID} sesid 
     * @param {Integer} sesparamid 
     * @param {Pointer<Void>} pvParam 
     * @param {Integer} cbParamMax 
     * @param {Pointer<UInt32>} pcbParamActual 
     * @returns {Integer} 
     */
    static JetGetSessionParameter(sesid, sesparamid, pvParam, cbParamMax, pcbParamActual) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid

        result := DllCall("ESENT.dll\JetGetSessionParameter", "ptr", sesid, "uint", sesparamid, "ptr", pvParam, "uint", cbParamMax, "uint*", pcbParamActual, "int")
        return result
    }

;@endregion Methods
}

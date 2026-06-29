#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Jet
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global JET_VERSION := 1280

/**
 * @type {String}
 */
export global JET_wszConfigStoreReadControl := "CsReadControl"

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitConfigStoreReadControlInhibitRead := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitConfigStoreReadControlDisableAll := 2

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitConfigStoreReadControlDefault := 0

/**
 * @type {String}
 */
export global JET_wszConfigStoreRelPathSysParamDefault := "SysParamDefault"

/**
 * @type {String}
 */
export global JET_wszConfigStoreRelPathSysParamOverride := "SysParamOverride"

/**
 * @type {Integer (UInt32)}
 */
export global JET_efvUseEngineDefault := 1073741825

/**
 * @type {Integer (UInt32)}
 */
export global JET_efvUsePersistedFormat := 1073741826

/**
 * @type {Integer (UInt32)}
 */
export global JET_efvAllowHigherPersistedFormat := 1090519040

/**
 * @type {Integer (UInt32)}
 */
export global JET_efvWindows19H1Rtm := 8920

/**
 * @type {Integer (UInt32)}
 */
export global JET_efvWindows10v2004 := 9180

/**
 * @type {Integer (UInt32)}
 */
export global JET_efvWindowsServer2022 := 9360

/**
 * @type {Integer (UInt32)}
 */
export global JET_efvWindows11v21H2 := 9400

/**
 * @type {Integer (UInt32)}
 */
export global JET_efvWindows11v22H2 := 9480

/**
 * @type {Integer (UInt32)}
 */
export global JET_efvWindows11v23H2 := 9600

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitDefragmentBatchStart := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitDefragmentBatchStop := 2

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitDefragmentAvailSpaceTreesOnly := 64

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitDefragmentNoPartialMerges := 128

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitDefragmentBTree := 256

/**
 * @type {Integer (UInt32)}
 */
export global JET_cbtypNull := 0

/**
 * @type {Integer (UInt32)}
 */
export global JET_cbtypFinalize := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_cbtypBeforeInsert := 2

/**
 * @type {Integer (UInt32)}
 */
export global JET_cbtypAfterInsert := 4

/**
 * @type {Integer (UInt32)}
 */
export global JET_cbtypBeforeReplace := 8

/**
 * @type {Integer (UInt32)}
 */
export global JET_cbtypAfterReplace := 16

/**
 * @type {Integer (UInt32)}
 */
export global JET_cbtypBeforeDelete := 32

/**
 * @type {Integer (UInt32)}
 */
export global JET_cbtypAfterDelete := 64

/**
 * @type {Integer (UInt32)}
 */
export global JET_cbtypUserDefinedDefaultValue := 128

/**
 * @type {Integer (UInt32)}
 */
export global JET_cbtypOnlineDefragCompleted := 256

/**
 * @type {Integer (UInt32)}
 */
export global JET_cbtypFreeCursorLS := 512

/**
 * @type {Integer (UInt32)}
 */
export global JET_cbtypFreeTableLS := 1024

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTableInfoUpdatable := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTableInfoBookmark := 2

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTableInfoRollback := 4

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitObjectSystem := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitObjectTableFixedDDL := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitObjectTableTemplate := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitObjectTableDerived := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitObjectTableNoFixedVarColumnsInDerivedTables := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global cObjectInfoCols := 9

/**
 * @type {Integer (UInt32)}
 */
export global cColumnInfoCols := 14

/**
 * @type {Integer (UInt32)}
 */
export global cIndexInfoCols := 15

/**
 * @type {Integer (UInt32)}
 */
export global JET_MAX_COMPUTERNAME_LENGTH := 15

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitDurableCommitCallbackLogUnavailable := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_cbBookmarkMost := 256

/**
 * @type {Integer (UInt32)}
 */
export global JET_cbNameMost := 64

/**
 * @type {Integer (UInt32)}
 */
export global JET_cbFullNameMost := 255

/**
 * @type {Integer (UInt32)}
 */
export global JET_cbColumnLVPageOverhead := 82

/**
 * @type {Integer (UInt32)}
 */
export global JET_cbLVDefaultValueMost := 255

/**
 * @type {Integer (UInt32)}
 */
export global JET_cbColumnMost := 255

/**
 * @type {Integer (UInt32)}
 */
export global JET_cbLVColumnMost := 2147483647

/**
 * @type {Integer (UInt32)}
 */
export global JET_cbKeyMost8KBytePage := 2000

/**
 * @type {Integer (UInt32)}
 */
export global JET_cbKeyMost4KBytePage := 1000

/**
 * @type {Integer (UInt32)}
 */
export global JET_cbKeyMost2KBytePage := 500

/**
 * @type {Integer (UInt32)}
 */
export global JET_cbKeyMostMin := 255

/**
 * @type {Integer (UInt32)}
 */
export global JET_cbKeyMost := 255

/**
 * @type {Integer (UInt32)}
 */
export global JET_cbLimitKeyMost := 256

/**
 * @type {Integer (UInt32)}
 */
export global JET_cbPrimaryKeyMost := 255

/**
 * @type {Integer (UInt32)}
 */
export global JET_cbSecondaryKeyMost := 255

/**
 * @type {Integer (UInt32)}
 */
export global JET_ccolKeyMost := 16

/**
 * @type {Integer (UInt32)}
 */
export global JET_ccolMost := 65248

/**
 * @type {Integer (UInt32)}
 */
export global JET_ccolFixedMost := 127

/**
 * @type {Integer (UInt32)}
 */
export global JET_ccolVarMost := 128

/**
 * @type {Integer (UInt32)}
 */
export global JET_ccolTaggedMost := 64993

/**
 * @type {Integer (UInt32)}
 */
export global JET_EventLoggingDisable := 0

/**
 * @type {Integer (UInt32)}
 */
export global JET_EventLoggingLevelMin := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_EventLoggingLevelLow := 25

/**
 * @type {Integer (UInt32)}
 */
export global JET_EventLoggingLevelMedium := 50

/**
 * @type {Integer (UInt32)}
 */
export global JET_EventLoggingLevelHigh := 75

/**
 * @type {Integer (UInt32)}
 */
export global JET_EventLoggingLevelMax := 100

/**
 * @type {Integer (UInt32)}
 */
export global JET_IOPriorityNormal := 0

/**
 * @type {Integer (UInt32)}
 */
export global JET_IOPriorityLow := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_configDefault := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_configRemoveQuotas := 2

/**
 * @type {Integer (UInt32)}
 */
export global JET_configLowDiskFootprint := 4

/**
 * @type {Integer (UInt32)}
 */
export global JET_configMediumDiskFootprint := 8

/**
 * @type {Integer (UInt32)}
 */
export global JET_configLowMemory := 16

/**
 * @type {Integer (UInt32)}
 */
export global JET_configDynamicMediumMemory := 32

/**
 * @type {Integer (UInt32)}
 */
export global JET_configLowPower := 64

/**
 * @type {Integer (UInt32)}
 */
export global JET_configSSDProfileIO := 128

/**
 * @type {Integer (UInt32)}
 */
export global JET_configRunSilent := 256

/**
 * @type {Integer (UInt32)}
 */
export global JET_configUnthrottledMemory := 512

/**
 * @type {Integer (UInt32)}
 */
export global JET_configHighConcurrencyScaling := 1024

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramSystemPath := 0

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramTempPath := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramLogFilePath := 2

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramBaseName := 3

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramEventSource := 4

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramMaxSessions := 5

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramMaxOpenTables := 6

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramPreferredMaxOpenTables := 7

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramCachedClosedTables := 125

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramMaxCursors := 8

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramMaxVerPages := 9

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramPreferredVerPages := 63

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramGlobalMinVerPages := 81

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramVersionStoreTaskQueueMax := 105

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramMaxTemporaryTables := 10

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramLogFileSize := 11

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramLogBuffers := 12

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramWaitLogFlush := 13

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramLogCheckpointPeriod := 14

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramLogWaitingUserMax := 15

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramCommitDefault := 16

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramCircularLog := 17

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramDbExtensionSize := 18

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramPageTempDBMin := 19

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramPageFragment := 20

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramEnableFileCache := 126

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramVerPageSize := 128

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramConfiguration := 129

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramEnableAdvanced := 130

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramMaxColtyp := 131

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramBatchIOBufferMax := 22

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramCacheSize := 41

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramCacheSizeMin := 60

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramCacheSizeMax := 23

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramCheckpointDepthMax := 24

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramLRUKCorrInterval := 25

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramLRUKHistoryMax := 26

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramLRUKPolicy := 27

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramLRUKTimeout := 28

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramLRUKTrxCorrInterval := 29

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramOutstandingIOMax := 30

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramStartFlushThreshold := 31

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramStopFlushThreshold := 32

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramEnableViewCache := 127

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramCheckpointIOMax := 135

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramTableClass1Name := 137

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramTableClass2Name := 138

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramTableClass3Name := 139

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramTableClass4Name := 140

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramTableClass5Name := 141

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramTableClass6Name := 142

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramTableClass7Name := 143

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramTableClass8Name := 144

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramTableClass9Name := 145

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramTableClass10Name := 146

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramTableClass11Name := 147

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramTableClass12Name := 148

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramTableClass13Name := 149

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramTableClass14Name := 150

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramTableClass15Name := 151

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramIOPriority := 152

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramRecovery := 34

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramEnableOnlineDefrag := 35

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramCheckFormatWhenOpenFail := 44

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramEnableTempTableVersioning := 46

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramIgnoreLogVersion := 47

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramDeleteOldLogs := 48

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramEventSourceKey := 49

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramNoInformationEvent := 50

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramEventLoggingLevel := 51

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramDeleteOutOfRangeLogs := 52

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramAccessDeniedRetryPeriod := 53

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramEnableIndexChecking := 45

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramEnableIndexCleanup := 54

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramDatabasePageSize := 64

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramDisableCallbacks := 65

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramLogFileCreateAsynch := 69

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramErrorToString := 70

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramZeroDatabaseDuringBackup := 71

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramUnicodeIndexDefault := 72

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramRuntimeCallback := 73

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramCleanupMismatchedLogFiles := 77

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramRecordUpgradeDirtyLevel := 78

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramOSSnapshotTimeout := 82

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramExceptionAction := 98

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramEventLogCache := 99

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramCreatePathIfNotExist := 100

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramPageHintCacheSize := 101

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramOneDatabasePerSession := 102

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramMaxInstances := 104

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramDisablePerfmon := 107

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramIndexTuplesLengthMin := 110

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramIndexTuplesLengthMax := 111

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramIndexTuplesToIndexMax := 112

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramAlternateDatabaseRecoveryPath := 113

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramIndexTupleIncrement := 132

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramIndexTupleStart := 133

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramKeyMost := 134

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramLegacyFileNames := 136

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramEnablePersistedCallbacks := 156

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramWaypointLatency := 153

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramDefragmentSequentialBTrees := 160

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramDefragmentSequentialBTreesDensityCheckFrequency := 161

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramIOThrottlingTimeQuanta := 162

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramLVChunkSizeMost := 163

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramMaxCoalesceReadSize := 164

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramMaxCoalesceWriteSize := 165

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramMaxCoalesceReadGapSize := 166

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramMaxCoalesceWriteGapSize := 167

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramEnableDBScanInRecovery := 169

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramDbScanThrottle := 170

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramDbScanIntervalMinSec := 171

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramDbScanIntervalMaxSec := 172

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramCachePriority := 177

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramMaxTransactionSize := 178

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramPrereadIOMax := 179

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramEnableDBScanSerialization := 180

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramHungIOThreshold := 181

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramHungIOActions := 182

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramMinDataForXpress := 183

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramEnableShrinkDatabase := 184

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramProcessFriendlyName := 186

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramDurableCommitCallback := 187

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramEnableSqm := 188

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramConfigStoreSpec := 189

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramEngineFormatVersion := 194

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramUseFlushForWriteDurability := 214

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramEnableRBS := 215

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramRBSFilePath := 216

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramPerfmonRefreshInterval := 217

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramEnableBlockCache := 218

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramTraceFlags := 223

/**
 * @type {Integer (UInt32)}
 */
export global JET_paramMaxValueInvalid := 232

/**
 * @type {Integer (UInt32)}
 */
export global JET_sesparamCommitDefault := 4097

/**
 * @type {Integer (UInt32)}
 */
export global JET_sesparamTransactionLevel := 4099

/**
 * @type {Integer (UInt32)}
 */
export global JET_sesparamOperationContext := 4100

/**
 * @type {Integer (UInt32)}
 */
export global JET_sesparamCorrelationID := 4101

/**
 * @type {Integer (UInt32)}
 */
export global JET_sesparamMaxValueInvalid := 4111

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitESE98FileNames := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitEightDotThreeSoftCompat := 2

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitHungIOEvent := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitShrinkDatabaseOff := 0

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitShrinkDatabaseOn := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitShrinkDatabaseRealtime := 2

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitShrinkDatabaseTrim := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitReplayIgnoreMissingDB := 4

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitRecoveryWithoutUndo := 8

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTruncateLogsAfterRecovery := 16

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitReplayMissingMapEntryDB := 32

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitLogStreamMustExist := 64

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitReplayIgnoreLostLogs := 128

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitKeepDbAttachedAtEndOfRecovery := 4096

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTermComplete := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTermAbrupt := 2

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTermStopBackup := 4

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTermDirty := 8

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitIdleFlushBuffers := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitIdleCompact := 2

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitIdleStatus := 4

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitDbReadOnly := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitDbExclusive := 2

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitDbDeleteCorruptIndexes := 16

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitDbDeleteUnicodeIndexes := 1024

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitDbUpgrade := 512

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitDbEnableBackgroundMaintenance := 2048

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitDbPurgeCacheOnAttach := 4096

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitForceDetach := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitDbRecoveryOff := 8

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitDbShadowingOff := 128

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitDbOverwriteExisting := 512

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitBackupIncremental := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitBackupAtomic := 4

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitBackupSnapshot := 16

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitBackupEndNormal := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitBackupEndAbort := 2

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitBackupTruncateDone := 256

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTableCreateFixedDDL := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTableCreateTemplateTable := 2

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTableCreateNoFixedVarColumnsInDerivedTables := 4

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTableCreateImmutableStructure := 8

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitColumnFixed := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitColumnTagged := 2

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitColumnNotNULL := 4

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitColumnVersion := 8

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitColumnAutoincrement := 16

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitColumnUpdatable := 32

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitColumnTTKey := 64

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitColumnTTDescending := 128

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitColumnMultiValued := 1024

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitColumnEscrowUpdate := 2048

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitColumnUnversioned := 4096

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitColumnMaybeNull := 8192

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitColumnFinalize := 16384

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitColumnUserDefinedDefault := 32768

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitColumnDeleteOnZero := 131072

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitColumnCompressed := 524288

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitDeleteColumnIgnoreTemplateColumns := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitMoveFirst := 0

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitNoMove := 2

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitNewKey := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitStrLimit := 2

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitSubStrLimit := 4

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitNormalizedKey := 8

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitKeyDataZeroLength := 16

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitFullColumnStartLimit := 256

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitFullColumnEndLimit := 512

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitPartialColumnStartLimit := 1024

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitPartialColumnEndLimit := 2048

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitRangeInclusive := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitRangeUpperLimit := 2

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitRangeInstantDuration := 4

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitRangeRemove := 8

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitReadLock := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitWriteLock := 2

/**
 * @type {Integer (UInt32)}
 */
export global JET_MoveFirst := 2147483648

/**
 * @type {Integer (Int32)}
 */
export global JET_MovePrevious := -1

/**
 * @type {Integer (UInt32)}
 */
export global JET_MoveLast := 2147483647

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitMoveKeyNE := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitSeekEQ := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitSeekLT := 2

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitSeekLE := 4

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitSeekGE := 8

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitSeekGT := 16

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitSetIndexRange := 32

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitCheckUniqueness := 64

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitBookmarkPermitVirtualCurrency := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitIndexColumnMustBeNull := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitIndexColumnMustBeNonNull := 2

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitRecordInIndex := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitRecordNotInIndex := 2

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitIndexUnique := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitIndexPrimary := 2

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitIndexDisallowNull := 4

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitIndexIgnoreNull := 8

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitIndexIgnoreAnyNull := 32

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitIndexIgnoreFirstNull := 64

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitIndexLazyFlush := 128

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitIndexEmpty := 256

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitIndexUnversioned := 512

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitIndexSortNullsHigh := 1024

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitIndexUnicode := 2048

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitIndexTuples := 4096

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitIndexTupleLimits := 8192

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitIndexCrossProduct := 16384

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitIndexKeyMost := 32768

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitIndexDisallowTruncation := 65536

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitIndexNestedTable := 131072

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitIndexDotNetGuid := 262144

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitIndexImmutableStructure := 524288

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitKeyAscending := 0

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitKeyDescending := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTableDenyWrite := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTableDenyRead := 2

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTableReadOnly := 4

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTableUpdatable := 8

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTablePermitDDL := 16

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTableNoCache := 32

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTablePreread := 64

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTableOpportuneRead := 128

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTableSequential := 32768

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTableClassMask := 2031616

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTableClassNone := 0

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTableClass1 := 65536

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTableClass2 := 131072

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTableClass3 := 196608

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTableClass4 := 262144

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTableClass5 := 327680

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTableClass6 := 393216

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTableClass7 := 458752

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTableClass8 := 524288

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTableClass9 := 589824

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTableClass10 := 655360

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTableClass11 := 720896

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTableClass12 := 786432

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTableClass13 := 851968

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTableClass14 := 917504

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTableClass15 := 983040

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitLSReset := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitLSCursor := 2

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitLSTable := 4

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitPrereadForward := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitPrereadBackward := 2

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitPrereadFirstPage := 4

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitPrereadNormalizedKey := 8

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTTIndexed := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTTUnique := 2

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTTUpdatable := 4

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTTScrollable := 8

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTTSortNullsHigh := 16

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTTForceMaterialization := 32

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTTErrorOnDuplicateInsertion := 32

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTTForwardOnly := 64

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTTIntrinsicLVsOnly := 128

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTTDotNetGuid := 256

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTTMaterializeBBT := 512

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitSetAppendLV := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitSetOverwriteLV := 4

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitSetSizeLV := 8

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitSetZeroLength := 32

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitSetSeparateLV := 64

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitSetUniqueMultiValues := 128

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitSetUniqueNormalizedMultiValues := 256

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitSetRevertToDefaultValue := 512

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitSetIntrinsicLV := 1024

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitSetUncompressed := 65536

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitSetCompressed := 131072

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitSetContiguousLV := 262144

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitSpaceHintsUtilizeParentSpace := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitCreateHintAppendSequential := 2

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitCreateHintHotpointSequential := 4

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitRetrieveHintReserve1 := 8

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitRetrieveHintTableScanForward := 16

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitRetrieveHintTableScanBackward := 32

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitRetrieveHintReserve2 := 64

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitRetrieveHintReserve3 := 128

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitDeleteHintTableSequential := 256

/**
 * @type {Integer (UInt32)}
 */
export global JET_prepInsert := 0

/**
 * @type {Integer (UInt32)}
 */
export global JET_prepReplace := 2

/**
 * @type {Integer (UInt32)}
 */
export global JET_prepCancel := 3

/**
 * @type {Integer (UInt32)}
 */
export global JET_prepReplaceNoLock := 4

/**
 * @type {Integer (UInt32)}
 */
export global JET_prepInsertCopy := 5

/**
 * @type {Integer (UInt32)}
 */
export global JET_prepInsertCopyDeleteOriginal := 7

/**
 * @type {Integer (UInt32)}
 */
export global JET_prepInsertCopyReplaceOriginal := 9

/**
 * @type {Integer (UInt32)}
 */
export global JET_sqmDisable := 0

/**
 * @type {Integer (UInt32)}
 */
export global JET_sqmEnable := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_sqmFromCEIP := 2

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitUpdateCheckESE97Compatibility := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitEscrowNoRollback := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitRetrieveCopy := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitRetrieveFromIndex := 2

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitRetrieveFromPrimaryBookmark := 4

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitRetrieveTag := 8

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitRetrieveNull := 16

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitRetrieveIgnoreDefault := 32

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitRetrieveTuple := 2048

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitZeroLength := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitEnumerateCopy := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitEnumerateIgnoreDefault := 32

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitEnumeratePresenceOnly := 131072

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitEnumerateTaggedOnly := 262144

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitEnumerateCompressOutput := 524288

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitEnumerateIgnoreUserDefinedDefault := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitEnumerateInRecordOnly := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitRecordSizeInCopyBuffer := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitRecordSizeRunningTotal := 2

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitRecordSizeLocal := 4

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitTransactionReadOnly := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitCommitLazyFlush := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitWaitLastLevel0Commit := 2

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitWaitAllLevel0Commit := 8

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitForceNewLog := 16

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitRollbackAll := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitIncrementalSnapshot := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitCopySnapshot := 2

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitContinueAfterThaw := 4

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitExplicitPrepare := 8

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitAllDatabasesSnapshot := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitAbortSnapshot := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_DbInfoFilename := 0

/**
 * @type {Integer (UInt32)}
 */
export global JET_DbInfoConnect := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_DbInfoCountry := 2

/**
 * @type {Integer (UInt32)}
 */
export global JET_DbInfoLCID := 3

/**
 * @type {Integer (UInt32)}
 */
export global JET_DbInfoLangid := 3

/**
 * @type {Integer (UInt32)}
 */
export global JET_DbInfoCp := 4

/**
 * @type {Integer (UInt32)}
 */
export global JET_DbInfoCollate := 5

/**
 * @type {Integer (UInt32)}
 */
export global JET_DbInfoOptions := 6

/**
 * @type {Integer (UInt32)}
 */
export global JET_DbInfoTransactions := 7

/**
 * @type {Integer (UInt32)}
 */
export global JET_DbInfoVersion := 8

/**
 * @type {Integer (UInt32)}
 */
export global JET_DbInfoIsam := 9

/**
 * @type {Integer (UInt32)}
 */
export global JET_DbInfoFilesize := 10

/**
 * @type {Integer (UInt32)}
 */
export global JET_DbInfoSpaceOwned := 11

/**
 * @type {Integer (UInt32)}
 */
export global JET_DbInfoSpaceAvailable := 12

/**
 * @type {Integer (UInt32)}
 */
export global JET_DbInfoUpgrade := 13

/**
 * @type {Integer (UInt32)}
 */
export global JET_DbInfoMisc := 14

/**
 * @type {Integer (UInt32)}
 */
export global JET_DbInfoDBInUse := 15

/**
 * @type {Integer (UInt32)}
 */
export global JET_DbInfoPageSize := 17

/**
 * @type {Integer (UInt32)}
 */
export global JET_DbInfoFileType := 19

/**
 * @type {Integer (UInt32)}
 */
export global JET_DbInfoFilesizeOnDisk := 21

/**
 * @type {Integer (UInt32)}
 */
export global JET_dbstateJustCreated := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_dbstateDirtyShutdown := 2

/**
 * @type {Integer (UInt32)}
 */
export global JET_dbstateCleanShutdown := 3

/**
 * @type {Integer (UInt32)}
 */
export global JET_dbstateBeingConverted := 4

/**
 * @type {Integer (UInt32)}
 */
export global JET_dbstateForceDetach := 5

/**
 * @type {Integer (UInt32)}
 */
export global JET_filetypeUnknown := 0

/**
 * @type {Integer (UInt32)}
 */
export global JET_filetypeDatabase := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_filetypeLog := 3

/**
 * @type {Integer (UInt32)}
 */
export global JET_filetypeCheckpoint := 4

/**
 * @type {Integer (UInt32)}
 */
export global JET_filetypeTempDatabase := 5

/**
 * @type {Integer (UInt32)}
 */
export global JET_filetypeFlushMap := 7

/**
 * @type {Integer (UInt32)}
 */
export global JET_coltypNil := 0

/**
 * @type {Integer (UInt32)}
 */
export global JET_coltypBit := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_coltypUnsignedByte := 2

/**
 * @type {Integer (UInt32)}
 */
export global JET_coltypShort := 3

/**
 * @type {Integer (UInt32)}
 */
export global JET_coltypLong := 4

/**
 * @type {Integer (UInt32)}
 */
export global JET_coltypCurrency := 5

/**
 * @type {Integer (UInt32)}
 */
export global JET_coltypIEEESingle := 6

/**
 * @type {Integer (UInt32)}
 */
export global JET_coltypIEEEDouble := 7

/**
 * @type {Integer (UInt32)}
 */
export global JET_coltypDateTime := 8

/**
 * @type {Integer (UInt32)}
 */
export global JET_coltypBinary := 9

/**
 * @type {Integer (UInt32)}
 */
export global JET_coltypText := 10

/**
 * @type {Integer (UInt32)}
 */
export global JET_coltypLongBinary := 11

/**
 * @type {Integer (UInt32)}
 */
export global JET_coltypLongText := 12

/**
 * @type {Integer (UInt32)}
 */
export global JET_coltypMax := 13

/**
 * @type {Integer (UInt32)}
 */
export global JET_coltypSLV := 13

/**
 * @type {Integer (UInt32)}
 */
export global JET_coltypUnsignedLong := 14

/**
 * @type {Integer (UInt32)}
 */
export global JET_coltypLongLong := 15

/**
 * @type {Integer (UInt32)}
 */
export global JET_coltypGUID := 16

/**
 * @type {Integer (UInt32)}
 */
export global JET_coltypUnsignedShort := 17

/**
 * @type {Integer (UInt32)}
 */
export global JET_coltypUnsignedLongLong := 18

/**
 * @type {Integer (UInt32)}
 */
export global JET_ColInfoGrbitNonDerivedColumnsOnly := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global JET_ColInfoGrbitMinimalInfo := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global JET_ColInfoGrbitSortByColumnid := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global JET_objtypNil := 0

/**
 * @type {Integer (UInt32)}
 */
export global JET_objtypTable := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitCompactStats := 32

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitCompactRepair := 64

/**
 * @type {Integer (UInt32)}
 */
export global JET_snpRepair := 2

/**
 * @type {Integer (UInt32)}
 */
export global JET_snpCompact := 4

/**
 * @type {Integer (UInt32)}
 */
export global JET_snpRestore := 8

/**
 * @type {Integer (UInt32)}
 */
export global JET_snpBackup := 9

/**
 * @type {Integer (UInt32)}
 */
export global JET_snpUpgrade := 10

/**
 * @type {Integer (UInt32)}
 */
export global JET_snpScrub := 11

/**
 * @type {Integer (UInt32)}
 */
export global JET_snpUpgradeRecordFormat := 12

/**
 * @type {Integer (UInt32)}
 */
export global JET_sntBegin := 5

/**
 * @type {Integer (UInt32)}
 */
export global JET_sntRequirements := 7

/**
 * @type {Integer (UInt32)}
 */
export global JET_sntProgress := 0

/**
 * @type {Integer (UInt32)}
 */
export global JET_sntComplete := 6

/**
 * @type {Integer (UInt32)}
 */
export global JET_sntFail := 3

/**
 * @type {Integer (UInt32)}
 */
export global JET_ExceptionMsgBox := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_ExceptionNone := 2

/**
 * @type {Integer (UInt32)}
 */
export global JET_ExceptionFailFast := 4

/**
 * @type {Integer (UInt32)}
 */
export global JET_OnlineDefragDisable := 0

/**
 * @type {Integer (UInt32)}
 */
export global JET_OnlineDefragAllOBSOLETE := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_OnlineDefragDatabases := 2

/**
 * @type {Integer (UInt32)}
 */
export global JET_OnlineDefragSpaceTrees := 4

/**
 * @type {Integer (UInt32)}
 */
export global JET_OnlineDefragAll := 65535

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitResizeDatabaseOnlyGrow := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitResizeDatabaseOnlyShrink := 2

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitStopServiceAll := 0

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitStopServiceBackgroundUserTasks := 2

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitStopServiceQuiesceCaches := 4

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitStopServiceResume := 2147483648

/**
 * @type {Integer (Int32)}
 */
export global JET_errSuccess := 0

/**
 * @type {Integer (Int32)}
 */
export global JET_wrnNyi := -1

/**
 * @type {Integer (Int32)}
 */
export global JET_errRfsFailure := -100

/**
 * @type {Integer (Int32)}
 */
export global JET_errRfsNotArmed := -101

/**
 * @type {Integer (Int32)}
 */
export global JET_errFileClose := -102

/**
 * @type {Integer (Int32)}
 */
export global JET_errOutOfThreads := -103

/**
 * @type {Integer (Int32)}
 */
export global JET_errTooManyIO := -105

/**
 * @type {Integer (Int32)}
 */
export global JET_errTaskDropped := -106

/**
 * @type {Integer (Int32)}
 */
export global JET_errInternalError := -107

/**
 * @type {Integer (Int32)}
 */
export global JET_errDisabledFunctionality := -112

/**
 * @type {Integer (Int32)}
 */
export global JET_errUnloadableOSFunctionality := -113

/**
 * @type {Integer (Int32)}
 */
export global JET_errDatabaseBufferDependenciesCorrupted := -255

/**
 * @type {Integer (UInt32)}
 */
export global JET_wrnRemainingVersions := 321

/**
 * @type {Integer (Int32)}
 */
export global JET_errPreviousVersion := -322

/**
 * @type {Integer (Int32)}
 */
export global JET_errPageBoundary := -323

/**
 * @type {Integer (Int32)}
 */
export global JET_errKeyBoundary := -324

/**
 * @type {Integer (Int32)}
 */
export global JET_errBadPageLink := -327

/**
 * @type {Integer (Int32)}
 */
export global JET_errBadBookmark := -328

/**
 * @type {Integer (Int32)}
 */
export global JET_errNTSystemCallFailed := -334

/**
 * @type {Integer (Int32)}
 */
export global JET_errBadParentPageLink := -338

/**
 * @type {Integer (Int32)}
 */
export global JET_errSPAvailExtCacheOutOfSync := -340

/**
 * @type {Integer (Int32)}
 */
export global JET_errSPAvailExtCorrupted := -341

/**
 * @type {Integer (Int32)}
 */
export global JET_errSPAvailExtCacheOutOfMemory := -342

/**
 * @type {Integer (Int32)}
 */
export global JET_errSPOwnExtCorrupted := -343

/**
 * @type {Integer (Int32)}
 */
export global JET_errDbTimeCorrupted := -344

/**
 * @type {Integer (UInt32)}
 */
export global JET_wrnUniqueKey := 345

/**
 * @type {Integer (Int32)}
 */
export global JET_errKeyTruncated := -346

/**
 * @type {Integer (Int32)}
 */
export global JET_errDatabaseLeakInSpace := -348

/**
 * @type {Integer (Int32)}
 */
export global JET_errBadEmptyPage := -351

/**
 * @type {Integer (UInt32)}
 */
export global wrnBTNotVisibleRejected := 352

/**
 * @type {Integer (UInt32)}
 */
export global wrnBTNotVisibleAccumulated := 353

/**
 * @type {Integer (Int32)}
 */
export global JET_errBadLineCount := -354

/**
 * @type {Integer (Int32)}
 */
export global JET_errPageTagCorrupted := -357

/**
 * @type {Integer (Int32)}
 */
export global JET_errNodeCorrupted := -358

/**
 * @type {Integer (Int32)}
 */
export global JET_errBBTNodeCorrupted := -364

/**
 * @type {Integer (Int32)}
 */
export global JET_errBBTBuffCorrupted := -365

/**
 * @type {Integer (UInt32)}
 */
export global JET_wrnSeparateLongValue := 406

/**
 * @type {Integer (Int32)}
 */
export global JET_errKeyTooBig := -408

/**
 * @type {Integer (Int32)}
 */
export global JET_errCannotSeparateIntrinsicLV := -416

/**
 * @type {Integer (Int32)}
 */
export global JET_errSeparatedLongValue := -421

/**
 * @type {Integer (Int32)}
 */
export global JET_errMustBeSeparateLongValue := -423

/**
 * @type {Integer (Int32)}
 */
export global JET_errInvalidPreread := -424

/**
 * @type {Integer (Int32)}
 */
export global JET_errInvalidLoggedOperation := -500

/**
 * @type {Integer (Int32)}
 */
export global JET_errLogFileCorrupt := -501

/**
 * @type {Integer (Int32)}
 */
export global JET_errNoBackupDirectory := -503

/**
 * @type {Integer (Int32)}
 */
export global JET_errBackupDirectoryNotEmpty := -504

/**
 * @type {Integer (Int32)}
 */
export global JET_errBackupInProgress := -505

/**
 * @type {Integer (Int32)}
 */
export global JET_errRestoreInProgress := -506

/**
 * @type {Integer (Int32)}
 */
export global JET_errMissingPreviousLogFile := -509

/**
 * @type {Integer (Int32)}
 */
export global JET_errLogWriteFail := -510

/**
 * @type {Integer (Int32)}
 */
export global JET_errLogDisabledDueToRecoveryFailure := -511

/**
 * @type {Integer (Int32)}
 */
export global JET_errCannotLogDuringRecoveryRedo := -512

/**
 * @type {Integer (Int32)}
 */
export global JET_errLogGenerationMismatch := -513

/**
 * @type {Integer (Int32)}
 */
export global JET_errBadLogVersion := -514

/**
 * @type {Integer (Int32)}
 */
export global JET_errInvalidLogSequence := -515

/**
 * @type {Integer (Int32)}
 */
export global JET_errLoggingDisabled := -516

/**
 * @type {Integer (Int32)}
 */
export global JET_errLogBufferTooSmall := -517

/**
 * @type {Integer (Int32)}
 */
export global JET_errLogSequenceEnd := -519

/**
 * @type {Integer (Int32)}
 */
export global JET_errNoBackup := -520

/**
 * @type {Integer (Int32)}
 */
export global JET_errInvalidBackupSequence := -521

/**
 * @type {Integer (Int32)}
 */
export global JET_errBackupNotAllowedYet := -523

/**
 * @type {Integer (Int32)}
 */
export global JET_errDeleteBackupFileFail := -524

/**
 * @type {Integer (Int32)}
 */
export global JET_errMakeBackupDirectoryFail := -525

/**
 * @type {Integer (Int32)}
 */
export global JET_errInvalidBackup := -526

/**
 * @type {Integer (Int32)}
 */
export global JET_errRecoveredWithErrors := -527

/**
 * @type {Integer (Int32)}
 */
export global JET_errMissingLogFile := -528

/**
 * @type {Integer (Int32)}
 */
export global JET_errLogDiskFull := -529

/**
 * @type {Integer (Int32)}
 */
export global JET_errBadLogSignature := -530

/**
 * @type {Integer (Int32)}
 */
export global JET_errBadDbSignature := -531

/**
 * @type {Integer (Int32)}
 */
export global JET_errBadCheckpointSignature := -532

/**
 * @type {Integer (Int32)}
 */
export global JET_errCheckpointCorrupt := -533

/**
 * @type {Integer (Int32)}
 */
export global JET_errMissingPatchPage := -534

/**
 * @type {Integer (Int32)}
 */
export global JET_errBadPatchPage := -535

/**
 * @type {Integer (Int32)}
 */
export global JET_errRedoAbruptEnded := -536

/**
 * @type {Integer (Int32)}
 */
export global JET_errPatchFileMissing := -538

/**
 * @type {Integer (Int32)}
 */
export global JET_errDatabaseLogSetMismatch := -539

/**
 * @type {Integer (Int32)}
 */
export global JET_errDatabaseStreamingFileMismatch := -540

/**
 * @type {Integer (Int32)}
 */
export global JET_errLogFileSizeMismatch := -541

/**
 * @type {Integer (Int32)}
 */
export global JET_errCheckpointFileNotFound := -542

/**
 * @type {Integer (Int32)}
 */
export global JET_errRequiredLogFilesMissing := -543

/**
 * @type {Integer (Int32)}
 */
export global JET_errSoftRecoveryOnBackupDatabase := -544

/**
 * @type {Integer (Int32)}
 */
export global JET_errLogFileSizeMismatchDatabasesConsistent := -545

/**
 * @type {Integer (Int32)}
 */
export global JET_errLogSectorSizeMismatch := -546

/**
 * @type {Integer (Int32)}
 */
export global JET_errLogSectorSizeMismatchDatabasesConsistent := -547

/**
 * @type {Integer (Int32)}
 */
export global JET_errLogSequenceEndDatabasesConsistent := -548

/**
 * @type {Integer (Int32)}
 */
export global JET_errStreamingDataNotLogged := -549

/**
 * @type {Integer (Int32)}
 */
export global JET_errDatabaseDirtyShutdown := -550

/**
 * @type {Integer (Int32)}
 */
export global JET_errDatabaseInconsistent := -550

/**
 * @type {Integer (Int32)}
 */
export global JET_errConsistentTimeMismatch := -551

/**
 * @type {Integer (Int32)}
 */
export global JET_errDatabasePatchFileMismatch := -552

/**
 * @type {Integer (Int32)}
 */
export global JET_errEndingRestoreLogTooLow := -553

/**
 * @type {Integer (Int32)}
 */
export global JET_errStartingRestoreLogTooHigh := -554

/**
 * @type {Integer (Int32)}
 */
export global JET_errGivenLogFileHasBadSignature := -555

/**
 * @type {Integer (Int32)}
 */
export global JET_errGivenLogFileIsNotContiguous := -556

/**
 * @type {Integer (Int32)}
 */
export global JET_errMissingRestoreLogFiles := -557

/**
 * @type {Integer (UInt32)}
 */
export global JET_wrnExistingLogFileHasBadSignature := 558

/**
 * @type {Integer (UInt32)}
 */
export global JET_wrnExistingLogFileIsNotContiguous := 559

/**
 * @type {Integer (Int32)}
 */
export global JET_errMissingFullBackup := -560

/**
 * @type {Integer (Int32)}
 */
export global JET_errBadBackupDatabaseSize := -561

/**
 * @type {Integer (Int32)}
 */
export global JET_errDatabaseAlreadyUpgraded := -562

/**
 * @type {Integer (Int32)}
 */
export global JET_errDatabaseIncompleteUpgrade := -563

/**
 * @type {Integer (UInt32)}
 */
export global JET_wrnSkipThisRecord := 564

/**
 * @type {Integer (Int32)}
 */
export global JET_errMissingCurrentLogFiles := -565

/**
 * @type {Integer (Int32)}
 */
export global JET_errDbTimeTooOld := -566

/**
 * @type {Integer (Int32)}
 */
export global JET_errDbTimeTooNew := -567

/**
 * @type {Integer (Int32)}
 */
export global JET_errMissingFileToBackup := -569

/**
 * @type {Integer (Int32)}
 */
export global JET_errLogTornWriteDuringHardRestore := -570

/**
 * @type {Integer (Int32)}
 */
export global JET_errLogTornWriteDuringHardRecovery := -571

/**
 * @type {Integer (Int32)}
 */
export global JET_errLogCorruptDuringHardRestore := -573

/**
 * @type {Integer (Int32)}
 */
export global JET_errLogCorruptDuringHardRecovery := -574

/**
 * @type {Integer (Int32)}
 */
export global JET_errMustDisableLoggingForDbUpgrade := -575

/**
 * @type {Integer (Int32)}
 */
export global JET_errBadRestoreTargetInstance := -577

/**
 * @type {Integer (UInt32)}
 */
export global JET_wrnTargetInstanceRunning := 578

/**
 * @type {Integer (Int32)}
 */
export global JET_errRecoveredWithoutUndo := -579

/**
 * @type {Integer (Int32)}
 */
export global JET_errDatabasesNotFromSameSnapshot := -580

/**
 * @type {Integer (Int32)}
 */
export global JET_errSoftRecoveryOnSnapshot := -581

/**
 * @type {Integer (Int32)}
 */
export global JET_errCommittedLogFilesMissing := -582

/**
 * @type {Integer (Int32)}
 */
export global JET_errSectorSizeNotSupported := -583

/**
 * @type {Integer (Int32)}
 */
export global JET_errRecoveredWithoutUndoDatabasesConsistent := -584

/**
 * @type {Integer (UInt32)}
 */
export global JET_wrnCommittedLogFilesLost := 585

/**
 * @type {Integer (Int32)}
 */
export global JET_errCommittedLogFileCorrupt := -586

/**
 * @type {Integer (UInt32)}
 */
export global JET_wrnCommittedLogFilesRemoved := 587

/**
 * @type {Integer (UInt32)}
 */
export global JET_wrnFinishWithUndo := 588

/**
 * @type {Integer (Int32)}
 */
export global JET_errLogSequenceChecksumMismatch := -590

/**
 * @type {Integer (UInt32)}
 */
export global JET_wrnDatabaseRepaired := 595

/**
 * @type {Integer (Int32)}
 */
export global JET_errPageInitializedMismatch := -596

/**
 * @type {Integer (Int32)}
 */
export global JET_errUnicodeTranslationBufferTooSmall := -601

/**
 * @type {Integer (Int32)}
 */
export global JET_errUnicodeTranslationFail := -602

/**
 * @type {Integer (Int32)}
 */
export global JET_errUnicodeNormalizationNotSupported := -603

/**
 * @type {Integer (Int32)}
 */
export global JET_errUnicodeLanguageValidationFailure := -604

/**
 * @type {Integer (Int32)}
 */
export global JET_errExistingLogFileHasBadSignature := -610

/**
 * @type {Integer (Int32)}
 */
export global JET_errExistingLogFileIsNotContiguous := -611

/**
 * @type {Integer (Int32)}
 */
export global JET_errLogReadVerifyFailure := -612

/**
 * @type {Integer (Int32)}
 */
export global JET_errCheckpointDepthTooDeep := -614

/**
 * @type {Integer (Int32)}
 */
export global JET_errRestoreOfNonBackupDatabase := -615

/**
 * @type {Integer (Int32)}
 */
export global JET_errLogFileNotCopied := -616

/**
 * @type {Integer (Int32)}
 */
export global JET_errTransactionTooLong := -618

/**
 * @type {Integer (Int32)}
 */
export global JET_errEngineFormatVersionNoLongerSupportedTooLow := -619

/**
 * @type {Integer (Int32)}
 */
export global JET_errEngineFormatVersionNotYetImplementedTooHigh := -620

/**
 * @type {Integer (Int32)}
 */
export global JET_errEngineFormatVersionParamTooLowForRequestedFeature := -621

/**
 * @type {Integer (Int32)}
 */
export global JET_errEngineFormatVersionSpecifiedTooLowForLogVersion := -622

/**
 * @type {Integer (Int32)}
 */
export global JET_errEngineFormatVersionSpecifiedTooLowForDatabaseVersion := -623

/**
 * @type {Integer (Int32)}
 */
export global JET_errDbTimeBeyondMaxRequired := -625

/**
 * @type {Integer (Int32)}
 */
export global JET_errLogOperationInconsistentWithDatabase := -626

/**
 * @type {Integer (Int32)}
 */
export global JET_errInsertKeyOutOfOrder := -627

/**
 * @type {Integer (Int32)}
 */
export global JET_errBackupAbortByServer := -801

/**
 * @type {Integer (Int32)}
 */
export global JET_errInvalidGrbit := -900

/**
 * @type {Integer (Int32)}
 */
export global JET_errTermInProgress := -1000

/**
 * @type {Integer (Int32)}
 */
export global JET_errFeatureNotAvailable := -1001

/**
 * @type {Integer (Int32)}
 */
export global JET_errInvalidName := -1002

/**
 * @type {Integer (Int32)}
 */
export global JET_errInvalidParameter := -1003

/**
 * @type {Integer (UInt32)}
 */
export global JET_wrnColumnNull := 1004

/**
 * @type {Integer (UInt32)}
 */
export global JET_wrnBufferTruncated := 1006

/**
 * @type {Integer (UInt32)}
 */
export global JET_wrnDatabaseAttached := 1007

/**
 * @type {Integer (Int32)}
 */
export global JET_errDatabaseFileReadOnly := -1008

/**
 * @type {Integer (UInt32)}
 */
export global JET_wrnSortOverflow := 1009

/**
 * @type {Integer (Int32)}
 */
export global JET_errInvalidDatabaseId := -1010

/**
 * @type {Integer (Int32)}
 */
export global JET_errOutOfMemory := -1011

/**
 * @type {Integer (Int32)}
 */
export global JET_errOutOfDatabaseSpace := -1012

/**
 * @type {Integer (Int32)}
 */
export global JET_errOutOfCursors := -1013

/**
 * @type {Integer (Int32)}
 */
export global JET_errOutOfBuffers := -1014

/**
 * @type {Integer (Int32)}
 */
export global JET_errTooManyIndexes := -1015

/**
 * @type {Integer (Int32)}
 */
export global JET_errTooManyKeys := -1016

/**
 * @type {Integer (Int32)}
 */
export global JET_errRecordDeleted := -1017

/**
 * @type {Integer (Int32)}
 */
export global JET_errReadVerifyFailure := -1018

/**
 * @type {Integer (Int32)}
 */
export global JET_errPageNotInitialized := -1019

/**
 * @type {Integer (Int32)}
 */
export global JET_errOutOfFileHandles := -1020

/**
 * @type {Integer (Int32)}
 */
export global JET_errDiskReadVerificationFailure := -1021

/**
 * @type {Integer (Int32)}
 */
export global JET_errDiskIO := -1022

/**
 * @type {Integer (Int32)}
 */
export global JET_errInvalidPath := -1023

/**
 * @type {Integer (Int32)}
 */
export global JET_errInvalidSystemPath := -1024

/**
 * @type {Integer (Int32)}
 */
export global JET_errInvalidLogDirectory := -1025

/**
 * @type {Integer (Int32)}
 */
export global JET_errRecordTooBig := -1026

/**
 * @type {Integer (Int32)}
 */
export global JET_errTooManyOpenDatabases := -1027

/**
 * @type {Integer (Int32)}
 */
export global JET_errInvalidDatabase := -1028

/**
 * @type {Integer (Int32)}
 */
export global JET_errNotInitialized := -1029

/**
 * @type {Integer (Int32)}
 */
export global JET_errAlreadyInitialized := -1030

/**
 * @type {Integer (Int32)}
 */
export global JET_errInitInProgress := -1031

/**
 * @type {Integer (Int32)}
 */
export global JET_errFileAccessDenied := -1032

/**
 * @type {Integer (Int32)}
 */
export global JET_errBufferTooSmall := -1038

/**
 * @type {Integer (UInt32)}
 */
export global JET_wrnSeekNotEqual := 1039

/**
 * @type {Integer (Int32)}
 */
export global JET_errTooManyColumns := -1040

/**
 * @type {Integer (Int32)}
 */
export global JET_errContainerNotEmpty := -1043

/**
 * @type {Integer (Int32)}
 */
export global JET_errInvalidFilename := -1044

/**
 * @type {Integer (Int32)}
 */
export global JET_errInvalidBookmark := -1045

/**
 * @type {Integer (Int32)}
 */
export global JET_errColumnInUse := -1046

/**
 * @type {Integer (Int32)}
 */
export global JET_errInvalidBufferSize := -1047

/**
 * @type {Integer (Int32)}
 */
export global JET_errColumnNotUpdatable := -1048

/**
 * @type {Integer (Int32)}
 */
export global JET_errIndexInUse := -1051

/**
 * @type {Integer (Int32)}
 */
export global JET_errLinkNotSupported := -1052

/**
 * @type {Integer (Int32)}
 */
export global JET_errNullKeyDisallowed := -1053

/**
 * @type {Integer (Int32)}
 */
export global JET_errNotInTransaction := -1054

/**
 * @type {Integer (UInt32)}
 */
export global JET_wrnNoErrorInfo := 1055

/**
 * @type {Integer (Int32)}
 */
export global JET_errMustRollback := -1057

/**
 * @type {Integer (UInt32)}
 */
export global JET_wrnNoIdleActivity := 1058

/**
 * @type {Integer (Int32)}
 */
export global JET_errTooManyActiveUsers := -1059

/**
 * @type {Integer (Int32)}
 */
export global JET_errInvalidCountry := -1061

/**
 * @type {Integer (Int32)}
 */
export global JET_errInvalidLanguageId := -1062

/**
 * @type {Integer (Int32)}
 */
export global JET_errInvalidCodePage := -1063

/**
 * @type {Integer (Int32)}
 */
export global JET_errInvalidLCMapStringFlags := -1064

/**
 * @type {Integer (Int32)}
 */
export global JET_errVersionStoreEntryTooBig := -1065

/**
 * @type {Integer (Int32)}
 */
export global JET_errVersionStoreOutOfMemoryAndCleanupTimedOut := -1066

/**
 * @type {Integer (UInt32)}
 */
export global JET_wrnNoWriteLock := 1067

/**
 * @type {Integer (UInt32)}
 */
export global JET_wrnColumnSetNull := 1068

/**
 * @type {Integer (Int32)}
 */
export global JET_errVersionStoreOutOfMemory := -1069

/**
 * @type {Integer (Int32)}
 */
export global JET_errCannotIndex := -1071

/**
 * @type {Integer (Int32)}
 */
export global JET_errRecordNotDeleted := -1072

/**
 * @type {Integer (Int32)}
 */
export global JET_errTooManyMempoolEntries := -1073

/**
 * @type {Integer (Int32)}
 */
export global JET_errOutOfObjectIDs := -1074

/**
 * @type {Integer (Int32)}
 */
export global JET_errOutOfLongValueIDs := -1075

/**
 * @type {Integer (Int32)}
 */
export global JET_errOutOfAutoincrementValues := -1076

/**
 * @type {Integer (Int32)}
 */
export global JET_errOutOfDbtimeValues := -1077

/**
 * @type {Integer (Int32)}
 */
export global JET_errOutOfSequentialIndexValues := -1078

/**
 * @type {Integer (Int32)}
 */
export global JET_errRunningInOneInstanceMode := -1080

/**
 * @type {Integer (Int32)}
 */
export global JET_errRunningInMultiInstanceMode := -1081

/**
 * @type {Integer (Int32)}
 */
export global JET_errSystemParamsAlreadySet := -1082

/**
 * @type {Integer (Int32)}
 */
export global JET_errSystemPathInUse := -1083

/**
 * @type {Integer (Int32)}
 */
export global JET_errLogFilePathInUse := -1084

/**
 * @type {Integer (Int32)}
 */
export global JET_errTempPathInUse := -1085

/**
 * @type {Integer (Int32)}
 */
export global JET_errInstanceNameInUse := -1086

/**
 * @type {Integer (Int32)}
 */
export global JET_errSystemParameterConflict := -1087

/**
 * @type {Integer (Int32)}
 */
export global JET_errInstanceUnavailable := -1090

/**
 * @type {Integer (Int32)}
 */
export global JET_errDatabaseUnavailable := -1091

/**
 * @type {Integer (Int32)}
 */
export global JET_errInstanceUnavailableDueToFatalLogDiskFull := -1092

/**
 * @type {Integer (Int32)}
 */
export global JET_errInvalidSesparamId := -1093

/**
 * @type {Integer (Int32)}
 */
export global JET_errTooManyRecords := -1094

/**
 * @type {Integer (Int32)}
 */
export global JET_errInvalidDbparamId := -1095

/**
 * @type {Integer (Int32)}
 */
export global JET_errOutOfSessions := -1101

/**
 * @type {Integer (Int32)}
 */
export global JET_errWriteConflict := -1102

/**
 * @type {Integer (Int32)}
 */
export global JET_errTransTooDeep := -1103

/**
 * @type {Integer (Int32)}
 */
export global JET_errInvalidSesid := -1104

/**
 * @type {Integer (Int32)}
 */
export global JET_errWriteConflictPrimaryIndex := -1105

/**
 * @type {Integer (Int32)}
 */
export global JET_errInTransaction := -1108

/**
 * @type {Integer (Int32)}
 */
export global JET_errRollbackRequired := -1109

/**
 * @type {Integer (Int32)}
 */
export global JET_errTransReadOnly := -1110

/**
 * @type {Integer (Int32)}
 */
export global JET_errSessionWriteConflict := -1111

/**
 * @type {Integer (Int32)}
 */
export global JET_errRecordTooBigForBackwardCompatibility := -1112

/**
 * @type {Integer (Int32)}
 */
export global JET_errCannotMaterializeForwardOnlySort := -1113

/**
 * @type {Integer (Int32)}
 */
export global JET_errSesidTableIdMismatch := -1114

/**
 * @type {Integer (Int32)}
 */
export global JET_errInvalidInstance := -1115

/**
 * @type {Integer (Int32)}
 */
export global JET_errDirtyShutdown := -1116

/**
 * @type {Integer (Int32)}
 */
export global JET_errReadPgnoVerifyFailure := -1118

/**
 * @type {Integer (Int32)}
 */
export global JET_errReadLostFlushVerifyFailure := -1119

/**
 * @type {Integer (Int32)}
 */
export global JET_errFileSystemCorruption := -1121

/**
 * @type {Integer (UInt32)}
 */
export global JET_wrnShrinkNotPossible := 1122

/**
 * @type {Integer (Int32)}
 */
export global JET_errRecoveryVerifyFailure := -1123

/**
 * @type {Integer (Int32)}
 */
export global JET_errFilteredMoveNotSupported := -1124

/**
 * @type {Integer (Int32)}
 */
export global JET_errDatabaseDuplicate := -1201

/**
 * @type {Integer (Int32)}
 */
export global JET_errDatabaseInUse := -1202

/**
 * @type {Integer (Int32)}
 */
export global JET_errDatabaseNotFound := -1203

/**
 * @type {Integer (Int32)}
 */
export global JET_errDatabaseInvalidName := -1204

/**
 * @type {Integer (Int32)}
 */
export global JET_errDatabaseInvalidPages := -1205

/**
 * @type {Integer (Int32)}
 */
export global JET_errDatabaseCorrupted := -1206

/**
 * @type {Integer (Int32)}
 */
export global JET_errDatabaseLocked := -1207

/**
 * @type {Integer (Int32)}
 */
export global JET_errCannotDisableVersioning := -1208

/**
 * @type {Integer (Int32)}
 */
export global JET_errInvalidDatabaseVersion := -1209

/**
 * @type {Integer (Int32)}
 */
export global JET_errDatabase200Format := -1210

/**
 * @type {Integer (Int32)}
 */
export global JET_errDatabase400Format := -1211

/**
 * @type {Integer (Int32)}
 */
export global JET_errDatabase500Format := -1212

/**
 * @type {Integer (Int32)}
 */
export global JET_errPageSizeMismatch := -1213

/**
 * @type {Integer (Int32)}
 */
export global JET_errTooManyInstances := -1214

/**
 * @type {Integer (Int32)}
 */
export global JET_errDatabaseSharingViolation := -1215

/**
 * @type {Integer (Int32)}
 */
export global JET_errAttachedDatabaseMismatch := -1216

/**
 * @type {Integer (Int32)}
 */
export global JET_errDatabaseInvalidPath := -1217

/**
 * @type {Integer (Int32)}
 */
export global JET_errDatabaseIdInUse := -1218

/**
 * @type {Integer (Int32)}
 */
export global JET_errForceDetachNotAllowed := -1219

/**
 * @type {Integer (Int32)}
 */
export global JET_errCatalogCorrupted := -1220

/**
 * @type {Integer (Int32)}
 */
export global JET_errPartiallyAttachedDB := -1221

/**
 * @type {Integer (Int32)}
 */
export global JET_errDatabaseSignInUse := -1222

/**
 * @type {Integer (Int32)}
 */
export global JET_errDatabaseCorruptedNoRepair := -1224

/**
 * @type {Integer (Int32)}
 */
export global JET_errInvalidCreateDbVersion := -1225

/**
 * @type {Integer (Int32)}
 */
export global JET_errDatabaseNotReady := -1230

/**
 * @type {Integer (Int32)}
 */
export global JET_errDatabaseAttachedForRecovery := -1231

/**
 * @type {Integer (Int32)}
 */
export global JET_errTransactionsNotReadyDuringRecovery := -1232

/**
 * @type {Integer (UInt32)}
 */
export global JET_wrnTableEmpty := 1301

/**
 * @type {Integer (Int32)}
 */
export global JET_errTableLocked := -1302

/**
 * @type {Integer (Int32)}
 */
export global JET_errTableDuplicate := -1303

/**
 * @type {Integer (Int32)}
 */
export global JET_errTableInUse := -1304

/**
 * @type {Integer (Int32)}
 */
export global JET_errObjectNotFound := -1305

/**
 * @type {Integer (Int32)}
 */
export global JET_errDensityInvalid := -1307

/**
 * @type {Integer (Int32)}
 */
export global JET_errTableNotEmpty := -1308

/**
 * @type {Integer (Int32)}
 */
export global JET_errInvalidTableId := -1310

/**
 * @type {Integer (Int32)}
 */
export global JET_errTooManyOpenTables := -1311

/**
 * @type {Integer (Int32)}
 */
export global JET_errIllegalOperation := -1312

/**
 * @type {Integer (Int32)}
 */
export global JET_errTooManyOpenTablesAndCleanupTimedOut := -1313

/**
 * @type {Integer (Int32)}
 */
export global JET_errObjectDuplicate := -1314

/**
 * @type {Integer (Int32)}
 */
export global JET_errInvalidObject := -1316

/**
 * @type {Integer (Int32)}
 */
export global JET_errCannotDeleteTempTable := -1317

/**
 * @type {Integer (Int32)}
 */
export global JET_errCannotDeleteSystemTable := -1318

/**
 * @type {Integer (Int32)}
 */
export global JET_errCannotDeleteTemplateTable := -1319

/**
 * @type {Integer (Int32)}
 */
export global JET_errExclusiveTableLockRequired := -1322

/**
 * @type {Integer (Int32)}
 */
export global JET_errFixedDDL := -1323

/**
 * @type {Integer (Int32)}
 */
export global JET_errFixedInheritedDDL := -1324

/**
 * @type {Integer (Int32)}
 */
export global JET_errCannotNestDDL := -1325

/**
 * @type {Integer (Int32)}
 */
export global JET_errDDLNotInheritable := -1326

/**
 * @type {Integer (UInt32)}
 */
export global JET_wrnTableInUseBySystem := 1327

/**
 * @type {Integer (Int32)}
 */
export global JET_errInvalidSettings := -1328

/**
 * @type {Integer (Int32)}
 */
export global JET_errClientRequestToStopJetService := -1329

/**
 * @type {Integer (Int32)}
 */
export global JET_errCannotAddFixedVarColumnToDerivedTable := -1330

/**
 * @type {Integer (Int32)}
 */
export global JET_errIndexCantBuild := -1401

/**
 * @type {Integer (Int32)}
 */
export global JET_errIndexHasPrimary := -1402

/**
 * @type {Integer (Int32)}
 */
export global JET_errIndexDuplicate := -1403

/**
 * @type {Integer (Int32)}
 */
export global JET_errIndexNotFound := -1404

/**
 * @type {Integer (Int32)}
 */
export global JET_errIndexMustStay := -1405

/**
 * @type {Integer (Int32)}
 */
export global JET_errIndexInvalidDef := -1406

/**
 * @type {Integer (Int32)}
 */
export global JET_errInvalidCreateIndex := -1409

/**
 * @type {Integer (Int32)}
 */
export global JET_errTooManyOpenIndexes := -1410

/**
 * @type {Integer (Int32)}
 */
export global JET_errMultiValuedIndexViolation := -1411

/**
 * @type {Integer (Int32)}
 */
export global JET_errIndexBuildCorrupted := -1412

/**
 * @type {Integer (Int32)}
 */
export global JET_errPrimaryIndexCorrupted := -1413

/**
 * @type {Integer (Int32)}
 */
export global JET_errSecondaryIndexCorrupted := -1414

/**
 * @type {Integer (UInt32)}
 */
export global JET_wrnCorruptIndexDeleted := 1415

/**
 * @type {Integer (Int32)}
 */
export global JET_errInvalidIndexId := -1416

/**
 * @type {Integer (UInt32)}
 */
export global JET_wrnPrimaryIndexOutOfDate := 1417

/**
 * @type {Integer (UInt32)}
 */
export global JET_wrnSecondaryIndexOutOfDate := 1418

/**
 * @type {Integer (Int32)}
 */
export global JET_errIndexTuplesSecondaryIndexOnly := -1430

/**
 * @type {Integer (Int32)}
 */
export global JET_errIndexTuplesTooManyColumns := -1431

/**
 * @type {Integer (Int32)}
 */
export global JET_errIndexTuplesOneColumnOnly := -1431

/**
 * @type {Integer (Int32)}
 */
export global JET_errIndexTuplesNonUniqueOnly := -1432

/**
 * @type {Integer (Int32)}
 */
export global JET_errIndexTuplesTextBinaryColumnsOnly := -1433

/**
 * @type {Integer (Int32)}
 */
export global JET_errIndexTuplesTextColumnsOnly := -1433

/**
 * @type {Integer (Int32)}
 */
export global JET_errIndexTuplesVarSegMacNotAllowed := -1434

/**
 * @type {Integer (Int32)}
 */
export global JET_errIndexTuplesInvalidLimits := -1435

/**
 * @type {Integer (Int32)}
 */
export global JET_errIndexTuplesCannotRetrieveFromIndex := -1436

/**
 * @type {Integer (Int32)}
 */
export global JET_errIndexTuplesKeyTooSmall := -1437

/**
 * @type {Integer (Int32)}
 */
export global JET_errInvalidLVChunkSize := -1438

/**
 * @type {Integer (Int32)}
 */
export global JET_errColumnCannotBeEncrypted := -1439

/**
 * @type {Integer (Int32)}
 */
export global JET_errCannotIndexOnEncryptedColumn := -1440

/**
 * @type {Integer (Int32)}
 */
export global JET_errColumnLong := -1501

/**
 * @type {Integer (Int32)}
 */
export global JET_errColumnNoChunk := -1502

/**
 * @type {Integer (Int32)}
 */
export global JET_errColumnDoesNotFit := -1503

/**
 * @type {Integer (Int32)}
 */
export global JET_errNullInvalid := -1504

/**
 * @type {Integer (Int32)}
 */
export global JET_errColumnIndexed := -1505

/**
 * @type {Integer (Int32)}
 */
export global JET_errColumnTooBig := -1506

/**
 * @type {Integer (Int32)}
 */
export global JET_errColumnNotFound := -1507

/**
 * @type {Integer (Int32)}
 */
export global JET_errColumnDuplicate := -1508

/**
 * @type {Integer (Int32)}
 */
export global JET_errMultiValuedColumnMustBeTagged := -1509

/**
 * @type {Integer (Int32)}
 */
export global JET_errColumnRedundant := -1510

/**
 * @type {Integer (Int32)}
 */
export global JET_errInvalidColumnType := -1511

/**
 * @type {Integer (UInt32)}
 */
export global JET_wrnColumnMaxTruncated := 1512

/**
 * @type {Integer (Int32)}
 */
export global JET_errTaggedNotNULL := -1514

/**
 * @type {Integer (Int32)}
 */
export global JET_errNoCurrentIndex := -1515

/**
 * @type {Integer (Int32)}
 */
export global JET_errKeyIsMade := -1516

/**
 * @type {Integer (Int32)}
 */
export global JET_errBadColumnId := -1517

/**
 * @type {Integer (Int32)}
 */
export global JET_errBadItagSequence := -1518

/**
 * @type {Integer (Int32)}
 */
export global JET_errColumnInRelationship := -1519

/**
 * @type {Integer (UInt32)}
 */
export global JET_wrnCopyLongValue := 1520

/**
 * @type {Integer (Int32)}
 */
export global JET_errCannotBeTagged := -1521

/**
 * @type {Integer (Int32)}
 */
export global JET_errDefaultValueTooBig := -1524

/**
 * @type {Integer (Int32)}
 */
export global JET_errMultiValuedDuplicate := -1525

/**
 * @type {Integer (Int32)}
 */
export global JET_errLVCorrupted := -1526

/**
 * @type {Integer (Int32)}
 */
export global JET_errMultiValuedDuplicateAfterTruncation := -1528

/**
 * @type {Integer (Int32)}
 */
export global JET_errDerivedColumnCorruption := -1529

/**
 * @type {Integer (Int32)}
 */
export global JET_errInvalidPlaceholderColumn := -1530

/**
 * @type {Integer (UInt32)}
 */
export global JET_wrnColumnSkipped := 1531

/**
 * @type {Integer (UInt32)}
 */
export global JET_wrnColumnNotLocal := 1532

/**
 * @type {Integer (UInt32)}
 */
export global JET_wrnColumnMoreTags := 1533

/**
 * @type {Integer (UInt32)}
 */
export global JET_wrnColumnTruncated := 1534

/**
 * @type {Integer (UInt32)}
 */
export global JET_wrnColumnPresent := 1535

/**
 * @type {Integer (UInt32)}
 */
export global JET_wrnColumnSingleValue := 1536

/**
 * @type {Integer (UInt32)}
 */
export global JET_wrnColumnDefault := 1537

/**
 * @type {Integer (Int32)}
 */
export global JET_errColumnCannotBeCompressed := -1538

/**
 * @type {Integer (UInt32)}
 */
export global JET_wrnColumnNotInRecord := 1539

/**
 * @type {Integer (Int32)}
 */
export global JET_errColumnNoEncryptionKey := -1540

/**
 * @type {Integer (UInt32)}
 */
export global JET_wrnColumnReference := 1541

/**
 * @type {Integer (Int32)}
 */
export global JET_errRecordNotFound := -1601

/**
 * @type {Integer (Int32)}
 */
export global JET_errRecordNoCopy := -1602

/**
 * @type {Integer (Int32)}
 */
export global JET_errNoCurrentRecord := -1603

/**
 * @type {Integer (Int32)}
 */
export global JET_errRecordPrimaryChanged := -1604

/**
 * @type {Integer (Int32)}
 */
export global JET_errKeyDuplicate := -1605

/**
 * @type {Integer (Int32)}
 */
export global JET_errAlreadyPrepared := -1607

/**
 * @type {Integer (Int32)}
 */
export global JET_errKeyNotMade := -1608

/**
 * @type {Integer (Int32)}
 */
export global JET_errUpdateNotPrepared := -1609

/**
 * @type {Integer (UInt32)}
 */
export global JET_wrnDataHasChanged := 1610

/**
 * @type {Integer (Int32)}
 */
export global JET_errDataHasChanged := -1611

/**
 * @type {Integer (UInt32)}
 */
export global JET_wrnKeyChanged := 1618

/**
 * @type {Integer (Int32)}
 */
export global JET_errLanguageNotSupported := -1619

/**
 * @type {Integer (Int32)}
 */
export global JET_errDecompressionFailed := -1620

/**
 * @type {Integer (Int32)}
 */
export global JET_errUpdateMustVersion := -1621

/**
 * @type {Integer (Int32)}
 */
export global JET_errDecryptionFailed := -1622

/**
 * @type {Integer (Int32)}
 */
export global JET_errEncryptionBadItag := -1623

/**
 * @type {Integer (Int32)}
 */
export global JET_errSetAutoIncrementTooHigh := -1624

/**
 * @type {Integer (Int32)}
 */
export global JET_errAutoIncrementNotSet := -1625

/**
 * @type {Integer (Int32)}
 */
export global JET_errTooManySorts := -1701

/**
 * @type {Integer (Int32)}
 */
export global JET_errInvalidOnSort := -1702

/**
 * @type {Integer (Int32)}
 */
export global JET_errTempFileOpenError := -1803

/**
 * @type {Integer (Int32)}
 */
export global JET_errTooManyAttachedDatabases := -1805

/**
 * @type {Integer (Int32)}
 */
export global JET_errDiskFull := -1808

/**
 * @type {Integer (Int32)}
 */
export global JET_errPermissionDenied := -1809

/**
 * @type {Integer (Int32)}
 */
export global JET_errFileNotFound := -1811

/**
 * @type {Integer (Int32)}
 */
export global JET_errFileInvalidType := -1812

/**
 * @type {Integer (UInt32)}
 */
export global JET_wrnFileOpenReadOnly := 1813

/**
 * @type {Integer (Int32)}
 */
export global JET_errFileAlreadyExists := -1814

/**
 * @type {Integer (Int32)}
 */
export global JET_errAfterInitialization := -1850

/**
 * @type {Integer (Int32)}
 */
export global JET_errLogCorrupted := -1852

/**
 * @type {Integer (Int32)}
 */
export global JET_errInvalidOperation := -1906

/**
 * @type {Integer (Int32)}
 */
export global JET_errAccessDenied := -1907

/**
 * @type {Integer (UInt32)}
 */
export global JET_wrnIdleFull := 1908

/**
 * @type {Integer (Int32)}
 */
export global JET_errTooManySplits := -1909

/**
 * @type {Integer (Int32)}
 */
export global JET_errSessionSharingViolation := -1910

/**
 * @type {Integer (Int32)}
 */
export global JET_errEntryPointNotFound := -1911

/**
 * @type {Integer (Int32)}
 */
export global JET_errSessionContextAlreadySet := -1912

/**
 * @type {Integer (Int32)}
 */
export global JET_errSessionContextNotSetByThisThread := -1913

/**
 * @type {Integer (Int32)}
 */
export global JET_errSessionInUse := -1914

/**
 * @type {Integer (Int32)}
 */
export global JET_errRecordFormatConversionFailed := -1915

/**
 * @type {Integer (Int32)}
 */
export global JET_errOneDatabasePerSession := -1916

/**
 * @type {Integer (Int32)}
 */
export global JET_errRollbackError := -1917

/**
 * @type {Integer (Int32)}
 */
export global JET_errFlushMapVersionUnsupported := -1918

/**
 * @type {Integer (Int32)}
 */
export global JET_errFlushMapDatabaseMismatch := -1919

/**
 * @type {Integer (Int32)}
 */
export global JET_errFlushMapUnrecoverable := -1920

/**
 * @type {Integer (UInt32)}
 */
export global JET_wrnDefragAlreadyRunning := 2000

/**
 * @type {Integer (UInt32)}
 */
export global JET_wrnDefragNotRunning := 2001

/**
 * @type {Integer (Int32)}
 */
export global JET_errDatabaseAlreadyRunningMaintenance := -2004

/**
 * @type {Integer (UInt32)}
 */
export global JET_wrnCallbackNotRegistered := 2100

/**
 * @type {Integer (Int32)}
 */
export global JET_errCallbackFailed := -2101

/**
 * @type {Integer (Int32)}
 */
export global JET_errCallbackNotResolved := -2102

/**
 * @type {Integer (Int32)}
 */
export global JET_errSpaceHintsInvalid := -2103

/**
 * @type {Integer (Int32)}
 */
export global JET_errOSSnapshotInvalidSequence := -2401

/**
 * @type {Integer (Int32)}
 */
export global JET_errOSSnapshotTimeOut := -2402

/**
 * @type {Integer (Int32)}
 */
export global JET_errOSSnapshotNotAllowed := -2403

/**
 * @type {Integer (Int32)}
 */
export global JET_errOSSnapshotInvalidSnapId := -2404

/**
 * @type {Integer (Int32)}
 */
export global JET_errLSCallbackNotSpecified := -3000

/**
 * @type {Integer (Int32)}
 */
export global JET_errLSAlreadySet := -3001

/**
 * @type {Integer (Int32)}
 */
export global JET_errLSNotSet := -3002

/**
 * @type {Integer (Int32)}
 */
export global JET_errFileIOSparse := -4000

/**
 * @type {Integer (Int32)}
 */
export global JET_errFileIOBeyondEOF := -4001

/**
 * @type {Integer (Int32)}
 */
export global JET_errFileIOAbort := -4002

/**
 * @type {Integer (Int32)}
 */
export global JET_errFileIORetry := -4003

/**
 * @type {Integer (Int32)}
 */
export global JET_errFileIOFail := -4004

/**
 * @type {Integer (Int32)}
 */
export global JET_errFileCompressed := -4005

/**
 * @type {Integer (Int32)}
 */
export global JET_errClientSpaceBegin := -10000

/**
 * @type {Integer (Int32)}
 */
export global JET_errClientSpaceEnd := -11999

/**
 * @type {Integer (UInt32)}
 */
export global JET_BASE_NAME_LENGTH := 3

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitDumpMinimum := 1

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitDumpMaximum := 2

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitDumpCacheMinimum := 4

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitDumpCacheMaximum := 8

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitDumpCacheIncludeDirtyPages := 16

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitDumpCacheIncludeCachedPages := 32

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitDumpCacheIncludeCorruptedPages := 64

/**
 * @type {Integer (UInt32)}
 */
export global JET_bitDumpCacheNoDecommit := 128
;@endregion Constants

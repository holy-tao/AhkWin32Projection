#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_MAILBOX_COMMAND extends Win32Enum {

    /**
     * Native name: CxlMailboxCommand_Identify
     * @type {Integer (Int32)}
     */
    static Identify => 1

    /**
     * Native name: CxlMailboxCommand_BackgroundOperationStatus
     * @type {Integer (Int32)}
     */
    static BackgroundOperationStatus => 2

    /**
     * Native name: CxlMailboxCommand_GetResponseMessageLimit
     * @type {Integer (Int32)}
     */
    static GetResponseMessageLimit => 3

    /**
     * Native name: CxlMailboxCommand_SetResponseMessageLimit
     * @type {Integer (Int32)}
     */
    static SetResponseMessageLimit => 4

    /**
     * Native name: CxlMailboxCommand_RequestAbortBackgroundOperation
     * @type {Integer (Int32)}
     */
    static RequestAbortBackgroundOperation => 5

    /**
     * Native name: CxlMailboxCommand_GetEventRecords
     * @type {Integer (Int32)}
     */
    static GetEventRecords => 256

    /**
     * Native name: CxlMailboxCommand_ClearEventRecords
     * @type {Integer (Int32)}
     */
    static ClearEventRecords => 257

    /**
     * Native name: CxlMailboxCommand_GetEventInterruptPolicy
     * @type {Integer (Int32)}
     */
    static GetEventInterruptPolicy => 258

    /**
     * Native name: CxlMailboxCommand_SetEventInterruptPolicy
     * @type {Integer (Int32)}
     */
    static SetEventInterruptPolicy => 259

    /**
     * Native name: CxlMailboxCommand_GetMCTPEventInterruptPolicy
     * @type {Integer (Int32)}
     */
    static GetMCTPEventInterruptPolicy => 260

    /**
     * Native name: CxlMailboxCommand_SetMCTPEventInterruptPolicy
     * @type {Integer (Int32)}
     */
    static SetMCTPEventInterruptPolicy => 261

    /**
     * Native name: CxlMailboxCommand_EventNotification
     * @type {Integer (Int32)}
     */
    static EventNotification => 262

    /**
     * Native name: CxlMailboxCommand_GFDEnhancedEventNotification
     * @type {Integer (Int32)}
     */
    static GFDEnhancedEventNotification => 263

    /**
     * Native name: CxlMailboxCommand_GFDtoGAEEnhancedEventNotification
     * @type {Integer (Int32)}
     */
    static GFDtoGAEEnhancedEventNotification => 264

    /**
     * Native name: CxlMailboxCommand_GetGAMBuffer
     * @type {Integer (Int32)}
     */
    static GetGAMBuffer => 265

    /**
     * Native name: CxlMailboxCommand_SetGAMBuffer
     * @type {Integer (Int32)}
     */
    static SetGAMBuffer => 266

    /**
     * Native name: CxlMailboxCommand_GetFWInfo
     * @type {Integer (Int32)}
     */
    static GetFWInfo => 512

    /**
     * Native name: CxlMailboxCommand_TransferFW
     * @type {Integer (Int32)}
     */
    static TransferFW => 513

    /**
     * Native name: CxlMailboxCommand_ActivateFW
     * @type {Integer (Int32)}
     */
    static ActivateFW => 514

    /**
     * Native name: CxlMailboxCommand_GetTimestamp
     * @type {Integer (Int32)}
     */
    static GetTimestamp => 768

    /**
     * Native name: CxlMailboxCommand_SetTimestamp
     * @type {Integer (Int32)}
     */
    static SetTimestamp => 769

    /**
     * Native name: CxlMailboxCommand_GetSupportedLogs
     * @type {Integer (Int32)}
     */
    static GetSupportedLogs => 1024

    /**
     * Native name: CxlMailboxCommand_GetLog
     * @type {Integer (Int32)}
     */
    static GetLog => 1025

    /**
     * Native name: CxlMailboxCommand_GetLogCapabilities
     * @type {Integer (Int32)}
     */
    static GetLogCapabilities => 1026

    /**
     * Native name: CxlMailboxCommand_ClearLog
     * @type {Integer (Int32)}
     */
    static ClearLog => 1027

    /**
     * Native name: CxlMailboxCommand_PopulateLog
     * @type {Integer (Int32)}
     */
    static PopulateLog => 1028

    /**
     * Native name: CxlMailboxCommand_GetSupportedLogSubList
     * @type {Integer (Int32)}
     */
    static GetSupportedLogSubList => 1029

    /**
     * Native name: CxlMailboxCommand_GetSupportedFeatures
     * @type {Integer (Int32)}
     */
    static GetSupportedFeatures => 1280

    /**
     * Native name: CxlMailboxCommand_GetFeature
     * @type {Integer (Int32)}
     */
    static GetFeature => 1281

    /**
     * Native name: CxlMailboxCommand_SetFeature
     * @type {Integer (Int32)}
     */
    static SetFeature => 1282

    /**
     * Native name: CxlMailboxCommand_PerformMaintenance
     * @type {Integer (Int32)}
     */
    static PerformMaintenance => 1536

    /**
     * Native name: CxlMailboxCommand_IdentifyPBRComponent
     * @type {Integer (Int32)}
     */
    static IdentifyPBRComponent => 1792

    /**
     * Native name: CxlMailboxCommand_ClaimOwnership
     * @type {Integer (Int32)}
     */
    static ClaimOwnership => 1793

    /**
     * Native name: CxlMailboxCommand_ReadCDAT
     * @type {Integer (Int32)}
     */
    static ReadCDAT => 1794

    /**
     * Native name: CxlMailboxCommand_IdentifyMemoryDevice
     * @type {Integer (Int32)}
     */
    static IdentifyMemoryDevice => 16384

    /**
     * Native name: CxlMailboxCommand_GetPartitionInfo
     * @type {Integer (Int32)}
     */
    static GetPartitionInfo => 16640

    /**
     * Native name: CxlMailboxCommand_SetPartitionInfo
     * @type {Integer (Int32)}
     */
    static SetPartitionInfo => 16641

    /**
     * Native name: CxlMailboxCommand_GetLSA
     * @type {Integer (Int32)}
     */
    static GetLSA => 16642

    /**
     * Native name: CxlMailboxCommand_SetLSA
     * @type {Integer (Int32)}
     */
    static SetLSA => 16643

    /**
     * Native name: CxlMailboxCommand_GetHealthInfo
     * @type {Integer (Int32)}
     */
    static GetHealthInfo => 16896

    /**
     * Native name: CxlMailboxCommand_GetAlertConfiguration
     * @type {Integer (Int32)}
     */
    static GetAlertConfiguration => 16897

    /**
     * Native name: CxlMailboxCommand_SetAlertConfiguration
     * @type {Integer (Int32)}
     */
    static SetAlertConfiguration => 16898

    /**
     * Native name: CxlMailboxCommand_GetShutdownState
     * @type {Integer (Int32)}
     */
    static GetShutdownState => 16899

    /**
     * Native name: CxlMailboxCommand_SetShutdownState
     * @type {Integer (Int32)}
     */
    static SetShutdownState => 16900

    /**
     * Native name: CxlMailboxCommand_GetPoisonList
     * @type {Integer (Int32)}
     */
    static GetPoisonList => 17152

    /**
     * Native name: CxlMailboxCommand_InjectPoison
     * @type {Integer (Int32)}
     */
    static InjectPoison => 17153

    /**
     * Native name: CxlMailboxCommand_ClearPoison
     * @type {Integer (Int32)}
     */
    static ClearPoison => 17154

    /**
     * Native name: CxlMailboxCommand_GetScanMediaCapabilities
     * @type {Integer (Int32)}
     */
    static GetScanMediaCapabilities => 17155

    /**
     * Native name: CxlMailboxCommand_ScanMedia
     * @type {Integer (Int32)}
     */
    static ScanMedia => 17156

    /**
     * Native name: CxlMailboxCommand_GetScanMediaResults
     * @type {Integer (Int32)}
     */
    static GetScanMediaResults => 17157

    /**
     * Native name: CxlMailboxCommand_Sanitize
     * @type {Integer (Int32)}
     */
    static Sanitize => 17408

    /**
     * Native name: CxlMailboxCommand_SecureErase
     * @type {Integer (Int32)}
     */
    static SecureErase => 17409

    /**
     * Native name: CxlMailboxCommand_MediaOperations
     * @type {Integer (Int32)}
     */
    static MediaOperations => 17410

    /**
     * Native name: CxlMailboxCommand_GetSecurityState
     * @type {Integer (Int32)}
     */
    static GetSecurityState => 17664

    /**
     * Native name: CxlMailboxCommand_SetPassphrase
     * @type {Integer (Int32)}
     */
    static SetPassphrase => 17665

    /**
     * Native name: CxlMailboxCommand_DisablePassphrase
     * @type {Integer (Int32)}
     */
    static DisablePassphrase => 17666

    /**
     * Native name: CxlMailboxCommand_Unlock
     * @type {Integer (Int32)}
     */
    static Unlock => 17667

    /**
     * Native name: CxlMailboxCommand_FreezeSecurityState
     * @type {Integer (Int32)}
     */
    static FreezeSecurityState => 17668

    /**
     * Native name: CxlMailboxCommand_passphraseSecureErase
     * @type {Integer (Int32)}
     */
    static passphraseSecureErase => 17669

    /**
     * Native name: CxlMailboxCommand_SecuritySend
     * @type {Integer (Int32)}
     */
    static SecuritySend => 17920

    /**
     * Native name: CxlMailboxCommand_SecurityReceive
     * @type {Integer (Int32)}
     */
    static SecurityReceive => 17921

    /**
     * Native name: CxlMailboxCommand_GetSLDQoSControl
     * @type {Integer (Int32)}
     */
    static GetSLDQoSControl => 18176

    /**
     * Native name: CxlMailboxCommand_SetSLDQoSControl
     * @type {Integer (Int32)}
     */
    static SetSLDQoSControl => 18177

    /**
     * Native name: CxlMailboxCommand_GetSLDQoSStatus
     * @type {Integer (Int32)}
     */
    static GetSLDQoSStatus => 18178

    /**
     * Native name: CxlMailboxCommand_GetDynamicCapacityConfiguration
     * @type {Integer (Int32)}
     */
    static GetDynamicCapacityConfiguration => 18432

    /**
     * Native name: CxlMailboxCommand_GetDynamicCapacityExtentList
     * @type {Integer (Int32)}
     */
    static GetDynamicCapacityExtentList => 18433

    /**
     * Native name: CxlMailboxCommand_AddDynamicCapacityResponse
     * @type {Integer (Int32)}
     */
    static AddDynamicCapacityResponse => 18434

    /**
     * Native name: CxlMailboxCommand_ReleaseDynamicCapacity
     * @type {Integer (Int32)}
     */
    static ReleaseDynamicCapacity => 18435

    /**
     * Native name: CxlMailboxCommand_IdentifyGFD
     * @type {Integer (Int32)}
     */
    static IdentifyGFD => 18688

    /**
     * Native name: CxlMailboxCommand_GetGFDStatus
     * @type {Integer (Int32)}
     */
    static GetGFDStatus => 18689

    /**
     * Native name: CxlMailboxCommand_GetGFDDcRegionConfiguration
     * @type {Integer (Int32)}
     */
    static GetGFDDcRegionConfiguration => 18690

    /**
     * Native name: CxlMailboxCommand_SetGFDDcRegionConfiguration
     * @type {Integer (Int32)}
     */
    static SetGFDDcRegionConfiguration => 18691

    /**
     * Native name: CxlMailboxCommand_GetGFDDcRegionExtentLists
     * @type {Integer (Int32)}
     */
    static GetGFDDcRegionExtentLists => 18692

    /**
     * Native name: CxlMailboxCommand_GetGFDDmpConfiguration
     * @type {Integer (Int32)}
     */
    static GetGFDDmpConfiguration => 18693

    /**
     * Native name: CxlMailboxCommand_SetGFDDmpConfiguration
     * @type {Integer (Int32)}
     */
    static SetGFDDmpConfiguration => 18694

    /**
     * Native name: CxlMailboxCommand_GFDDynamicCapacityAdd
     * @type {Integer (Int32)}
     */
    static GFDDynamicCapacityAdd => 18695

    /**
     * Native name: CxlMailboxCommand_GFDDynamicCapacityRelease
     * @type {Integer (Int32)}
     */
    static GFDDynamicCapacityRelease => 18696

    /**
     * Native name: CxlMailboxCommand_GFDDynamicCapacityAddReference
     * @type {Integer (Int32)}
     */
    static GFDDynamicCapacityAddReference => 18697

    /**
     * Native name: CxlMailboxCommand_GFDDynamicCapacityRemoveReference
     * @type {Integer (Int32)}
     */
    static GFDDynamicCapacityRemoveReference => 18698

    /**
     * Native name: CxlMailboxCommand_GFDDynamicCapacityListTags
     * @type {Integer (Int32)}
     */
    static GFDDynamicCapacityListTags => 18699

    /**
     * Native name: CxlMailboxCommand_GetGFDSatEntry
     * @type {Integer (Int32)}
     */
    static GetGFDSatEntry => 18700

    /**
     * Native name: CxlMailboxCommand_SetGFDSatEntry
     * @type {Integer (Int32)}
     */
    static SetGFDSatEntry => 18701

    /**
     * Native name: CxlMailboxCommand_GetGFDQoSControl
     * @type {Integer (Int32)}
     */
    static GetGFDQoSControl => 18702

    /**
     * Native name: CxlMailboxCommand_SetGFDQoSControl
     * @type {Integer (Int32)}
     */
    static SetGFDQoSControl => 18703

    /**
     * Native name: CxlMailboxCommand_GetGFDQoSStatus
     * @type {Integer (Int32)}
     */
    static GetGFDQoSStatus => 18704

    /**
     * Native name: CxlMailboxCommand_GetGFDQoSBWLimit
     * @type {Integer (Int32)}
     */
    static GetGFDQoSBWLimit => 18705

    /**
     * Native name: CxlMailboxCommand_SetGFDQoSBWLimit
     * @type {Integer (Int32)}
     */
    static SetGFDQoSBWLimit => 18706

    /**
     * Native name: CxlMailboxCommand_GetGDTConfiguration
     * @type {Integer (Int32)}
     */
    static GetGDTConfiguration => 18707

    /**
     * Native name: CxlMailboxCommand_SetGDTConfiguration
     * @type {Integer (Int32)}
     */
    static SetGDTConfiguration => 18708
}

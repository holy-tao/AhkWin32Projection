#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * > [!NOTE]
  * > EasRequireEncryptionResult may be unavailable for releases after Windows 10.
  * 
  * Represents the type of encryption required. These values are mapped against the HRESULT codes returned from the EAS policy engine.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.exchangeactivesyncprovisioning.easrequireencryptionresult
 * @namespace Windows.Security.ExchangeActiveSyncProvisioning
 * @version WindowsRuntime 1.4
 */
class EasRequireEncryptionResult extends Win32Enum{

    /**
     * The policy is not set for evaluation.
     * @type {Integer (Int32)}
     */
    static NotEvaluated => 0

    /**
     * This computer is already DeviceProtected.HRESULT: S_OK and the user is controlled.
     * @type {Integer (Int32)}
     */
    static Compliant => 1

    /**
     * This computer can be compliant by using the [ApplyAsync](easclientsecuritypolicy_applyasync_489349523.md) method.HRESULT: S_OK but the user is not controlled.
     * @type {Integer (Int32)}
     */
    static CanBeCompliant => 2

    /**
     * This computer is not provisioned to support device encryption. Enable BitLocker on all volumes to comply with device encryption policy. HRESULT: FVE_E_NOT_PROVISIONED_ON_ALL_VOLUMES
     * @type {Integer (Int32)}
     */
    static NotProvisionedOnAllVolumes => 3

    /**
     * This value is no longer supported. Starting with Windows 8.1, use **FixedDataNotSupported**.
     * @type {Integer (Int32)}
     */
    static DeFixedDataNotSupported => 4

    /**
     * This computer cannot support device encryption because unencrypted fixed data volumes are present.HRESULT: FVE_E_DE_FIXED_DATA_NOT_SUPPORTED
     * @type {Integer (Int32)}
     */
    static FixedDataNotSupported => 4

    /**
     * This value is no longer supported. Starting with Windows 8.1, use **HardwareNotCompliant**.
     * @type {Integer (Int32)}
     */
    static DeHardwareNotCompliant => 5

    /**
     * This computer does not meet the hardware requirements to support device encryption.HRESULT: FVE_E_DE_HARDWARE_NOT_COMPLIANT
     * @type {Integer (Int32)}
     */
    static HardwareNotCompliant => 5

    /**
     * This value is no longer supported. Starting with Windows 8.1, use **LockNotConfigured**.
     * @type {Integer (Int32)}
     */
    static DeWinReNotConfigured => 6

    /**
     * This computer cannot support device encryption because WinRE is not properly configured.HRESULT: FVE_E_DE_WINRE_NOT_CONFIGURED
     * @type {Integer (Int32)}
     */
    static LockNotConfigured => 6

    /**
     * This value is no longer supported. Starting with Windows 8.1, use **ProtectionSuspended**.
     * @type {Integer (Int32)}
     */
    static DeProtectionSuspended => 7

    /**
     * Protection is enabled on this volume but has been suspended. This is most likely due to an update of your computer. Reboot and try again.HRESULT: FVE_E_DE_PROTECTION_SUSPENDED
     * @type {Integer (Int32)}
     */
    static ProtectionSuspended => 7

    /**
     * This value is no longer supported. Starting with Windows 8.1, use **OsVolumeNotProtected**.
     * @type {Integer (Int32)}
     */
    static DeOsVolumeNotProtected => 8

    /**
     * This computer is not provisioned with device encryption. Enable Device encryption on all volumes to comply with device encryption policy if it is supported. HRESULT: FVE_E_DE_OS_VOLUME_NOT_PROTECTED
     * @type {Integer (Int32)}
     */
    static OsVolumeNotProtected => 8

    /**
     * This value is no longer supported. Starting with Windows 8.1, use **ProtectionNotYetEnabled**.
     * @type {Integer (Int32)}
     */
    static DeProtectionNotYetEnabled => 9

    /**
     * Protection has not been enabled on the volume. Enabling protection requires a connected account. If you already have a connected account and are seeing this error, refer to the event log for more information.HRESULT: FVE_E_DE_PROTECTION_NOT_YET_ENABLED
     * @type {Integer (Int32)}
     */
    static ProtectionNotYetEnabled => 9

    /**
     * This computer does not have a feature license.HRESULT: FVE_E_NO_FEATURE_LICENSE
     * @type {Integer (Int32)}
     */
    static NoFeatureLicense => 10

    /**
     * The operating system drive is not protected by BitLocker drive encryption.HRESULT: FVE_E_OS_NOT_PROTECTED
     * @type {Integer (Int32)}
     */
    static OsNotProtected => 11

    /**
     * An unexpected failure occurred.
     * @type {Integer (Int32)}
     */
    static UnexpectedFailure => 12
}

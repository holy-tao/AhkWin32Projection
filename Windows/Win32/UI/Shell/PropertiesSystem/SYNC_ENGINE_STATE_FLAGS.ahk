#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies values used by any sync engine to expose their internal engine states to the Property Store's PKEY_StorageProviderStatus value in the File Indexer To update the property, first call IShellItem2::GetPropertyStore with the GPS_EXTRINSICPROPERTIES flag. Next, call the IPropertyStore::SetValue method of the returned object, specifying the PKEY_StorageProviderStatus key, to set the property's bitmask value using these SYNC_ENGINE_STATE_FLAGS.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/ne-shobjidl-sync_engine_state_flags
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class SYNC_ENGINE_STATE_FLAGS extends Win32BitflagEnum{

    /**
     * No state.
     * @type {Integer (Int32)}
     */
    static SESF_NONE => 0

    /**
     * The user's cloud storage quota is nearing capacity. This is dependent on the user's total quota space.
     * @type {Integer (Int32)}
     */
    static SESF_SERVICE_QUOTA_NEARING_LIMIT => 1

    /**
     * The user's cloud storage quota is filled.
     * @type {Integer (Int32)}
     */
    static SESF_SERVICE_QUOTA_EXCEEDED_LIMIT => 2

    /**
     * The user's account credentials are invalid.
     * @type {Integer (Int32)}
     */
    static SESF_AUTHENTICATION_ERROR => 4

    /**
     * The sync engine is paused because of metered network settings.
     * @type {Integer (Int32)}
     */
    static SESF_PAUSED_DUE_TO_METERED_NETWORK => 8

    /**
     * The drive that contains the sync engine's content has reached the maximum allowed space.
     * @type {Integer (Int32)}
     */
    static SESF_PAUSED_DUE_TO_DISK_SPACE_FULL => 16

    /**
     * The user has exceeded their daily limit of requests or data transfers to the service.
     * @type {Integer (Int32)}
     */
    static SESF_PAUSED_DUE_TO_CLIENT_POLICY => 32

    /**
     * The service has requested the system to throttle requests.
     * @type {Integer (Int32)}
     */
    static SESF_PAUSED_DUE_TO_SERVICE_POLICY => 64

    /**
     * The service can't be reached at this time.
     * @type {Integer (Int32)}
     */
    static SESF_SERVICE_UNAVAILABLE => 128

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SESF_PAUSED_DUE_TO_USER_REQUEST => 256

    /**
     * A bitmask value for all valid SYNC_ENGINE_STATE_FLAGS flags.
     * @type {Integer (Int32)}
     */
    static SESF_ALL_FLAGS => 511
}

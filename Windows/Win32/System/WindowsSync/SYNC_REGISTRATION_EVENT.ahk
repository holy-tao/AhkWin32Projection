#Requires AutoHotkey v2.0.0 64-bit

/**
 * Represents the different types of synchronization registration events.
 * @see https://learn.microsoft.com/windows/win32/api/syncregistration/ne-syncregistration-sync_registration_event
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class SYNC_REGISTRATION_EVENT{

    /**
     * A synchronization provider registration has been added.
     * @type {Integer (Int32)}
     */
    static SRE_PROVIDER_ADDED => 0

    /**
     * A synchronization provider registration has been removed.
     * @type {Integer (Int32)}
     */
    static SRE_PROVIDER_REMOVED => 1

    /**
     * The property store (represented by the <b>IPropertyStore</b> interface) of a synchronization provider or a synchronization provider configuration UI has changed.
     * @type {Integer (Int32)}
     */
    static SRE_PROVIDER_UPDATED => 2

    /**
     * The synchronization provider state has changed.
     * @type {Integer (Int32)}
     */
    static SRE_PROVIDER_STATE_CHANGED => 3

    /**
     * A synchronization provider configuration UI has been added.
     * @type {Integer (Int32)}
     */
    static SRE_CONFIGUI_ADDED => 4

    /**
     * A synchronization provider configuration UI has been removed.
     * @type {Integer (Int32)}
     */
    static SRE_CONFIGUI_REMOVED => 5

    /**
     * A synchronization provider configuration UI has been updated.
     * @type {Integer (Int32)}
     */
    static SRE_CONFIGUI_UPDATED => 6
}

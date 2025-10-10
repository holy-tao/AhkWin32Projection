#Requires AutoHotkey v2.0.0 64-bit

/**
 * The MMC_PROPERTY_ACTION enumeration specifies the operations that can occur to a property contained in an MMC_SNAPIN_PROPERTY structure.
 * @see https://docs.microsoft.com/windows/win32/api//mmcobj/ne-mmcobj-mmc_property_action
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class MMC_PROPERTY_ACTION{

    /**
     * The property is being deleted.
     * @type {Integer (Int32)}
     */
    static MMC_PROPACT_DELETING => 1

    /**
     * The property is being modified.
     * @type {Integer (Int32)}
     */
    static MMC_PROPACT_CHANGING => 2

    /**
     * The property is being added.
     * @type {Integer (Int32)}
     */
    static MMC_PROPACT_INITIALIZED => 3
}

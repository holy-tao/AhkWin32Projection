#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MMC_PROPERTY_ACTION enumeration specifies the operations that can occur to a property contained in an MMC_SNAPIN_PROPERTY structure.
 * @see https://learn.microsoft.com/windows/win32/api/mmcobj/ne-mmcobj-mmc_property_action
 * @namespace Windows.Win32.System.Mmc
 */
class MMC_PROPERTY_ACTION extends Win32Enum {

    /**
     * The property is being deleted.
     * Native name: MMC_PROPACT_DELETING
     * @type {Integer (Int32)}
     */
    static PROPACT_DELETING => 1

    /**
     * The property is being modified.
     * Native name: MMC_PROPACT_CHANGING
     * @type {Integer (Int32)}
     */
    static PROPACT_CHANGING => 2

    /**
     * The property is being added.
     * Native name: MMC_PROPACT_INITIALIZED
     * @type {Integer (Int32)}
     */
    static PROPACT_INITIALIZED => 3
}

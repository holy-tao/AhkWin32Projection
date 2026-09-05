#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The SmartCardStatusType enumeration type specifies the status of a smart card.
 * @see https://learn.microsoft.com/windows/win32/api/bdaiface/ne-bdaiface-smartcardstatustype
 * @namespace Windows.Win32.Media.DirectShow
 */
class SmartCardStatusType extends Win32Enum {

    /**
     * The card was inserted.
     * Native name: CardInserted
     * @type {Integer (Int32)}
     */
    static Inserted => 0

    /**
     * The card was removed.
     * Native name: CardRemoved
     * @type {Integer (Int32)}
     */
    static Removed => 1

    /**
     * An error occurred.
     * Native name: CardError
     * @type {Integer (Int32)}
     */
    static Error => 2

    /**
     * The card data has changed.
     * Native name: CardDataChanged
     * @type {Integer (Int32)}
     */
    static DataChanged => 3

    /**
     * Firmware upgrade.
     * Native name: CardFirmwareUpgrade
     * @type {Integer (Int32)}
     */
    static FirmwareUpgrade => 4
}

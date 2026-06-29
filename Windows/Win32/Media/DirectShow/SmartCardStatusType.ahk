#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SmartCardStatusType enumeration type specifies the status of a smart card.
 * @see https://learn.microsoft.com/windows/win32/api/bdaiface/ne-bdaiface-smartcardstatustype
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct SmartCardStatusType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The card was inserted.
     * @type {Integer (Int32)}
     */
    static CardInserted => 0

    /**
     * The card was removed.
     * @type {Integer (Int32)}
     */
    static CardRemoved => 1

    /**
     * An error occurred.
     * @type {Integer (Int32)}
     */
    static CardError => 2

    /**
     * The card data has changed.
     * @type {Integer (Int32)}
     */
    static CardDataChanged => 3

    /**
     * Firmware upgrade.
     * @type {Integer (Int32)}
     */
    static CardFirmwareUpgrade => 4
}

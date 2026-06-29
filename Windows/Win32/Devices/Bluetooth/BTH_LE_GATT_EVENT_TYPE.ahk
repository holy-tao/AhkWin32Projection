#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The BTH_LE_GATT_EVENT_TYPE enumeration describes the different types of Bluetooth Low Energy (LE) generic attribute (GATT) profile events.
 * @see https://learn.microsoft.com/windows/win32/api/bthledef/ne-bthledef-bth_le_gatt_event_type
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct BTH_LE_GATT_EVENT_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The characteristic value has changed.
     * @type {Integer (Int32)}
     */
    static CharacteristicValueChangedEvent => 0
}

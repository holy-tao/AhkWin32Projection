#Requires AutoHotkey v2.0.0 64-bit

/**
 * The BTH_LE_GATT_DESCRIPTOR_TYPE enumeration describes the different types of Bluetooth LE generic attributes (GATT).
 * @see https://docs.microsoft.com/windows/win32/api//bthledef/ne-bthledef-bth_le_gatt_descriptor_type
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class BTH_LE_GATT_DESCRIPTOR_TYPE{

    /**
     * The characteristic value has additional properties that describe how it  can be used, or how it can be accessed.
     * @type {Integer (Int32)}
     */
    static CharacteristicExtendedProperties => 0

    /**
     * The characteristic value contains a UTF-8 string of variable size that is a user textual
     * description.
     * @type {Integer (Int32)}
     */
    static CharacteristicUserDescription => 1

    /**
     * The characteristic value may be configured by the
     * client.
     * @type {Integer (Int32)}
     */
    static ClientCharacteristicConfiguration => 2

    /**
     * The characteristic value may be configured for the
     * server.
     * @type {Integer (Int32)}
     */
    static ServerCharacteristicConfiguration => 3

    /**
     * The format of the characteristic value.
     * @type {Integer (Int32)}
     */
    static CharacteristicFormat => 4

    /**
     * The format of an aggregated characteristic value.
     * @type {Integer (Int32)}
     */
    static CharacteristicAggregateFormat => 5

    /**
     * The characteristic value is customized.
     * @type {Integer (Int32)}
     */
    static CustomDescriptor => 6
}

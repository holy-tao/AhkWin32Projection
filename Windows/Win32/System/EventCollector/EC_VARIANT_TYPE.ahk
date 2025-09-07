#Requires AutoHotkey v2.0.0 64-bit

/**
 * The EC_VARIANT_TYPE enumeration defines the values that specify the data types that are used in the Windows Event Collector functions.
 * @see https://learn.microsoft.com/windows/win32/api/evcoll/ne-evcoll-ec_variant_type
 * @namespace Windows.Win32.System.EventCollector
 * @version v4.0.30319
 */
class EC_VARIANT_TYPE{

    /**
     * Null content that implies that the element that contains the content does not exist.
     * @type {Integer (Int32)}
     */
    static EcVarTypeNull => 0

    /**
     * A Boolean value.
     * @type {Integer (Int32)}
     */
    static EcVarTypeBoolean => 1

    /**
     * An unsigned 32-bit value.
     * @type {Integer (Int32)}
     */
    static EcVarTypeUInt32 => 2

    /**
     * A ULONGLONG value.
     * @type {Integer (Int32)}
     */
    static EcVarTypeDateTime => 3

    /**
     * A string value.
     * @type {Integer (Int32)}
     */
    static EcVarTypeString => 4

    /**
     * An EC_OBJECT_ARRAY_PROPERTY_HANDLE value.
     * @type {Integer (Int32)}
     */
    static EcVarObjectArrayPropertyHandle => 5
}

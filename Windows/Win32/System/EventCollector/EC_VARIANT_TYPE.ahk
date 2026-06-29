#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The EC_VARIANT_TYPE enumeration defines the values that specify the data types that are used in the Windows Event Collector functions.
 * @see https://learn.microsoft.com/windows/win32/api/evcoll/ne-evcoll-ec_variant_type
 * @namespace Windows.Win32.System.EventCollector
 */
export default struct EC_VARIANT_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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

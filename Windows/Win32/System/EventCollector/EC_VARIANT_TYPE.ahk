#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The EC_VARIANT_TYPE enumeration defines the values that specify the data types that are used in the Windows Event Collector functions.
 * @see https://learn.microsoft.com/windows/win32/api/evcoll/ne-evcoll-ec_variant_type
 * @namespace Windows.Win32.System.EventCollector
 */
class EC_VARIANT_TYPE extends Win32Enum {

    /**
     * Null content that implies that the element that contains the content does not exist.
     * Native name: EcVarTypeNull
     * @type {Integer (Int32)}
     */
    static VarTypeNull => 0

    /**
     * A Boolean value.
     * Native name: EcVarTypeBoolean
     * @type {Integer (Int32)}
     */
    static VarTypeBoolean => 1

    /**
     * An unsigned 32-bit value.
     * Native name: EcVarTypeUInt32
     * @type {Integer (Int32)}
     */
    static VarTypeUInt32 => 2

    /**
     * A ULONGLONG value.
     * Native name: EcVarTypeDateTime
     * @type {Integer (Int32)}
     */
    static VarTypeDateTime => 3

    /**
     * A string value.
     * Native name: EcVarTypeString
     * @type {Integer (Int32)}
     */
    static VarTypeString => 4

    /**
     * An EC_OBJECT_ARRAY_PROPERTY_HANDLE value.
     * Native name: EcVarObjectArrayPropertyHandle
     * @type {Integer (Int32)}
     */
    static VarObjectArrayPropertyHandle => 5
}

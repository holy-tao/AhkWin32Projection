#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Enumerates the data types returned from the ISettingsItem::GetDataType method.
 * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/ne-wcmconfig-wcmdatatype
 * @namespace Windows.Win32.System.SettingsManagementInfrastructure
 */
class WcmDataType extends Win32Enum {

    /**
     * Corresponds to a byte.
     * Native name: dataTypeByte
     * @type {Integer (Int32)}
     */
    static Byte => 1

    /**
     * Corresponds to a signed byte.
     * Native name: dataTypeSByte
     * @type {Integer (Int32)}
     */
    static TypeSByte => 2

    /**
     * Corresponds to an unsigned 16-bit integer.
     * Native name: dataTypeUInt16
     * @type {Integer (Int32)}
     */
    static TypeUInt16 => 3

    /**
     * Corresponds to a 16-bit integer.
     * Native name: dataTypeInt16
     * @type {Integer (Int32)}
     */
    static Int16 => 4

    /**
     * Corresponds to an unsigned 32-bit integer.
     * Native name: dataTypeUInt32
     * @type {Integer (Int32)}
     */
    static TypeUInt32 => 5

    /**
     * Corresponds to a 32-bit integer.
     * Native name: dataTypeInt32
     * @type {Integer (Int32)}
     */
    static Int32 => 6

    /**
     * Corresponds to an unsigned 64-bit integer.
     * Native name: dataTypeUInt64
     * @type {Integer (Int32)}
     */
    static TypeUInt64 => 7

    /**
     * Corresponds to a 64-bit integer.
     * Native name: dataTypeInt64
     * @type {Integer (Int32)}
     */
    static Int64 => 8

    /**
     * Corresponds to a Boolean.
     * Native name: dataTypeBoolean
     * @type {Integer (Int32)}
     */
    static Boolean => 11

    /**
     * Corresponds to a string.
     * Native name: dataTypeString
     * @type {Integer (Int32)}
     */
    static String => 12

    /**
     * This flag may appear combined with <b>dataTypeByte</b> or <b>dataTypeString</b> to indicate xsd:hexBinary or wcm:multiString settings, respectively.
     * Native name: dataTypeFlagArray
     * @type {Integer (Int32)}
     */
    static FlagArray => 32768
}

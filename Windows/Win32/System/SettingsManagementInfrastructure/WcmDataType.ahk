#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Enumerates the data types returned from the ISettingsItem::GetDataType method.
 * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/ne-wcmconfig-wcmdatatype
 * @namespace Windows.Win32.System.SettingsManagementInfrastructure
 * @version v4.0.30319
 */
class WcmDataType extends Win32Enum{

    /**
     * Corresponds to a byte.
     * @type {Integer (Int32)}
     */
    static dataTypeByte => 1

    /**
     * Corresponds to a signed byte.
     * @type {Integer (Int32)}
     */
    static dataTypeSByte => 2

    /**
     * Corresponds to an unsigned 16-bit integer.
     * @type {Integer (Int32)}
     */
    static dataTypeUInt16 => 3

    /**
     * Corresponds to a 16-bit integer.
     * @type {Integer (Int32)}
     */
    static dataTypeInt16 => 4

    /**
     * Corresponds to an unsigned 32-bit integer.
     * @type {Integer (Int32)}
     */
    static dataTypeUInt32 => 5

    /**
     * Corresponds to a 32-bit integer.
     * @type {Integer (Int32)}
     */
    static dataTypeInt32 => 6

    /**
     * Corresponds to an unsigned 64-bit integer.
     * @type {Integer (Int32)}
     */
    static dataTypeUInt64 => 7

    /**
     * Corresponds to a 64-bit integer.
     * @type {Integer (Int32)}
     */
    static dataTypeInt64 => 8

    /**
     * Corresponds to a Boolean.
     * @type {Integer (Int32)}
     */
    static dataTypeBoolean => 11

    /**
     * Corresponds to a string.
     * @type {Integer (Int32)}
     */
    static dataTypeString => 12

    /**
     * This flag may appear combined with <b>dataTypeByte</b> or <b>dataTypeString</b> to indicate xsd:hexBinary or wcm:multiString settings, respectively.
     * @type {Integer (Int32)}
     */
    static dataTypeFlagArray => 32768
}

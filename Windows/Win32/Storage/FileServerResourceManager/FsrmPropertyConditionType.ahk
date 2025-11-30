#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the possible comparison operations that can be used to determine whether a property value of a file meets a particular condition.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmenums/ne-fsrmenums-fsrmpropertyconditiontype
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class FsrmPropertyConditionType extends Win32Enum{

    /**
     * The operator is unknown; do not use this value.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyConditionType_Unknown => 0

    /**
     * The property condition is met if the property value is equal to a specified value.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyConditionType_Equal => 1

    /**
     * The property condition is met if the property value is not equal to a specified value.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyConditionType_NotEqual => 2

    /**
     * The property condition is met if the property value is greater than a specified value.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyConditionType_GreaterThan => 3

    /**
     * The property condition is met if the property value is less than a specified value.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyConditionType_LessThan => 4

    /**
     * The property condition is met if the property value contains the specified value.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyConditionType_Contain => 5

    /**
     * The property condition is met if the property value exists.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyConditionType_Exist => 6

    /**
     * The property condition is met if the property value does not exist.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyConditionType_NotExist => 7

    /**
     * The property condition is met if the property value starts with the specified value.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyConditionType_StartWith => 8

    /**
     * The property condition is met if the property value ends with the specified value.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyConditionType_EndWith => 9

    /**
     * The property condition is met if the property value is contained in the specified value.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyConditionType_ContainedIn => 10

    /**
     * The property condition is met if the property value is a prefix of the specified value.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyConditionType_PrefixOf => 11

    /**
     * The property condition is met if the property value is a suffix of the specified value.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyConditionType_SuffixOf => 12

    /**
     * The property condition is met if the property value matches the specified pattern. The pattern format is a 
     *        semicolon-separated list of wildcard patterns. For example "*.exe;*.com"
     * 
     * <b>Windows Server 2008 R2:  </b>This enumeration value is not supported before Windows Server 2012.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyConditionType_MatchesPattern => 13
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the possible comparison operations that can be used to determine whether a property value of a file meets a particular condition.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmpropertyconditiontype
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
class FsrmPropertyConditionType extends Win32Enum {

    /**
     * The operator is unknown; do not use this value.
     * Native name: FsrmPropertyConditionType_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The property condition is met if the property value is equal to a specified value.
     * Native name: FsrmPropertyConditionType_Equal
     * @type {Integer (Int32)}
     */
    static Equal => 1

    /**
     * The property condition is met if the property value is not equal to a specified value.
     * Native name: FsrmPropertyConditionType_NotEqual
     * @type {Integer (Int32)}
     */
    static NotEqual => 2

    /**
     * The property condition is met if the property value is greater than a specified value.
     * Native name: FsrmPropertyConditionType_GreaterThan
     * @type {Integer (Int32)}
     */
    static GreaterThan => 3

    /**
     * The property condition is met if the property value is less than a specified value.
     * Native name: FsrmPropertyConditionType_LessThan
     * @type {Integer (Int32)}
     */
    static LessThan => 4

    /**
     * The property condition is met if the property value contains the specified value.
     * Native name: FsrmPropertyConditionType_Contain
     * @type {Integer (Int32)}
     */
    static Contain => 5

    /**
     * The property condition is met if the property value exists.
     * Native name: FsrmPropertyConditionType_Exist
     * @type {Integer (Int32)}
     */
    static Exist => 6

    /**
     * The property condition is met if the property value does not exist.
     * Native name: FsrmPropertyConditionType_NotExist
     * @type {Integer (Int32)}
     */
    static NotExist => 7

    /**
     * The property condition is met if the property value starts with the specified value.
     * Native name: FsrmPropertyConditionType_StartWith
     * @type {Integer (Int32)}
     */
    static StartWith => 8

    /**
     * The property condition is met if the property value ends with the specified value.
     * Native name: FsrmPropertyConditionType_EndWith
     * @type {Integer (Int32)}
     */
    static EndWith => 9

    /**
     * The property condition is met if the property value is contained in the specified value.
     * Native name: FsrmPropertyConditionType_ContainedIn
     * @type {Integer (Int32)}
     */
    static ContainedIn => 10

    /**
     * The property condition is met if the property value is a prefix of the specified value.
     * Native name: FsrmPropertyConditionType_PrefixOf
     * @type {Integer (Int32)}
     */
    static PrefixOf => 11

    /**
     * The property condition is met if the property value is a suffix of the specified value.
     * Native name: FsrmPropertyConditionType_SuffixOf
     * @type {Integer (Int32)}
     */
    static SuffixOf => 12

    /**
     * The property condition is met if the property value matches the specified pattern. The pattern format is a 
     *        semicolon-separated list of wildcard patterns. For example "*.exe;*.com"
     * 
     * <b>Windows Server 2008 R2:  </b>This enumeration value is not supported before Windows Server 2012.
     * Native name: FsrmPropertyConditionType_MatchesPattern
     * @type {Integer (Int32)}
     */
    static MatchesPattern => 13
}

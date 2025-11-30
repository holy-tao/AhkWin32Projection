#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the types of file classification properties that you can define.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmenums/ne-fsrmenums-fsrmpropertydefinitiontype
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class FsrmPropertyDefinitionType extends Win32Enum{

    /**
     * The type is unknown. Do not use this value.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyDefinitionType_Unknown => 0

    /**
     * A classification property that defines an ordered list of possible string values, one of which may be 
     *        assigned to the property.
     * 
     * The aggregation policy for this type is to use the order in which the items are added to the list to 
     *        determine which value to use if the property exists and contains a value that is different from the rule's 
     *        value. For example, if the list contains "HBI", "MBI", and 
     *        "LBI", and one source specifies "MBI" and the other source specifies 
     *        "HBI", the property value is set to "HBI" because it appears before 
     *        "MBI" in the list.
     * 
     * You can use the following comparison operators with this type (see 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmpropertyconditiontype">FsrmPropertyConditionType</a>): Equal, Not equal, 
     *        Greater than, Less than, Exists, and Not exists.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyDefinitionType_OrderedList => 1

    /**
     * A classification property that defines a list of possible string values, one or more of which may be assigned 
     *        to the property. Use the vertical bar character (|) to delimit the strings.
     * 
     * The aggregation policy for this type is to concatenate the values from each source, consolidating any 
     *        duplicates. For example, if the list of possible values contains "Cat1", 
     *        "Cat2", "Cat3", and "Cat4", and one source specifies 
     *        "Cat3" and another source specifies "Cat1", the property value is set to 
     *        "Cat1|Cat3".
     * 
     * You can use the following comparison operators with this type (see 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmpropertyconditiontype">FsrmPropertyConditionType</a>): Equal, Not equal, 
     *        Contains, Contained in, Exists, and Not exists.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyDefinitionType_MultiChoiceList => 2

    /**
     * A classification property that defines a list of possible string values, only one of which may be assigned 
     *        to the property.
     * 
     * No aggregation is available for this type.
     * 
     * You can use the following comparison operators with this type (see 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmpropertyconditiontype">FsrmPropertyConditionType</a>): Equal, Not equal, 
     *        Exists, and Not exists.
     * 
     * <b>Windows Server 2008 R2 and Windows Server 2008:  </b>This file classification property type is not supported before Windows Server 2012.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyDefinitionType_SingleChoiceList => 3

    /**
     * A classification property that contains an arbitrary string value.
     * 
     * The aggregation policy is to fail if two sources do not specify the same value.
     * 
     * You can use the following comparison operators with this type (see 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmpropertyconditiontype">FsrmPropertyConditionType</a>): Equal, Not equal, 
     *        Greater than, Less than, Contains, Contained in, Start with, End with, Prefix of, Suffix of, Exists, and Not 
     *        exists.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyDefinitionType_String => 4

    /**
     * A classification property that contains one or more arbitrary string values. Use the vertical bar character 
     *        (|) to delimit the strings.
     * 
     * The aggregation policy is to concatenate the values from each source, consolidating any duplicates. For 
     *        example if one source specifies "String1|String2" and another source specifies 
     *        "String1|String3", the property value is set to "String1|String2|String3".
     * 
     * You can use the following comparison operators with this type (see 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmpropertyconditiontype">FsrmPropertyConditionType</a>): Equal, Not equal, 
     *        Contains, Contained in, Exists, and Not exists.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyDefinitionType_MultiString => 5

    /**
     * A classification property that contains a decimal integer value expressed as a string.
     * 
     * The aggregation policy is to fail if two sources do not specify the same value.
     * 
     * You can use the following comparison operators with this type (see 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmpropertyconditiontype">FsrmPropertyConditionType</a>): Equal, Not equal, 
     *        Greater than, Less than, Exists, and Not exists.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyDefinitionType_Int => 6

    /**
     * A classification property that contains a Boolean value expressed as a string. Use a string value of 
     *        "0" for <b>False</b> or a string value of "1" for 
     *        <b>True</b>.
     * 
     * The aggregation policy is to perform a logical <b>OR</b> on the values from each 
     *        source. For example, if one source specifies <b>True</b> and another source specifies 
     *        <b>False</b>, the property value is set to <b>True</b>. If two sources 
     *        both specify <b>False</b>, the property value is set to <b>False</b>.
     * 
     * You can use the following comparison operators with this type (see 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmpropertyconditiontype">FsrmPropertyConditionType</a>): Equal, Not equal, 
     *        Exists, and Not exists.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyDefinitionType_Bool => 7

    /**
     * A classification property that contains a date value. The date value is a 64-bit decimal number (see 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a>) expressed as a string.
     * 
     * The aggregation policy is to fail if two sources do not specify the same value.
     * 
     * You can use the following comparison operators with this type (see 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmpropertyconditiontype">FsrmPropertyConditionType</a>): Equal, Not equal, 
     *        Greater than, Less than, Exists, and Not exists.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyDefinitionType_Date => 8
}

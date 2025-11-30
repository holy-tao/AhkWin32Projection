#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Enumerates the type of the value being assigned to an FSRM property in a property condition.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmenums/ne-fsrmenums-fsrmpropertyvaluetype
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class FsrmPropertyValueType extends Win32Enum{

    /**
     * The type assigned to the property value is not defined.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyValueType_Undefined => 0

    /**
     * The type assigned to the property value is one or more literal values.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyValueType_Literal => 1

    /**
     * The type assigned to the property value is a date expression containing a date variable and an optional 
     *       date offset.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyValueType_DateOffset => 2
}

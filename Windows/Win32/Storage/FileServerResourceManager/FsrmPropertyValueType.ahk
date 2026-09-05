#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Enumerates the type of the value being assigned to an FSRM property in a property condition.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmpropertyvaluetype
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
class FsrmPropertyValueType extends Win32Enum {

    /**
     * The type assigned to the property value is not defined.
     * Native name: FsrmPropertyValueType_Undefined
     * @type {Integer (Int32)}
     */
    static Undefined => 0

    /**
     * The type assigned to the property value is one or more literal values.
     * Native name: FsrmPropertyValueType_Literal
     * @type {Integer (Int32)}
     */
    static Literal => 1

    /**
     * The type assigned to the property value is a date expression containing a date variable and an optional 
     *       date offset.
     * Native name: FsrmPropertyValueType_DateOffset
     * @type {Integer (Int32)}
     */
    static DateOffset => 2
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines values that represent the reasons why an attribute set operation failed for a printer or printer job.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ippattributeerrorreason
 * @namespace Windows.Devices.Printers
 * @version WindowsRuntime 1.4
 */
class IppAttributeErrorReason extends Win32Enum{

    /**
     * An attribute value is too large to be set for the given attribute.
     * @type {Integer (Int32)}
     */
    static RequestEntityTooLarge => 0

    /**
     * A specified attribute is not supported.
     * @type {Integer (Int32)}
     */
    static AttributeNotSupported => 1

    /**
     * A specified attribute value is not supported.
     * @type {Integer (Int32)}
     */
    static AttributeValuesNotSupported => 2

    /**
     * An attribute cannot be modified.
     * @type {Integer (Int32)}
     */
    static AttributeNotSettable => 3

    /**
     * Two or more attributes have conflicting values.
     * @type {Integer (Int32)}
     */
    static ConflictingAttributes => 4
}

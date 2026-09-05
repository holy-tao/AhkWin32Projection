#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes how a (method or event) parameter stores its value.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-parameter-attribute-form
 * @namespace Windows.Win32.Devices.PortableDevices
 */
class WpdParameterAttributeForm extends Win32Enum {

    /**
     * Native name: WPD_PARAMETER_ATTRIBUTE_FORM_UNSPECIFIED
     * @type {Integer (Int32)}
     */
    static UNSPECIFIED => 0

    /**
     * Native name: WPD_PARAMETER_ATTRIBUTE_FORM_RANGE
     * @type {Integer (Int32)}
     */
    static RANGE => 1

    /**
     * Native name: WPD_PARAMETER_ATTRIBUTE_FORM_ENUMERATION
     * @type {Integer (Int32)}
     */
    static ENUMERATION => 2

    /**
     * Native name: WPD_PARAMETER_ATTRIBUTE_FORM_REGULAR_EXPRESSION
     * @type {Integer (Int32)}
     */
    static REGULAR_EXPRESSION => 3

    /**
     * Native name: WPD_PARAMETER_ATTRIBUTE_FORM_OBJECT_IDENTIFIER
     * @type {Integer (Int32)}
     */
    static OBJECT_IDENTIFIER => 4
}

#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes how a (method or event) parameter stores its value.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-parameter-attribute-form
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class WpdParameterAttributeForm{

    /**
     * @type {Integer (Int32)}
     */
    static WPD_PARAMETER_ATTRIBUTE_FORM_UNSPECIFIED => 0

    /**
     * @type {Integer (Int32)}
     */
    static WPD_PARAMETER_ATTRIBUTE_FORM_RANGE => 1

    /**
     * @type {Integer (Int32)}
     */
    static WPD_PARAMETER_ATTRIBUTE_FORM_ENUMERATION => 2

    /**
     * @type {Integer (Int32)}
     */
    static WPD_PARAMETER_ATTRIBUTE_FORM_REGULAR_EXPRESSION => 3

    /**
     * @type {Integer (Int32)}
     */
    static WPD_PARAMETER_ATTRIBUTE_FORM_OBJECT_IDENTIFIER => 4
}

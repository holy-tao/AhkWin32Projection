#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines constants that specify where the effective value of a property was set.
 * @see https://docs.microsoft.com/windows/win32/api//xamlom/ne-xamlom-basevaluesource
 * @namespace Windows.Win32.UI.Xaml.Diagnostics
 * @version v4.0.30319
 */
class BaseValueSource{

    /**
     * The source of the property value is not known.
     * @type {Integer (Int32)}
     */
    static BaseValueSourceUnknown => 0

    /**
     * The value has not been set locally or by any styles, so it has the
     * default value defined in generic.xaml.
     * @type {Integer (Int32)}
     */
    static BaseValueSourceDefault => 1

    /**
     * The value was set by a built-in style.
     * @type {Integer (Int32)}
     */
    static BaseValueSourceBuiltInStyle => 2

    /**
     * The value was set by a style.
     * @type {Integer (Int32)}
     */
    static BaseValueSourceStyle => 3

    /**
     * The value was set locally.
     * @type {Integer (Int32)}
     */
    static BaseValueSourceLocal => 4

    /**
     * The value was inherited from a parent element.
     * @type {Integer (Int32)}
     */
    static Inherited => 5

    /**
     * The value was set by a default style trigger.
     * @type {Integer (Int32)}
     */
    static DefaultStyleTrigger => 6

    /**
     * The value was set by a template style.
     * @type {Integer (Int32)}
     */
    static TemplateTrigger => 7

    /**
     * The value was set by a style trigger.
     * @type {Integer (Int32)}
     */
    static StyleTrigger => 8

    /**
     * The value was set by an implicit style reference.
     * @type {Integer (Int32)}
     */
    static ImplicitStyleReference => 9

    /**
     * The value was set by a parent template.
     * @type {Integer (Int32)}
     */
    static ParentTemplate => 10

    /**
     * The value was set by a parent template trigger.
     * @type {Integer (Int32)}
     */
    static ParentTemplateTrigger => 11

    /**
     * The value was set by an animation.
     * @type {Integer (Int32)}
     */
    static Animation => 12

    /**
     * The value was coerced in code.
     * @type {Integer (Int32)}
     */
    static Coercion => 13

    /**
     * The value was set by a visual state. (Introduced in Windows 10, version 1607.)
     * @type {Integer (Int32)}
     */
    static BaseValueSourceVisualState => 14
}

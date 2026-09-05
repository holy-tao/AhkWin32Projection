#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify where the effective value of a property was set.
 * @see https://learn.microsoft.com/windows/win32/api/xamlom/ne-xamlom-basevaluesource
 * @namespace Windows.Win32.UI.Xaml.Diagnostics
 */
class BaseValueSource extends Win32Enum {

    /**
     * The source of the property value is not known.
     * Native name: BaseValueSourceUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The value has not been set locally or by any styles, so it has the
     * default value defined in generic.xaml.
     * Native name: BaseValueSourceDefault
     * @type {Integer (Int32)}
     */
    static Default => 1

    /**
     * The value was set by a built-in style.
     * Native name: BaseValueSourceBuiltInStyle
     * @type {Integer (Int32)}
     */
    static BuiltInStyle => 2

    /**
     * The value was set by a style.
     * Native name: BaseValueSourceStyle
     * @type {Integer (Int32)}
     */
    static Style => 3

    /**
     * The value was set locally.
     * Native name: BaseValueSourceLocal
     * @type {Integer (Int32)}
     */
    static Local => 4

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
     * Native name: BaseValueSourceVisualState
     * @type {Integer (Int32)}
     */
    static VisualState => 14
}

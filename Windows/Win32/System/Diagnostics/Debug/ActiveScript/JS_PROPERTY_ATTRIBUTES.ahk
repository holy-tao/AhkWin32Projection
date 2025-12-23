#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class JS_PROPERTY_ATTRIBUTES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static JS_PROPERTY_ATTRIBUTE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static JS_PROPERTY_HAS_CHILDREN => 1

    /**
     * @type {Integer (Int32)}
     */
    static JS_PROPERTY_FAKE => 2

    /**
     * @type {Integer (Int32)}
     */
    static JS_PROPERTY_METHOD => 4

    /**
     * @type {Integer (Int32)}
     */
    static JS_PROPERTY_READONLY => 8

    /**
     * @type {Integer (Int32)}
     */
    static JS_PROPERTY_NATIVE_WINRT_POINTER => 16

    /**
     * @type {Integer (Int32)}
     */
    static JS_PROPERTY_FRAME_INTRYBLOCK => 32

    /**
     * @type {Integer (Int32)}
     */
    static JS_PROPERTY_FRAME_INCATCHBLOCK => 64

    /**
     * @type {Integer (Int32)}
     */
    static JS_PROPERTY_FRAME_INFINALLYBLOCK => 128
}

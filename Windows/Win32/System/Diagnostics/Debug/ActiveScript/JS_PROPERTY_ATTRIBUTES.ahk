#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
class JS_PROPERTY_ATTRIBUTES extends Win32Enum {

    /**
     * Native name: JS_PROPERTY_ATTRIBUTE_NONE
     * @type {Integer (Int32)}
     */
    static ATTRIBUTE_NONE => 0

    /**
     * Native name: JS_PROPERTY_HAS_CHILDREN
     * @type {Integer (Int32)}
     */
    static HAS_CHILDREN => 1

    /**
     * Native name: JS_PROPERTY_FAKE
     * @type {Integer (Int32)}
     */
    static FAKE => 2

    /**
     * Native name: JS_PROPERTY_METHOD
     * @type {Integer (Int32)}
     */
    static METHOD => 4

    /**
     * Native name: JS_PROPERTY_READONLY
     * @type {Integer (Int32)}
     */
    static READONLY => 8

    /**
     * Native name: JS_PROPERTY_NATIVE_WINRT_POINTER
     * @type {Integer (Int32)}
     */
    static NATIVE_WINRT_POINTER => 16

    /**
     * Native name: JS_PROPERTY_FRAME_INTRYBLOCK
     * @type {Integer (Int32)}
     */
    static FRAME_INTRYBLOCK => 32

    /**
     * Native name: JS_PROPERTY_FRAME_INCATCHBLOCK
     * @type {Integer (Int32)}
     */
    static FRAME_INCATCHBLOCK => 64

    /**
     * Native name: JS_PROPERTY_FRAME_INFINALLYBLOCK
     * @type {Integer (Int32)}
     */
    static FRAME_INFINALLYBLOCK => 128
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class ModelObjectKind extends Win32Enum {

    /**
     * Native name: ObjectPropertyAccessor
     * @type {Integer (Int32)}
     */
    static PropertyAccessor => 0

    /**
     * Native name: ObjectContext
     * @type {Integer (Int32)}
     */
    static Context => 1

    /**
     * Native name: ObjectTargetObject
     * @type {Integer (Int32)}
     */
    static TargetObject => 2

    /**
     * Native name: ObjectTargetObjectReference
     * @type {Integer (Int32)}
     */
    static TargetObjectReference => 3

    /**
     * Native name: ObjectSynthetic
     * @type {Integer (Int32)}
     */
    static Synthetic => 4

    /**
     * Native name: ObjectNoValue
     * @type {Integer (Int32)}
     */
    static NoValue => 5

    /**
     * Native name: ObjectError
     * @type {Integer (Int32)}
     */
    static Error => 6

    /**
     * Native name: ObjectIntrinsic
     * @type {Integer (Int32)}
     */
    static Intrinsic => 7

    /**
     * Native name: ObjectMethod
     * @type {Integer (Int32)}
     */
    static Method => 8

    /**
     * Native name: ObjectKeyReference
     * @type {Integer (Int32)}
     */
    static KeyReference => 9
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class ModelObjectKind extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ObjectPropertyAccessor => 0

    /**
     * @type {Integer (Int32)}
     */
    static ObjectContext => 1

    /**
     * @type {Integer (Int32)}
     */
    static ObjectTargetObject => 2

    /**
     * @type {Integer (Int32)}
     */
    static ObjectTargetObjectReference => 3

    /**
     * @type {Integer (Int32)}
     */
    static ObjectSynthetic => 4

    /**
     * @type {Integer (Int32)}
     */
    static ObjectNoValue => 5

    /**
     * @type {Integer (Int32)}
     */
    static ObjectError => 6

    /**
     * @type {Integer (Int32)}
     */
    static ObjectIntrinsic => 7

    /**
     * @type {Integer (Int32)}
     */
    static ObjectMethod => 8

    /**
     * @type {Integer (Int32)}
     */
    static ObjectKeyReference => 9
}

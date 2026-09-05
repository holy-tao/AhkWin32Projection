#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The CO_MARSHALING_CONTEXT_ATTRIBUTES (objidlbase.h) enumeration identifies one of the attributes you can query using the GetMarshalingContextAttribute method.
 * @see https://learn.microsoft.com/windows/win32/api/objidlbase/ne-objidlbase-co_marshaling_context_attributes
 * @namespace Windows.Win32.System.Com
 */
class CO_MARSHALING_CONTEXT_ATTRIBUTES extends Win32Enum {

    /**
     * The source of the marshaling data is an app container process.
     * Native name: CO_MARSHALING_SOURCE_IS_APP_CONTAINER
     * @type {Integer (Int32)}
     */
    static SOURCE_IS_APP_CONTAINER => 0

    /**
     * Native name: CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_1
     * @type {Integer (Int32)}
     */
    static ATTRIBUTE_RESERVED_1 => -2147483648

    /**
     * Native name: CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_2
     * @type {Integer (Int32)}
     */
    static ATTRIBUTE_RESERVED_2 => -2147483647

    /**
     * Native name: CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_3
     * @type {Integer (Int32)}
     */
    static ATTRIBUTE_RESERVED_3 => -2147483646

    /**
     * Native name: CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_4
     * @type {Integer (Int32)}
     */
    static ATTRIBUTE_RESERVED_4 => -2147483645

    /**
     * Native name: CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_5
     * @type {Integer (Int32)}
     */
    static ATTRIBUTE_RESERVED_5 => -2147483644

    /**
     * Native name: CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_6
     * @type {Integer (Int32)}
     */
    static ATTRIBUTE_RESERVED_6 => -2147483643

    /**
     * Native name: CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_7
     * @type {Integer (Int32)}
     */
    static ATTRIBUTE_RESERVED_7 => -2147483642

    /**
     * Native name: CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_8
     * @type {Integer (Int32)}
     */
    static ATTRIBUTE_RESERVED_8 => -2147483641

    /**
     * Native name: CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_9
     * @type {Integer (Int32)}
     */
    static ATTRIBUTE_RESERVED_9 => -2147483640

    /**
     * Native name: CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_10
     * @type {Integer (Int32)}
     */
    static ATTRIBUTE_RESERVED_10 => -2147483639

    /**
     * Native name: CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_11
     * @type {Integer (Int32)}
     */
    static ATTRIBUTE_RESERVED_11 => -2147483638

    /**
     * Native name: CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_12
     * @type {Integer (Int32)}
     */
    static ATTRIBUTE_RESERVED_12 => -2147483637

    /**
     * Native name: CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_13
     * @type {Integer (Int32)}
     */
    static ATTRIBUTE_RESERVED_13 => -2147483636

    /**
     * Native name: CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_14
     * @type {Integer (Int32)}
     */
    static ATTRIBUTE_RESERVED_14 => -2147483635

    /**
     * Native name: CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_15
     * @type {Integer (Int32)}
     */
    static ATTRIBUTE_RESERVED_15 => -2147483634

    /**
     * Native name: CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_16
     * @type {Integer (Int32)}
     */
    static ATTRIBUTE_RESERVED_16 => -2147483633

    /**
     * Native name: CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_17
     * @type {Integer (Int32)}
     */
    static ATTRIBUTE_RESERVED_17 => -2147483632

    /**
     * Native name: CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_18
     * @type {Integer (Int32)}
     */
    static ATTRIBUTE_RESERVED_18 => -2147483631
}

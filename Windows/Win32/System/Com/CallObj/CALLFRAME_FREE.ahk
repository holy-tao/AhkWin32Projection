#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Determines the parameter type to be freed. (CALLFRAME_FREE)
 * @see https://learn.microsoft.com/windows/win32/api/callobj/ne-callobj-callframe_free
 * @namespace Windows.Win32.System.Com.CallObj
 */
class CALLFRAME_FREE extends Win32Enum {

    /**
     * No values are freed.
     * Native name: CALLFRAME_FREE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * The [in] parameters are freed. This includes both top-level pointers and the data they reference.
     * Native name: CALLFRAME_FREE_IN
     * @type {Integer (Int32)}
     */
    static IN => 1

    /**
     * The data referenced by [in, out] parameters are freed. However, the top-level pointers, which are the actual parameter values, are not freed.
     * 
     * On the server side, this is typically used post-call, as in CALLFRAME_FREE_IN. On the client side, this is typically used when the server was not actually invoked (and so unmarshaling of return values was not attempted) or when unmarshaling of the return values failed.
     * Native name: CALLFRAME_FREE_INOUT
     * @type {Integer (Int32)}
     */
    static INOUT => 2

    /**
     * The data referenced by [out] parameters are freed. However, the top-level pointers, which are the actual parameter values, are not freed.
     * 
     * On the server side, this is typically used post-call, as in CALLFRAME_FREE_IN. On the client side, this is typically only used when unmarshaling of return values failed.
     * Native name: CALLFRAME_FREE_OUT
     * @type {Integer (Int32)}
     */
    static OUT => 4

    /**
     * The [in, out] parameters are freed. This includes both top-level pointers and the data they reference.
     * Native name: CALLFRAME_FREE_TOP_INOUT
     * @type {Integer (Int32)}
     */
    static TOP_INOUT => 8

    /**
     * The [out] parameters are freed. This includes both top-level pointers and the data they reference.
     * Native name: CALLFRAME_FREE_TOP_OUT
     * @type {Integer (Int32)}
     */
    static TOP_OUT => 16

    /**
     * All [in], [out], and [in, out] parameters are freed. This includes both top-level pointers and the data they reference.
     * Native name: CALLFRAME_FREE_ALL
     * @type {Integer (Int32)}
     */
    static ALL => 31
}

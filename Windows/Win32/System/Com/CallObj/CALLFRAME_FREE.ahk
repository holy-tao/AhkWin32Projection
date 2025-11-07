#Requires AutoHotkey v2.0.0 64-bit

/**
 * Determines the parameter type to be freed.
 * @see https://docs.microsoft.com/windows/win32/api//callobj/ne-callobj-callframe_free
 * @namespace Windows.Win32.System.Com.CallObj
 * @version v4.0.30319
 */
class CALLFRAME_FREE{

    /**
     * No values are freed.
     * @type {Integer (Int32)}
     */
    static CALLFRAME_FREE_NONE => 0

    /**
     * The [in] parameters are freed. This includes both top-level pointers and the data they reference.
     * @type {Integer (Int32)}
     */
    static CALLFRAME_FREE_IN => 1

    /**
     * The data referenced by [in, out] parameters are freed. However, the top-level pointers, which are the actual parameter values, are not freed.
     * 
     * On the server side, this is typically used post-call, as in CALLFRAME_FREE_IN. On the client side, this is typically used when the server was not actually invoked (and so unmarshaling of return values was not attempted) or when unmarshaling of the return values failed.
     * @type {Integer (Int32)}
     */
    static CALLFRAME_FREE_INOUT => 2

    /**
     * The data referenced by [out] parameters are freed. However, the top-level pointers, which are the actual parameter values, are not freed.
     * 
     * On the server side, this is typically used post-call, as in CALLFRAME_FREE_IN. On the client side, this is typically only used when unmarshaling of return values failed.
     * @type {Integer (Int32)}
     */
    static CALLFRAME_FREE_OUT => 4

    /**
     * The [in, out] parameters are freed. This includes both top-level pointers and the data they reference.
     * @type {Integer (Int32)}
     */
    static CALLFRAME_FREE_TOP_INOUT => 8

    /**
     * The [out] parameters are freed. This includes both top-level pointers and the data they reference.
     * @type {Integer (Int32)}
     */
    static CALLFRAME_FREE_TOP_OUT => 16

    /**
     * All [in], [out], and [in, out] parameters are freed. This includes both top-level pointers and the data they reference.
     * @type {Integer (Int32)}
     */
    static CALLFRAME_FREE_ALL => 31
}

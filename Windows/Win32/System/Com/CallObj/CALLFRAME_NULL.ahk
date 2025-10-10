#Requires AutoHotkey v2.0.0 64-bit

/**
 * Determines the parameter type to be freed.
 * @see https://docs.microsoft.com/windows/win32/api//callobj/ne-callobj-callframe_null
 * @namespace Windows.Win32.System.Com.CallObj
 * @version v4.0.30319
 */
class CALLFRAME_NULL{

    /**
     * No values are freed.
     * @type {Integer (Int32)}
     */
    static CALLFRAME_NULL_NONE => 0

    /**
     * The data referenced by [in, out] parameters are freed.
     * @type {Integer (Int32)}
     */
    static CALLFRAME_NULL_INOUT => 2

    /**
     * The data referenced by [out] parameters are freed.
     * @type {Integer (Int32)}
     */
    static CALLFRAME_NULL_OUT => 4

    /**
     * All [out] and [in, out] parameters are freed.
     * @type {Integer (Int32)}
     */
    static CALLFRAME_NULL_ALL => 6
}

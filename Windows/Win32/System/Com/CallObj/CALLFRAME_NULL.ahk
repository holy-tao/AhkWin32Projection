#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Determines the parameter type to be freed. (CALLFRAME_NULL)
 * @see https://learn.microsoft.com/windows/win32/api/callobj/ne-callobj-callframe_null
 * @namespace Windows.Win32.System.Com.CallObj
 */
class CALLFRAME_NULL extends Win32Enum {

    /**
     * No values are freed.
     * Native name: CALLFRAME_NULL_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * The data referenced by [in, out] parameters are freed.
     * Native name: CALLFRAME_NULL_INOUT
     * @type {Integer (Int32)}
     */
    static INOUT => 2

    /**
     * The data referenced by [out] parameters are freed.
     * Native name: CALLFRAME_NULL_OUT
     * @type {Integer (Int32)}
     */
    static OUT => 4

    /**
     * All [out] and [in, out] parameters are freed.
     * Native name: CALLFRAME_NULL_ALL
     * @type {Integer (Int32)}
     */
    static ALL => 6
}

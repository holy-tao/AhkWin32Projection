#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Determines the parameter type to be walked.
 * @see https://learn.microsoft.com/windows/win32/api/callobj/ne-callobj-callframe_walk
 * @namespace Windows.Win32.System.Com.CallObj
 */
class CALLFRAME_WALK extends Win32Enum {

    /**
     * The [in] parameter values will be walked.
     * Native name: CALLFRAME_WALK_IN
     * @type {Integer (Int32)}
     */
    static IN => 1

    /**
     * The [in, out] parameter values will be walked.
     * Native name: CALLFRAME_WALK_INOUT
     * @type {Integer (Int32)}
     */
    static INOUT => 2

    /**
     * The [out] parameter values will be walked.
     * Native name: CALLFRAME_WALK_OUT
     * @type {Integer (Int32)}
     */
    static OUT => 4
}

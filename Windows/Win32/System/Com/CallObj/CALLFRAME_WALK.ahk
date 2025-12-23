#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Determines the parameter type to be walked.
 * @see https://learn.microsoft.com/windows/win32/api/callobj/ne-callobj-callframe_walk
 * @namespace Windows.Win32.System.Com.CallObj
 * @version v4.0.30319
 */
class CALLFRAME_WALK extends Win32Enum{

    /**
     * The [in] parameter values will be walked.
     * @type {Integer (Int32)}
     */
    static CALLFRAME_WALK_IN => 1

    /**
     * The [in, out] parameter values will be walked.
     * @type {Integer (Int32)}
     */
    static CALLFRAME_WALK_INOUT => 2

    /**
     * The [out] parameter values will be walked.
     * @type {Integer (Int32)}
     */
    static CALLFRAME_WALK_OUT => 4
}

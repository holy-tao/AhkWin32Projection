#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mf_cross_origin_policy
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_CROSS_ORIGIN_POLICY extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MF_CROSS_ORIGIN_POLICY_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static MF_CROSS_ORIGIN_POLICY_ANONYMOUS => 1

    /**
     * @type {Integer (Int32)}
     */
    static MF_CROSS_ORIGIN_POLICY_USE_CREDENTIALS => 2
}

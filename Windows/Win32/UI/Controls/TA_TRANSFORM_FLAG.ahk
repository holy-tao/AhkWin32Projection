#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class TA_TRANSFORM_FLAG extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static TATF_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static TATF_TARGETVALUES_USER => 1

    /**
     * @type {Integer (Int32)}
     */
    static TATF_HASINITIALVALUES => 2

    /**
     * @type {Integer (Int32)}
     */
    static TATF_HASORIGINVALUES => 4
}

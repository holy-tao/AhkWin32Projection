#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class TF_CONTEXT_EDIT_CONTEXT_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static TF_ES_ASYNCDONTCARE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TF_ES_SYNC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TF_ES_READ => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TF_ES_READWRITE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static TF_ES_ASYNC => 8
}

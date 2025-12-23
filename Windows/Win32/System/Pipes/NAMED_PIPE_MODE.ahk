#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Pipes
 * @version v4.0.30319
 */
class NAMED_PIPE_MODE extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static PIPE_WAIT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PIPE_NOWAIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PIPE_READMODE_BYTE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PIPE_READMODE_MESSAGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PIPE_CLIENT_END => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PIPE_SERVER_END => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PIPE_TYPE_BYTE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PIPE_TYPE_MESSAGE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PIPE_ACCEPT_REMOTE_CLIENTS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PIPE_REJECT_REMOTE_CLIENTS => 8
}

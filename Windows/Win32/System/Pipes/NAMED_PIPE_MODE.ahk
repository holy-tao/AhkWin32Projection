#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Pipes
 */
class NAMED_PIPE_MODE extends Win32BitflagEnum {

    /**
     * Native name: PIPE_WAIT
     * @type {Integer (UInt32)}
     */
    static WAIT => 0

    /**
     * Native name: PIPE_NOWAIT
     * @type {Integer (UInt32)}
     */
    static NOWAIT => 1

    /**
     * Native name: PIPE_READMODE_BYTE
     * @type {Integer (UInt32)}
     */
    static READMODE_BYTE => 0

    /**
     * Native name: PIPE_READMODE_MESSAGE
     * @type {Integer (UInt32)}
     */
    static READMODE_MESSAGE => 2

    /**
     * Native name: PIPE_CLIENT_END
     * @type {Integer (UInt32)}
     */
    static CLIENT_END => 0

    /**
     * Native name: PIPE_SERVER_END
     * @type {Integer (UInt32)}
     */
    static SERVER_END => 1

    /**
     * Native name: PIPE_TYPE_BYTE
     * @type {Integer (UInt32)}
     */
    static TYPE_BYTE => 0

    /**
     * Native name: PIPE_TYPE_MESSAGE
     * @type {Integer (UInt32)}
     */
    static TYPE_MESSAGE => 4

    /**
     * Native name: PIPE_ACCEPT_REMOTE_CLIENTS
     * @type {Integer (UInt32)}
     */
    static ACCEPT_REMOTE_CLIENTS => 0

    /**
     * Native name: PIPE_REJECT_REMOTE_CLIENTS
     * @type {Integer (UInt32)}
     */
    static REJECT_REMOTE_CLIENTS => 8
}

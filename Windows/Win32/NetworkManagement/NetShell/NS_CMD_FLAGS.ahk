#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies command flags available in NetShell.
 * @see https://learn.microsoft.com/windows/win32/api/netsh/ne-netsh-ns_cmd_flags
 * @namespace Windows.Win32.NetworkManagement.NetShell
 */
class NS_CMD_FLAGS extends Win32Enum {

    /**
     * Indicates a private command. This command is not valid in subcontexts.
     * Native name: CMD_FLAG_PRIVATE
     * @type {Integer (Int32)}
     */
    static FLAG_PRIVATE => 1

    /**
     * Indicates an interactive command. This command is not valid from outside NetShell.
     * Native name: CMD_FLAG_INTERACTIVE
     * @type {Integer (Int32)}
     */
    static FLAG_INTERACTIVE => 2

    /**
     * Indicates a local command. This command is not valid from remote computers.
     * Native name: CMD_FLAG_LOCAL
     * @type {Integer (Int32)}
     */
    static FLAG_LOCAL => 8

    /**
     * Indicates a command is valid only when online. This command is not valid in offline or noncommit mode.
     * Native name: CMD_FLAG_ONLINE
     * @type {Integer (Int32)}
     */
    static FLAG_ONLINE => 16

    /**
     * Indicates a command is not in online Help, but can be executed.
     * Native name: CMD_FLAG_HIDDEN
     * @type {Integer (Int32)}
     */
    static FLAG_HIDDEN => 32

    /**
     * Indicates that the  command limits the mask.
     * Native name: CMD_FLAG_LIMIT_MASK
     * @type {Integer (Int32)}
     */
    static FLAG_LIMIT_MASK => 65535

    /**
     * Indicates that the <b>ulPriority</b> field is used.
     * Native name: CMD_FLAG_PRIORITY
     * @type {Integer (Int32)}
     */
    static FLAG_PRIORITY => -2147483648
}

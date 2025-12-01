#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies command flags available in NetShell.
 * @see https://learn.microsoft.com/windows/win32/api/netsh/ne-netsh-ns_cmd_flags
 * @namespace Windows.Win32.NetworkManagement.NetShell
 * @version v4.0.30319
 */
class NS_CMD_FLAGS extends Win32Enum{

    /**
     * Indicates a private command. This command is not valid in subcontexts.
     * @type {Integer (Int32)}
     */
    static CMD_FLAG_PRIVATE => 1

    /**
     * Indicates an interactive command. This command is not valid from outside NetShell.
     * @type {Integer (Int32)}
     */
    static CMD_FLAG_INTERACTIVE => 2

    /**
     * Indicates a local command. This command is not valid from remote computers.
     * @type {Integer (Int32)}
     */
    static CMD_FLAG_LOCAL => 8

    /**
     * Indicates a command is valid only when online. This command is not valid in offline or noncommit mode.
     * @type {Integer (Int32)}
     */
    static CMD_FLAG_ONLINE => 16

    /**
     * Indicates a command is not in online Help, but can be executed.
     * @type {Integer (Int32)}
     */
    static CMD_FLAG_HIDDEN => 32

    /**
     * Indicates that the  command limits the mask.
     * @type {Integer (Int32)}
     */
    static CMD_FLAG_LIMIT_MASK => 65535

    /**
     * Indicates that the <b>ulPriority</b> field is used.
     * @type {Integer (Int32)}
     */
    static CMD_FLAG_PRIORITY => -2147483648
}

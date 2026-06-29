#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies command flags available in NetShell.
 * @see https://learn.microsoft.com/windows/win32/api/netsh/ne-netsh-ns_cmd_flags
 * @namespace Windows.Win32.NetworkManagement.NetShell
 */
export default struct NS_CMD_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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

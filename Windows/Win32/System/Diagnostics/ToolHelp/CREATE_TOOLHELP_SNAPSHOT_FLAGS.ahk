#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.ToolHelp
 * @version v4.0.30319
 */
class CREATE_TOOLHELP_SNAPSHOT_FLAGS{

    /**
     * @type {Integer (UInt32)}
     */
    static TH32CS_INHERIT => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static TH32CS_SNAPALL => 15

    /**
     * @type {Integer (UInt32)}
     */
    static TH32CS_SNAPHEAPLIST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TH32CS_SNAPMODULE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TH32CS_SNAPMODULE32 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TH32CS_SNAPPROCESS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TH32CS_SNAPTHREAD => 4
}

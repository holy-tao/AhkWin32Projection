#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.AI.Agents.Mcp
 * @version WindowsRuntime 1.4
 */
class McpAuthorizationResponse extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Denied => 0

    /**
     * @type {Integer (Int32)}
     */
    static Approved => 1
}

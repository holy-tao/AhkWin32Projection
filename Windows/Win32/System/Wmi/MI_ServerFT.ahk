#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * A support structure used in the MI_Server structure. Use the functions with the name prefix &quot;MI_Server_&quot; to manipulate these structures.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_serverft
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_ServerFT {
    #StructPack 8

    /**
     * Gets the value of the <b>MI_VERSION</b> macro used when compiling the server.
     */
    GetVersion : IntPtr

    /**
     * Gets the system name for the server.
     */
    GetSystemName : IntPtr

}

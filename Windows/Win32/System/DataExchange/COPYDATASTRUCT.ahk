#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains data to be passed to another application by the WM_COPYDATA message.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-copydatastruct
 * @namespace Windows.Win32.System.DataExchange
 */
export default struct COPYDATASTRUCT {
    #StructPack 8

    /**
     * Type: <b>ULONG_PTR</b>
     * 
     * The type of the data to be passed to the receiving application. The receiving application defines the valid types.
     */
    dwData : IntPtr

    /**
     * Type: <b>DWORD</b>
     * 
     * The size, in bytes, of the data pointed to by the <b>lpData</b> member.
     */
    cbData : UInt32

    /**
     * Type: <b>PVOID</b>
     * 
     * The data to be passed to the receiving application. This member can be <b>NULL</b>.
     */
    lpData : IntPtr

}

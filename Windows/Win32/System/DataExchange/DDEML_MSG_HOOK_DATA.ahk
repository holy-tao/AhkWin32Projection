#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about a Dynamic Data Exchange (DDE) message, and provides read access to the data referenced by the message. This structure is intended to be used by a Dynamic Data Exchange Management Library (DDEML) monitoring application.
 * @see https://learn.microsoft.com/windows/win32/api/ddeml/ns-ddeml-ddeml_msg_hook_data
 * @namespace Windows.Win32.System.DataExchange
 */
export default struct DDEML_MSG_HOOK_DATA {
    #StructPack 8

    /**
     * Type: <b>UINT_PTR</b>
     * 
     * The unpacked low-order word of the <i>lParam</i> parameter associated with the DDE message.
     */
    uiLo : IntPtr

    /**
     * Type: <b>UINT_PTR</b>
     * 
     * The unpacked high-order word of the <i>lParam</i> parameter associated with the DDE message.
     */
    uiHi : IntPtr

    /**
     * Type: <b>DWORD</b>
     * 
     * The amount of data being passed with the message, in bytes. This value can be greater than 32.
     */
    cbData : UInt32

    /**
     * Type: <b>DWORD[8]</b>
     * 
     * The first 32 bytes of data being passed with the message (<c>8 * sizeof(DWORD)</c>).
     */
    Data : UInt32[8]

}

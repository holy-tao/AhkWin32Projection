#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the error message or message box display text for a message table resource.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-message_resource_entry
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct MESSAGE_RESOURCE_ENTRY {
    #StructPack 2

    /**
     * Type: <b>WORD</b>
     * 
     * The length, in bytes, of the <b>MESSAGE_RESOURCE_ENTRY</b> structure.
     */
    Length : UInt16

    /**
     * Type: <b>WORD</b>
     * 
     * Indicates that the string is encoded in Unicode, if equal to the value 0x0001. Indicates that the string is encoded in ANSI, if equal to the value 0x0000.
     */
    Flags : UInt16

    /**
     * Type: <b>BYTE[1]</b>
     * 
     * Pointer to an array that contains the error message or message box display text.
     */
    Text : Int8[1]

}

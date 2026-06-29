#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Identifies an event handler that has been registered with an event source.
 * @remarks
 * Use an **EventRegistrationToken** to  unsubscribe from a Windows Runtime event source.
 * 
 * You acquire an **EventRegistrationToken** when you subscribe to an event.
 * @see https://learn.microsoft.com/windows/win32/api/eventtoken/ns-eventtoken-eventregistrationtoken
 * @namespace Windows.Win32.System.WinRT
 */
export default struct EventRegistrationToken {
    #StructPack 8

    /**
     * Type: **INT64**
     * 
     * An identifying value that is provided by an event source.
     */
    value : Int64

}

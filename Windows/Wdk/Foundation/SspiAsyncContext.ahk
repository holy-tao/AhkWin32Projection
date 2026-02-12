#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32Handle.ahk

/**
 * Determines whether a given async context requires notification on completion of the call.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/sspi/nf-sspi-sspiasynccontextrequiresnotify
 * @namespace Windows.Wdk.Foundation
 * @version v4.0.30319
 */
class SspiAsyncContext extends Win32Handle
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The list of values which indicate that the handle is invalid
     * @type {Array<Integer>}
     */
    static invalidValues => []

    /**
     * @type {Pointer}
     */
    Value {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}

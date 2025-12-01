#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * The WSATHREADID structure enables a provider to identify a thread on which asynchronous procedure calls (APCs) can be queued using the WPUQueueApc function.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/ws2spi/ns-ws2spi-wsathreadid
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class WSATHREADID extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Handle to the thread ID.
     * @type {HANDLE}
     */
    ThreadHandle{
        get {
            if(!this.HasProp("__ThreadHandle"))
                this.__ThreadHandle := HANDLE(0, this)
            return this.__ThreadHandle
        }
    }

    /**
     * Reserved.
     * @type {Pointer}
     */
    Reserved {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

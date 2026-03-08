#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Win32Handle.ahk

/**
 * Contains a DDE service name and topic name. A DDE server application can use this structure during an XTYP_WILDCONNECT transaction to enumerate the service-topic pairs that it supports.
 * @see https://learn.microsoft.com/windows/win32/api/ddeml/ns-ddeml-hszpair
 * @namespace Windows.Win32.System.DataExchange
 * @version v4.0.30319
 */
class HSZ extends Win32Handle
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The list of values which indicate that the handle is invalid
     * @type {Array<Integer>}
     */
    static invalidValues => [-1, 0]

    /**
     * @type {Pointer<Void>}
     */
    Value {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}

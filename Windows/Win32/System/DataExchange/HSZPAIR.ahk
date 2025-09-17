#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a DDE service name and topic name. A DDE server application can use this structure during an XTYP_WILDCONNECT transaction to enumerate the service-topic pairs that it supports.
 * @see https://learn.microsoft.com/windows/win32/api/ddeml/ns-ddeml-hszpair
 * @namespace Windows.Win32.System.DataExchange
 * @version v4.0.30319
 */
class HSZPAIR extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>HSZ</b>
     * 
     * A handle to the service name.
     * @type {Pointer<Void>}
     */
    hszSvc {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>HSZ</b>
     * 
     * A handle to the topic name.
     * @type {Pointer<Void>}
     */
    hszTopic {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

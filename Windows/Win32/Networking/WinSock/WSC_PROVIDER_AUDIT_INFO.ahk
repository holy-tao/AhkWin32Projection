#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains audit information for a layered service provider (LSP) entry in Windows Sockets 2.
 * @remarks
 * 
 * The 
 * **WSC_PROVIDER_AUDIT_INFO** structure is not currently used.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ws2spi/ns-ws2spi-wsc_provider_audit_info
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class WSC_PROVIDER_AUDIT_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The size, in bytes of this audit information record which includes this member.
     * @type {Integer}
     */
    RecordSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A reserved member for the audit information record.
     * @type {Pointer<Void>}
     */
    Reserved {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

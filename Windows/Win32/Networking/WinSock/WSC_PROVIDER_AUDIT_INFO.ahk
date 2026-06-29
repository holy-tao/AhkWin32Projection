#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains audit information for a layered service provider (LSP) entry in Windows Sockets 2.
 * @remarks
 * The 
 * **WSC_PROVIDER_AUDIT_INFO** structure is not currently used.
 * @see https://learn.microsoft.com/windows/win32/api/ws2spi/ns-ws2spi-wsc_provider_audit_info
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct WSC_PROVIDER_AUDIT_INFO {
    #StructPack 8

    /**
     * The size, in bytes of this audit information record which includes this member.
     */
    RecordSize : UInt32

    /**
     * A reserved member for the audit information record.
     */
    Reserved : IntPtr

}

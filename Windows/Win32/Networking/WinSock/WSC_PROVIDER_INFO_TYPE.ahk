#Requires AutoHotkey v2.0.0 64-bit

/**
 * Enumeration type is used to specify the information class of a layered service protocol (LSP) in Windows Sockets 2.
 * @remarks
 * 
  * The 
  * <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/ns-ws2spi-wsc_provider_audit_info">WSC_PROVIDER_AUDIT_INFO</a> structure is not currently used.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ws2spi/ne-ws2spi-wsc_provider_info_type
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class WSC_PROVIDER_INFO_TYPE{

    /**
     * The LSP category information for a protocol entry in a layered protocol. The information class should point to a DWORD value containing the appropriate LSP category flags implemented by LSP.
     * @type {Integer (Int32)}
     */
    static ProviderInfoLspCategories => 0

    /**
     * The LSP class information for audit information for the LSP entry. The information class should point to a <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/ns-ws2spi-wsc_provider_audit_info">WSC_PROVIDER_AUDIT_INFO</a> structure containing an audit record for the LSP.
     * @type {Integer (Int32)}
     */
    static ProviderInfoAudit => 1
}

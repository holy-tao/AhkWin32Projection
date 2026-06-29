#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DDGETTRANSFERSTATUSOUTINFO structure contains the transfer status information.
 * @see https://learn.microsoft.com/windows/win32/api/dxmini/ns-dxmini-ddgettransferstatusoutinfo
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDGETTRANSFERSTATUSOUTINFO {
    #StructPack 8

    /**
     * Contains the transfer ID of the bus master transfer that completed. The transfer ID was originally supplied to the driver in the <b>dwTransferID</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddtransferininfo">DDTRANSFERININFO</a> structure. The driver receives a pointer to DDTRANSFERININFO in a call to its <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_transfer">DxTransfer</a> function.
     */
    dwTransferID : IntPtr

}

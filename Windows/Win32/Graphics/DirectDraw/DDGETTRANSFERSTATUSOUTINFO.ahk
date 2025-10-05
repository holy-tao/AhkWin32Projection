#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DDGETTRANSFERSTATUSOUTINFO structure contains the transfer status information.
 * @see https://learn.microsoft.com/windows/win32/api/dxmini/ns-dxmini-ddgettransferstatusoutinfo
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDGETTRANSFERSTATUSOUTINFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Contains the transfer ID of the bus master transfer that completed. The transfer ID was originally supplied to the driver in the <b>dwTransferID</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddtransferininfo">DDTRANSFERININFO</a> structure. The driver receives a pointer to DDTRANSFERININFO in a call to its <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_transfer">DxTransfer</a> function.
     * @type {Pointer}
     */
    dwTransferID {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}

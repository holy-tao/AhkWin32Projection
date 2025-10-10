#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The RAS_SECURITY_INFO structure is used with the RasSecurityDialogGetInfo function to return information about the RAS port associated with a RAS security DLL authentication transaction.
 * @see https://docs.microsoft.com/windows/win32/api//rasshost/ns-rasshost-ras_security_info
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RAS_SECURITY_INFO extends Win32Struct
{
    static sizeof => 268

    static packingSize => 4

    /**
     * Specifies an error code that indicates the state of the last
     * @type {Integer}
     */
    LastError {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the number of bytes received in the most recent 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rasshost/nf-rasshost-rassecuritydialogreceive">RasSecurityDialogReceive</a> operation. This member is valid only if the value of the <b>LastError</b> member is SUCCESS.
     * @type {Integer}
     */
    BytesReceived {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies a null-terminated string that contains the user-friendly display name of the device on the port, such as Hayes SmartModem 9600.
     * @type {String}
     */
    DeviceName {
        get => StrGet(this.ptr + 8, 128, "UTF-16")
        set => StrPut(value, this.ptr + 8, 128, "UTF-16")
    }
}

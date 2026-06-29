#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * The RAS_SECURITY_INFO structure is used with the RasSecurityDialogGetInfo function to return information about the RAS port associated with a RAS security DLL authentication transaction.
 * @see https://learn.microsoft.com/windows/win32/api/rasshost/ns-rasshost-ras_security_info
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RAS_SECURITY_INFO {
    #StructPack 4

    /**
     * Specifies an error code that indicates the state of the last
     */
    LastError : UInt32

    /**
     * Specifies the number of bytes received in the most recent 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rasshost/nf-rasshost-rassecuritydialogreceive">RasSecurityDialogReceive</a> operation. This member is valid only if the value of the <b>LastError</b> member is SUCCESS.
     */
    BytesReceived : UInt32

    /**
     * Specifies a null-terminated string that contains the user-friendly display name of the device on the port, such as Hayes SmartModem 9600.
     */
    DeviceName : CHAR[129]

}

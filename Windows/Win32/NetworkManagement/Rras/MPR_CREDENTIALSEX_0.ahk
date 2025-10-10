#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MPR_CREDENTIALSEX_0 structure contains extended credentials information such as the information used by Extensible Authentication Protocols (EAPs).
 * @see https://docs.microsoft.com/windows/win32/api//mprapi/ns-mprapi-mpr_credentialsex_0
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class MPR_CREDENTIALSEX_0 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the size of the data pointed to by the <b>lpbCredentialsInfo</b> member.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to the extended credentials information.
     * @type {Pointer<Byte>}
     */
    lpbCredentialsInfo {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

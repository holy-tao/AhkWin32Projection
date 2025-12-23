#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MPR_CREDENTIALSEX_1 structure contains a pre-shared key used by a demand-dial interface.
 * @remarks
 * To a delete a pre-shared key, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradmininterfacesetcredentials">MprAdminInterfaceSetCredentials</a> with the <b>MPR_CREDENTIALSEX_1.dwSize</b> member set to zero.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-mpr_credentialsex_1
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class MPR_CREDENTIALSEX_1 extends Win32Struct
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
     * Pointer to the pre-shared key.
     * @type {Pointer<Integer>}
     */
    lpbCredentialsInfo {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

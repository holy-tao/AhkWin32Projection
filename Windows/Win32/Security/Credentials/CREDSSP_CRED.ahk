#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies authentication data for both Schannel and Negotiate security packages.
 * @see https://docs.microsoft.com/windows/win32/api//credssp/ns-credssp-credssp_cred
 * @namespace Windows.Win32.Security.Credentials
 * @version v4.0.30319
 */
class CREDSSP_CRED extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The <a href="https://docs.microsoft.com/windows/win32/api/credssp/ne-credssp-credspp_submit_type">CREDSPP_SUBMIT_TYPE</a> enumeration value that specifies the type of credentials contained in this structure.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A pointer to a set of Schannel credentials.
     * @type {Pointer<Void>}
     */
    pSchannelCred {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to a set of Negotiate credentials.
     * @type {Pointer<Void>}
     */
    pSpnegoCred {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}

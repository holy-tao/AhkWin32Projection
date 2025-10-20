#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies selection criteria that is passed to the CertSelectCertificateChains function.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cert_select_criteria
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_SELECT_CRITERIA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <b>DWORD</b> value that specifies the number of search attributes specified in the <b>ppPara</b> member.
     * @type {Integer}
     */
    cPara {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A pointer to a pointer to one or more selection values.  The data type depends on the selection type specified by the <b>dwType</b> member. If more than one selection value is present, an application must match only one value.
     * @type {Pointer<Pointer<Void>>}
     */
    ppPara {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

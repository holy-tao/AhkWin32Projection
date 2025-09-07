#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The CERT_BASIC_CONSTRAINTS2_INFO structure contains information indicating whether the certified subject can act as a CA or an end entity. If the subject can act as a CA, a certification path length constraint can also be specified.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_basic_constraints2_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_BASIC_CONSTRAINTS2_INFO extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Boolean indicating whether the certificate subject can act as a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a> (CA) or not.
     * @type {Integer}
     */
    fCA {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Boolean indicating whether the <b>dwPathLenConstraint</b> field limits the maximum length of the certification path. Used only if <b>fCA</b> is <b>TRUE</b>.
     * @type {Integer}
     */
    fPathLenConstraint {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Maximum number of CA certificates that can follow this certificate in a certification path. A value of zero indicates that the subject of this certificate can issue certificates only to end entities and not to other CAs. Used only if both <b>fCA</b> and <b>fPathLenConstraint</b> are <b>TRUE</b>.
     * @type {Integer}
     */
    dwPathLenConstraint {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}

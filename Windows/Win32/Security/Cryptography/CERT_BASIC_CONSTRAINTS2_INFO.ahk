#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The CERT_BASIC_CONSTRAINTS2_INFO structure contains information indicating whether the certified subject can act as a CA or an end entity. If the subject can act as a CA, a certification path length constraint can also be specified.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_basic_constraints2_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_BASIC_CONSTRAINTS2_INFO {
    #StructPack 4

    /**
     * Boolean indicating whether the certificate subject can act as a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a> (CA) or not.
     */
    fCA : BOOL

    /**
     * Boolean indicating whether the <b>dwPathLenConstraint</b> field limits the maximum length of the certification path. Used only if <b>fCA</b> is <b>TRUE</b>.
     */
    fPathLenConstraint : BOOL

    /**
     * Maximum number of CA certificates that can follow this certificate in a certification path. A value of zero indicates that the subject of this certificate can issue certificates only to end entities and not to other CAs. Used only if both <b>fCA</b> and <b>fPathLenConstraint</b> are <b>TRUE</b>.
     */
    dwPathLenConstraint : UInt32

}

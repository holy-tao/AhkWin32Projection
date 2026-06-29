#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The berval structure represents arbitrary binary data that is encoded according to Basic Encoding Rules (BER). Use a berval to represent any attribute that cannot be represented by a null-terminated string.
 * @remarks
 * Use a <b>berval</b> structure for attributes that contain raw binary data, such as certificates, graphics, or sound files.
 * @see https://learn.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_berval
 * @namespace Windows.Win32.Networking.Ldap
 */
export default struct LDAP_BERVAL {
    #StructPack 8

    /**
     * Length, in bytes,  of binary data.
     */
    bv_len : UInt32

    /**
     * Pointer to the binary data.
     */
    bv_val : PSTR

}

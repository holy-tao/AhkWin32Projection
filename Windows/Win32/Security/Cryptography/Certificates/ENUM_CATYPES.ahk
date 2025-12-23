#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies a certification authority (CA) type.
 * @see https://learn.microsoft.com/windows/win32/api/certsrv/ne-certsrv-enum_catypes
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ENUM_CATYPES extends Win32Enum{

    /**
     * A root CA that is a member of an Active Directory domain and uses Directory Service to issue and manage certificates.
     * @type {Integer (Int32)}
     */
    static ENUM_ENTERPRISE_ROOTCA => 0

    /**
     * A CA  that uses Directory Service to issue and manage certificates and is subordinate to an enterprise root CA.
     * @type {Integer (Int32)}
     */
    static ENUM_ENTERPRISE_SUBCA => 1

    /**
     * A root CA that does not use Directory Service to issue or manage certificates. It might or might not belong to a domain.
     * @type {Integer (Int32)}
     */
    static ENUM_STANDALONE_ROOTCA => 3

    /**
     * A CA that does not use Directory Service to issue or manage certificates and is subordinate to a standalone root CA.
     * @type {Integer (Int32)}
     */
    static ENUM_STANDALONE_SUBCA => 4

    /**
     * An unknown CA type.
     * @type {Integer (Int32)}
     */
    static ENUM_UNKNOWN_CA => 5
}

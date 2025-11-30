#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class X509SCEPProcessMessageFlags extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SCEPProcessDefault => 0

    /**
     * @type {Integer (Int32)}
     */
    static SCEPProcessSkipCertInstall => 1
}

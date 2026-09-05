#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
class X509SCEPProcessMessageFlags extends Win32Enum {

    /**
     * Native name: SCEPProcessDefault
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Native name: SCEPProcessSkipCertInstall
     * @type {Integer (Int32)}
     */
    static SkipCertInstall => 1
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
class EInitializeNewDomainFlags extends Win32Enum {

    /**
     * Native name: eInitializeNewDomainFlags_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: eInitializeNewDomainFlags_NoSecurityChanges
     * @type {Integer (Int32)}
     */
    static NoSecurityChanges => 2
}

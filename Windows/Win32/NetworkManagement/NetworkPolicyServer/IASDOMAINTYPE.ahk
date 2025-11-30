#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The values of the IASDOMAINTYPE enumeration type specify whether the SDO computer is part of a domain, and if so, what type of domain.
 * @see https://docs.microsoft.com/windows/win32/api//sdoias/ne-sdoias-iasdomaintype
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class IASDOMAINTYPE extends Win32Enum{

    /**
     * The SDO computer is running in stand-alone mode.
     * @type {Integer (Int32)}
     */
    static DOMAIN_TYPE_NONE => 0

    /**
     * Not supported.
     * @type {Integer (Int32)}
     */
    static DOMAIN_TYPE_NT4 => 1

    /**
     * The SDO computer is part of a Windows domain running in native mode.
     * @type {Integer (Int32)}
     */
    static DOMAIN_TYPE_NT5 => 2

    /**
     * The SDO computer is part of a Windows domain running in mixed mode.
     * @type {Integer (Int32)}
     */
    static DOMAIN_TYPE_MIXED => 3
}

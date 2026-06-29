#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The values of the IASDOMAINTYPE enumeration type specify whether the SDO computer is part of a domain, and if so, what type of domain.
 * @see https://learn.microsoft.com/windows/win32/api/sdoias/ne-sdoias-iasdomaintype
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 */
export default struct IASDOMAINTYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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

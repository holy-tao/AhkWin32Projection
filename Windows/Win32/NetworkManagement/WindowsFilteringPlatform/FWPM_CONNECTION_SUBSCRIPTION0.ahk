#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\FWPM_CONNECTION_ENUM_TEMPLATE0.ahk" { FWPM_CONNECTION_ENUM_TEMPLATE0 }

/**
 * Stores information used to subscribe to notifications about a connection object.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_connection_subscription0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_CONNECTION_SUBSCRIPTION0 {
    #StructPack 8

    /**
     * Type: **[FWPM_CONNECTION_ENUM_TEMPLATE0](/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_connection_enum_template0)**
     * 
     * Enumeration template for limiting the subscription.
     */
    enumTemplate : FWPM_CONNECTION_ENUM_TEMPLATE0.Ptr

    /**
     * Reserved for system use.
     */
    flags : UInt32

    /**
     * Identifies the session that created the subscription.
     */
    sessionKey : Guid

}

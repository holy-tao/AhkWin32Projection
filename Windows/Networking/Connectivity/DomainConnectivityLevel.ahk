#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the domain authentication status for a network connection.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.domainconnectivitylevel
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class DomainConnectivityLevel extends Win32Enum{

    /**
     * No domain controller detected on this network.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * A domain controller has been detected, but the current user or local machine have not been authenticated on the domain.
     * @type {Integer (Int32)}
     */
    static Unauthenticated => 1

    /**
     * The machine or user is authenticated on the domain connection.
     * @type {Integer (Int32)}
     */
    static Authenticated => 2
}

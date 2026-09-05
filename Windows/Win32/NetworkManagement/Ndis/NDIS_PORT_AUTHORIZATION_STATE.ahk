#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
class NDIS_PORT_AUTHORIZATION_STATE extends Win32Enum {

    /**
     * Native name: NdisPortAuthorizationUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: NdisPortAuthorized
     * @type {Integer (Int32)}
     */
    static Authorized => 1

    /**
     * Native name: NdisPortUnauthorized
     * @type {Integer (Int32)}
     */
    static Unauthorized => 2

    /**
     * Native name: NdisPortReauthorizing
     * @type {Integer (Int32)}
     */
    static Reauthorizing => 3
}

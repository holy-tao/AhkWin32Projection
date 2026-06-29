#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_STRING.ahk" { WS_STRING }

/**
 * A list of Server Principal Names (SPNs) that are used to validate Extended Protection.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_service_security_identities
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_SERVICE_SECURITY_IDENTITIES {
    #StructPack 8

    /**
     * A array of strings representing the SPNs accepted by the server. Wildcards are not allowed.
     */
    serviceIdentities : WS_STRING.Ptr

    /**
     * The number of strings in serviceIdentities.
     */
    serviceIdentityCount : UInt32

}

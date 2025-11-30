#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the WS-Trust specification version to be used with message security and mixed-mode security.
 * @remarks
 * 
 * Windows 7 and Windows Server 2008 R2: WWSAPI only supports <a href="http://specs.xmlsoap.org/ws/2005/02/trust/WS-Trust.pdf">Ws-Trust</a> and <a href="http://specs.xmlsoap.org/ws/2005/02/sc/WS-SecureConversation.pdf">Ws-SecureConversation</a> as defined by <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-lwssp/376af2f8-f4fe-4577-bfd5-370ac12cac2e">Lightweight Web Services Security Profile (LWSSP)</a>. For details regarding Microsoft's implementation please see the <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-lwssp/d4f0f509-e14a-47b5-81e8-ade06a51d1ed">MESSAGE Syntax</a> section of LWSSP.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ne-webservices-ws_trust_version
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_TRUST_VERSION extends Win32Enum{

    /**
     * WS-Trust with the specification URI of http://schemas.xmlsoap.org/ws/2005/02/trust
     * @type {Integer (Int32)}
     */
    static WS_TRUST_VERSION_FEBRUARY_2005 => 1

    /**
     * WS-Trust 1.3 with the specification URI of http://docs.oasis-open.org/ws-sx/ws-trust/200512
     * @type {Integer (Int32)}
     */
    static WS_TRUST_VERSION_1_3 => 2
}

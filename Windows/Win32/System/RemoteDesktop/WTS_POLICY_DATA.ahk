#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * Contains policy information that is passed by the Remote Desktop Services service to the protocol.
 * @remarks
 * This structure is used by the following methods:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-sendpolicydata">SendPolicyData</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-getuserdata">GetUserData</a>
 * </li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ns-wtsdefs-wts_policy_data
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct WTS_POLICY_DATA {
    #StructPack 4

    /**
     * Specifies whether to disable encryption for communication between the client and server.
     */
    fDisableEncryption : BOOLEAN

    /**
     * Specifies whether to disable automatic reconnect of the client.
     */
    fDisableAutoReconnect : BOOLEAN

    ColorDepth : UInt32

    /**
     * Specifies the minimum permitted encryption level.
     */
    MinEncryptionLevel : Int8

    /**
     * Specifies whether to disable printer mapping.
     */
    fDisableCpm : BOOLEAN

    /**
     * Specifies whether to disable drive mapping.
     */
    fDisableCdm : BOOLEAN

    /**
     * Specifies whether to disable COM communication port mapping.
     */
    fDisableCcm : BOOLEAN

    /**
     * Specifies whether to disable LPT (line print terminal) printer redirection.
     */
    fDisableLPT : BOOLEAN

    /**
     * Specifies whether to disable clipboard redirection.
     */
    fDisableClip : BOOLEAN

    /**
     * Specifies whether to disable Plug and Play redirection.
     */
    fDisablePNPRedir : BOOLEAN

}

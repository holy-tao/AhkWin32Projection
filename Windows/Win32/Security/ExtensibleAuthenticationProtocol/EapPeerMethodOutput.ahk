#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EapPeerMethodResponseAction.ahk" { EapPeerMethodResponseAction }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains the action information returned by an EAP peer method.
 * @see https://learn.microsoft.com/windows/win32/api/eapauthenticatoractiondefine/ns-eapauthenticatoractiondefine-eappeermethodoutput
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct EapPeerMethodOutput {
    #StructPack 4

    /**
     * <a href="https://docs.microsoft.com/windows/win32/api/eapauthenticatoractiondefine/ne-eapauthenticatoractiondefine-eappeermethodresponseaction">EapPeerMethodResponseAction</a> enumeration value that indicates the response EAPHost should take as a result of the EAP peer method operation.
     */
    action : EapPeerMethodResponseAction

    /**
     * If <b>TRUE</b>, allows EAPHost to raise a notification to the user; otherwise, do not allow notifications.
     */
    fAllowNotifications : BOOL

}

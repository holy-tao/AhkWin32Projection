#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Contains the action information returned by an EAP peer method.
 * @see https://docs.microsoft.com/windows/win32/api//eapauthenticatoractiondefine/ns-eapauthenticatoractiondefine-eappeermethodoutput
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class EapPeerMethodOutput extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * <a href="https://docs.microsoft.com/windows/win32/api/eapauthenticatoractiondefine/ne-eapauthenticatoractiondefine-eappeermethodresponseaction">EapPeerMethodResponseAction</a> enumeration value that indicates the response EAPHost should take as a result of the EAP peer method operation.
     * @type {Integer}
     */
    action {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * If <b>TRUE</b>, allows EAPHost to raise a notification to the user; otherwise, do not allow notifications.
     * @type {BOOL}
     */
    fAllowNotifications{
        get {
            if(!this.HasProp("__fAllowNotifications"))
                this.__fAllowNotifications := BOOL(this.ptr + 4)
            return this.__fAllowNotifications
        }
    }
}

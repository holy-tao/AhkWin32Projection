#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PEER_DATA.ahk
#Include .\PEER_APPLICATION.ahk

/**
 * The PEER_APPLICATION_REGISTRATION_INFO structure contains peer application information for registration with the local computer.
 * @remarks
 * 
  * An "application" is a set of software or software  components available on the peer's endpoint. Commonly, this refers to software packages that support peer networking activities, like games or other collaborative applications.
  * 
  * A peer application has a GUID representing a single specific application. When an application is registered for a peer, this GUID and the corresponding application can be made available to all trusted contacts of the peer, indicating the activities the peer can participate in. To deregister a peer's application, call <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabunregisterapplication">PeerCollabUnregisterApplication</a> with this GUID.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//p2p/ns-p2p-peer_application_registration_info
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_APPLICATION_REGISTRATION_INFO extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_application">PEER_APPLICATION</a> structure that contains the specific peer application data.
     * @deprecated
     * @type {PEER_APPLICATION}
     */
    application{
        get {
            if(!this.HasProp("__application"))
                this.__application := PEER_APPLICATION(0, this)
            return this.__application
        }
    }

    /**
     * Zero-terminated Unicode string that contains the local path to the executable peer application. Note that this data is for local use only and that this structure is never transmitted remotely.
     * @type {PWSTR}
     */
    pwzApplicationToLaunch {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Zero-terminated Unicode string that contains command-line arguments that must be supplied to the application when the application is launched. This data is for local use only. The PEER_APPLICATION_REGISTRATION_INFO  structure is never transmitted remotely.
     * @type {PWSTR}
     */
    pwzApplicationArguments {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_publication_scope">PEER_PUBLICATION_SCOPE</a> enumeration value that specifies the publication scope for this application registration information. The only valid value for this member is PEER_PUBLICATION_SCOPE_INTERNET.
     * @type {Integer}
     */
    dwPublicationScope {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }
}

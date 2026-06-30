#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Data structure returned from KeyCredentialManagerGetInformation.
 * @see https://learn.microsoft.com/windows/win32/api/keycredmgr/ns-keycredmgr-keycredentialmanagerinfo
 * @namespace Windows.Win32.Security.Credentials
 */
class KeyCredentialManagerInfo extends Win32Struct {
    static sizeof => 16

    static packingSize => 4

    /**
     * Unique identifier of the users WHFB container. Only one container per Windows user profile.
     * @type {Guid}
     */
    containerId {
        get {
            if(!this.HasProp("__containerId"))
                this.__containerId := Guid(0, this)
            return this.__containerId
        }
    }
}

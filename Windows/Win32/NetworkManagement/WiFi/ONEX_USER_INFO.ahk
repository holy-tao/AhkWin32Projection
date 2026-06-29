#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ONEX_VARIABLE_BLOB.ahk" { ONEX_VARIABLE_BLOB }
#Import ".\ONEX_AUTH_IDENTITY.ahk" { ONEX_AUTH_IDENTITY }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct ONEX_USER_INFO {
    #StructPack 4

    authIdentity : ONEX_AUTH_IDENTITY

    /**
     * This bitfield backs the following members:
     * - fUserName
     * - fDomainName
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    fUserName {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    fDomainName {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }
    UserName : ONEX_VARIABLE_BLOB

    DomainName : ONEX_VARIABLE_BLOB

}

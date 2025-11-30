#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\System\Kernel\STRING.ahk
#Include ..\..\..\Win32\Foundation\UNICODE_STRING.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class MSV1_0_GETCHALLENRESP_RESPONSE extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * @type {Integer}
     */
    MessageType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Win32STRING}
     */
    CaseSensitiveChallengeResponse{
        get {
            if(!this.HasProp("__CaseSensitiveChallengeResponse"))
                this.__CaseSensitiveChallengeResponse := Win32STRING(8, this)
            return this.__CaseSensitiveChallengeResponse
        }
    }

    /**
     * @type {Win32STRING}
     */
    CaseInsensitiveChallengeResponse{
        get {
            if(!this.HasProp("__CaseInsensitiveChallengeResponse"))
                this.__CaseInsensitiveChallengeResponse := Win32STRING(24, this)
            return this.__CaseInsensitiveChallengeResponse
        }
    }

    /**
     * @type {UNICODE_STRING}
     */
    UserName{
        get {
            if(!this.HasProp("__UserName"))
                this.__UserName := UNICODE_STRING(40, this)
            return this.__UserName
        }
    }

    /**
     * @type {UNICODE_STRING}
     */
    LogonDomainName{
        get {
            if(!this.HasProp("__LogonDomainName"))
                this.__LogonDomainName := UNICODE_STRING(56, this)
            return this.__LogonDomainName
        }
    }

    /**
     * @type {Array<Byte>}
     */
    UserSessionKey{
        get {
            if(!this.HasProp("__UserSessionKeyProxyArray"))
                this.__UserSessionKeyProxyArray := Win32FixedArray(this.ptr + 72, 16, Primitive, "char")
            return this.__UserSessionKeyProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    LanmanSessionKey{
        get {
            if(!this.HasProp("__LanmanSessionKeyProxyArray"))
                this.__LanmanSessionKeyProxyArray := Win32FixedArray(this.ptr + 88, 8, Primitive, "char")
            return this.__LanmanSessionKeyProxyArray
        }
    }
}

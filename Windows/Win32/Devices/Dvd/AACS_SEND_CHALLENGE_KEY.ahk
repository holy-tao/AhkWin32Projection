#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\AACS_CHALLENGE_KEY.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 * @version v4.0.30319
 */
class AACS_SEND_CHALLENGE_KEY extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * @type {Integer}
     */
    SessionId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {AACS_CHALLENGE_KEY}
     */
    ChallengeKey{
        get {
            if(!this.HasProp("__ChallengeKey"))
                this.__ChallengeKey := AACS_CHALLENGE_KEY(8, this)
            return this.__ChallengeKey
        }
    }
}

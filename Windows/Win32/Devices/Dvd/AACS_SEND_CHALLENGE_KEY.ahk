#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\AACS_CHALLENGE_KEY.ahk" { AACS_CHALLENGE_KEY }

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
export default struct AACS_SEND_CHALLENGE_KEY {
    #StructPack 4

    SessionId : UInt32

    ChallengeKey : AACS_CHALLENGE_KEY

}

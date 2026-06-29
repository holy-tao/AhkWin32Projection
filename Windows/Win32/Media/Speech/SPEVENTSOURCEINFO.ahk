#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPEVENTSOURCEINFO {
    #StructPack 8

    ullEventInterest : Int64

    ullQueuedInterest : Int64

    ulCount : UInt32

}

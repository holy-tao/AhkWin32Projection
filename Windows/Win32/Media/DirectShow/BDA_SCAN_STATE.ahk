#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct BDA_SCAN_STATE {
    #StructPack 4

    lResult : Int32

    ulSignalLock : UInt32

    ulSecondsLeft : UInt32

    ulCurrentFrequency : UInt32

}

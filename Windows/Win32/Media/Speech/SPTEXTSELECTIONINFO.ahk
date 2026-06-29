#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPTEXTSELECTIONINFO {
    #StructPack 4

    ulStartActiveOffset : UInt32

    cchActiveChars : UInt32

    ulStartSelection : UInt32

    cchSelection : UInt32

}

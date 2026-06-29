#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SPDISPLAYTOKEN.ahk" { SPDISPLAYTOKEN }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPDISPLAYPHRASE {
    #StructPack 8

    ulNumTokens : UInt32

    pTokens : SPDISPLAYTOKEN.Ptr

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ISpRecoContext.ahk" { ISpRecoContext }
#Import ".\ISpPhrase.ahk" { ISpPhrase }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPPHRASEALTREQUEST {
    #StructPack 8

    ulStartElement : UInt32

    cElements : UInt32

    ulRequestAltCount : UInt32

    pvResultExtra : IntPtr

    cbResultExtra : UInt32

    pPhrase : ISpPhrase

    pRecoContext : ISpRecoContext

}

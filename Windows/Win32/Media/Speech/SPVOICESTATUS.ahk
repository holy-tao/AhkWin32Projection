#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SPVISEMES.ahk" { SPVISEMES }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPVOICESTATUS {
    #StructPack 4

    ulCurrentStream : UInt32

    ulLastStreamQueued : UInt32

    hrLastResult : HRESULT

    dwRunningState : UInt32

    ulInputWordPos : UInt32

    ulInputWordLen : UInt32

    ulInputSentPos : UInt32

    ulInputSentLen : UInt32

    lBookmarkId : Int32

    PhonemeId : UInt16

    VisemeId : SPVISEMES

    dwReserved1 : UInt32

    dwReserved2 : UInt32

}

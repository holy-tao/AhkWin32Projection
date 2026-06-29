#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct DvbParentalRatingParam {
    #StructPack 2

    szCountryCode : CHAR[4]

    bRating : Int8

}

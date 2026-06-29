#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DvbParentalRatingParam.ahk" { DvbParentalRatingParam }
#Import "..\..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct DvbParentalRatingDescriptor {
    #StructPack 4

    ulNumParams : UInt32

    pParams : DvbParentalRatingParam[1]

}

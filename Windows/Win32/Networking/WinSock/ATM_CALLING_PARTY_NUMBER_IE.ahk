#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ATM_ADDRESS.ahk" { ATM_ADDRESS }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct ATM_CALLING_PARTY_NUMBER_IE {
    #StructPack 4

    ATM_Number : ATM_ADDRESS

    Presentation_Indication : Int8

    Screening_Indicator : Int8

}

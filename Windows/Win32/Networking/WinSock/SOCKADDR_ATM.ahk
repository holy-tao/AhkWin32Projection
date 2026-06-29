#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ATM_BLLI.ahk" { ATM_BLLI }
#Import ".\ATM_ADDRESS.ahk" { ATM_ADDRESS }
#Import ".\ATM_BHLI.ahk" { ATM_BHLI }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct SOCKADDR_ATM {
    #StructPack 4

    satm_family : UInt16

    satm_number : ATM_ADDRESS

    satm_blli : ATM_BLLI

    satm_bhli : ATM_BHLI

}

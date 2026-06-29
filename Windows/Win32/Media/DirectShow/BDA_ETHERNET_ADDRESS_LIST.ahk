#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BDA_ETHERNET_ADDRESS.ahk" { BDA_ETHERNET_ADDRESS }

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct BDA_ETHERNET_ADDRESS_LIST {
    #StructPack 4

    ulcAddresses : UInt32

    rgAddressl : BDA_ETHERNET_ADDRESS[1]

}

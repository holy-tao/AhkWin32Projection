#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BDA_IPv4_ADDRESS.ahk" { BDA_IPv4_ADDRESS }

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct BDA_IPv4_ADDRESS_LIST {
    #StructPack 4

    ulcAddresses : UInt32

    rgAddressl : BDA_IPv4_ADDRESS[1]

}

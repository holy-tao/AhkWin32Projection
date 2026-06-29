#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ICMP_HEADER.ahk" { ICMP_HEADER }
#Import ".\ICMP_MESSAGE.ahk" { ICMP_MESSAGE }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct ICMPV4_ADDRESS_MASK_MESSAGE {
    #StructPack 4

    Header : ICMP_MESSAGE

    AddressMask : UInt32

}

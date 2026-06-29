#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct HARDWARE_ADDRESS {
    #StructPack 1

    Address : Int8[6]

}

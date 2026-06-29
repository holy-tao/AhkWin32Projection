#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the pre-shared key information.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-sec_presharedkey
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct SEC_PRESHAREDKEY {
    #StructPack 2

    /**
     * The size of the PSK.
     */
    KeySize : UInt16

    /**
     * The PSK.
     */
    Key : Int8[1]

}

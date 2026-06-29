#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Holds the seed and counter values that can be used to verify the primes of the DSS public key.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-dssseed
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct DSSSEED {
    #StructPack 4

    /**
     * A <b>DWORD</b> containing the counter value. If the counter value is 0xFFFFFFFF, the seed and counter values are not available.
     */
    counter : UInt32

    /**
     * A <b>BYTE</b> string containing the seed value.
     */
    seed : Int8[20]

}

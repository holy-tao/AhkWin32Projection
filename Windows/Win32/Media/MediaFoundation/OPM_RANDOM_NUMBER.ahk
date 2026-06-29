#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * OPM_RANDOM_NUMBER (opmapi.h) contains a 128-bit random number for use with Output Protection Manager (OPM).
 * @remarks
 * Always use a cryptographically secure random-number generator to fill in this structure. The <b>CryptGenRandom</b> function is recommended, although not required.
 * @see https://learn.microsoft.com/windows/win32/api/opmapi/ns-opmapi-opm_random_number
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct OPM_RANDOM_NUMBER {
    #StructPack 1

    /**
     * A 128-bit array that contains a random number.
     */
    abRandomNumber : Int8[16]

}

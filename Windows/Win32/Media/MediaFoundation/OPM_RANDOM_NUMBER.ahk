#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a 128-bit random number for use with Output Protection Manager (OPM).
 * @remarks
 * 
 * Always use a cryptographically secure random-number generator to fill in this structure. The <b>CryptGenRandom</b> function is recommended, although not required.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//opmapi/ns-opmapi-opm_random_number
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class OPM_RANDOM_NUMBER extends Win32Struct
{
    static sizeof => 16

    static packingSize => 1

    /**
     * A 128-bit array that contains a random number.
     * @type {Array<Byte>}
     */
    abRandomNumber{
        get {
            if(!this.HasProp("__abRandomNumberProxyArray"))
                this.__abRandomNumberProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "char")
            return this.__abRandomNumberProxyArray
        }
    }
}

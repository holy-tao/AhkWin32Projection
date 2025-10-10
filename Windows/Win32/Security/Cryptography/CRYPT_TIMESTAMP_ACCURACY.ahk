#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Is used by the CRYPT_TIMESTAMP_INFO structure to represent the accuracy of the time deviation around the UTC time at which the time stamp token was created by the Time Stamp Authority (TSA).
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-crypt_timestamp_accuracy
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_TIMESTAMP_ACCURACY extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Optional. Specifies, in seconds, the accuracy of the upper limit of the time at which the time stamp token was created by the TSA.
     * @type {Integer}
     */
    dwSeconds {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Optional. Specifies, in milliseconds, the accuracy of the upper limit of the time at which the time stamp token was  created by the TSA.
     * @type {Integer}
     */
    dwMillis {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Optional. Specifies, in microseconds, the accuracy of the upper limit of the time at which the time-stamp token was created by the TSA.
     * @type {Integer}
     */
    dwMicros {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}

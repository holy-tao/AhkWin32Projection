#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Is used by the CRYPT_TIMESTAMP_INFO structure to represent the accuracy of the time deviation around the UTC time at which the time stamp token was created by the Time Stamp Authority (TSA).
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_timestamp_accuracy
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_TIMESTAMP_ACCURACY {
    #StructPack 4

    /**
     * Optional. Specifies, in seconds, the accuracy of the upper limit of the time at which the time stamp token was created by the TSA.
     */
    dwSeconds : UInt32

    /**
     * Optional. Specifies, in milliseconds, the accuracy of the upper limit of the time at which the time stamp token was  created by the TSA.
     */
    dwMillis : UInt32

    /**
     * Optional. Specifies, in microseconds, the accuracy of the upper limit of the time at which the time-stamp token was created by the TSA.
     */
    dwMicros : UInt32

}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of encoding applied to a byte array for display purposes.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-encodingtype
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class EncodingType extends Win32Enum{

    /**
     * The string is base64 encoded with beginning and ending certificate headers. Base64 is an encoding scheme  used to transmit binary data. The data to be encoded is examined three bytes at a time. Every six bits in the 24-bit buffer is used as an index into a text string. The strings used vary depending on the type of data being encoded. The following string is commonly used for Multipurpose Internet Mail Extensions (MIME) email base64 encoding.
     * 
     * 
     * ``` syntax
     * ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/
     * ```
     * 
     *  The following example shows a certificate that is base64 encoded and includes the beginning and ending headers.
     * 
     * 
     * ``` syntax
     * -----BEGIN CERTIFICATE-----
     * MIIBqDCCARECAQAwaTELMAkGA1UEBhMCVVMxDjAMBgNVBAgTBVRleGFzMRMwEQYD
     * VQQHEwpMYXNDb2xpbmFzMRIwEAYDVQQKEwlNaWNyb3NvZnQxDjAMBgNVBAsTBUl0
     * ZWFtMREwDwYDVQQDFAhOVFZPT0RPTzCBnjANBgkqhkiG9w0BAQEFAAOBjAAwgYgC
     * gYBxmmAWKbLJHg5TuVyjgzWW0JsY5Shaqd7BDWtqhzy4HfRTW22f31rlm8NeSXHn
     * EhLiwsGgNzWHJ8no1QIYzAgpDR79oqxvgrY4WS3PXT7OLwIDAQABoAAwDQYJKoZI
     * hvcNAQEEBQADgYEAVcyI4jtnnV6kMiByiq4Xg99yL0U7bIpEwAf3MIZHS7wuNqfY
     * acfhbRj6VFHT8ObprKGPmqXJvwrBmPrEuCs4Ik6PidAAeEfoaa3naIbM73tTvKN+
     * WD30lAfGBr8SZixLep4pMIN/wO0eu6f30cBuoPtDnDulNT8AuQHjkJIc8Qc=
     * -----END CERTIFICATE----- 
     * ```
     * @type {Integer (Int32)}
     */
    static XCN_CRYPT_STRING_BASE64HEADER => 0

    /**
     * The string is base64 encoded without beginning and ending certificate headers.
     * @type {Integer (Int32)}
     */
    static XCN_CRYPT_STRING_BASE64 => 1

    /**
     * The string is a pure binary sequence. It is not encoded.
     * @type {Integer (Int32)}
     */
    static XCN_CRYPT_STRING_BINARY => 2

    /**
     * The string is base64 encoded with beginning and ending certificate request headers. This is shown in the following example.
     * 
     * 
     * ``` syntax
     * -----BEGIN NEW CERTIFICATE REQUEST-----
     * MIIDBjCCAm8CAQAwcTERMA8GA1UEAxMIcXV1eC5jb20xDzANBgNVBAsTBkJyYWlu
     * czEWMBQGA1UEChMNRGV2ZWxvcE1lbnRvcjERMA8GA1UEBxMIVG9ycmFuY2UxEzAR
     * BgNVBAgTCkNhbGlmb3JuaWExCzAJBgNVBAYTAlVTMIGfMA0GCSqGSIb3DQEBAQUA
     * A4GNADCBiQKBgQDFUxFtzr170yxptKuGI1590Sta5z2dVElLfjAn+q4T1uZE3DiH
     * HXNRHW1eS9W2aeMZhRnYRi5U8eOdG3RUO4YXy4B1sqfy5I0qjjySA89ghVd/6JcA
     * K1nhGJL9FPJ6XKVUNLez7NpSCFlYs5foyTqyxDkHzTnQwRwkkwQ9dlbnfwIDAQAB
     * oIIBUzAaBgorBgEEAYI3DQIDMQwWCjUuMC4yMTk1LjIwNQYKKwYBBAGCNwIBDjEn
     * MCUwDgYDVR0PAQH/BAQDAgTwMBMGA1UdJQQMMAoGCCsGAQUFBwMBMIH9BgorBgEE
     * AYI3DQICMYHuMIHrAgEBHloATQBpAGMAcgBvAHMAbwBmAHQAIABSAFMAQQAgAFMA
     * QwBoAGEAbgBuAGUAbAAgAEMAcgB5AHAAdABvAGcAcgBhAHAAaABpAGMAIABQAHIA
     * bwB2AGkAZABlAHIDgYkAXxNuAz6gcBaZUdef8WQ2PAroKMW8sprcKv7QD2encz6/
     * Wct9DZ5CkGynLGy0f+Lff7ViSDJqxYWaJ68ddqgXyAqIilF63kivPTiC6yxLaNX6
     * 5v3cnKFx4UrUrGXZtub7M7/NuxSipOW0Vv7yCHganypxDyRzp6IhulEnL4APEH4A
     * AAAAAAAAADANBgkqhkiG9w0BAQUFAAOBgQBljJb1ZhWOwOLfzfHbC3yxGkXDy9w3
     * NA7uhQOvgntnqmSmdHP9nsM3DnxwaHb3EVxMKbAuLsSRDAE1KGqeamvQ3uFjuuL0
     * 5q4nKhX25LyGFDSc6h1OHcv+0ugZ/9klsiViSeEGpMwllUf057o7q1Vls4HN22vM
     * wkcejcttDjo3Kw==
     * -----END NEW CERTIFICATE REQUEST-----
     * ```
     * @type {Integer (Int32)}
     */
    static XCN_CRYPT_STRING_BASE64REQUESTHEADER => 3

    /**
     * The string is hexadecimal encoded. Each 4-bit nibble of the string is represented as a number between zero and nine or a letter between A and F (or a and f). This is shown in the following example.
     * 
     * 
     * ``` syntax
     * 3a 20 63 65 72 74 6c 69  62 5c 6c 64 61 70 2e 63
     * 70 70 28 32 31 33 31 29  3a 20 6c 64 61 70 65 72
     * ...
     * ```
     * @type {Integer (Int32)}
     */
    static XCN_CRYPT_STRING_HEX => 4

    /**
     * The string is hexadecimal encoded, and the corresponding ASCII characters are displayed. This is shown in the following example.
     * 
     * 
     * ``` syntax
     * 3a 20 63 65 72 74 6c 69  62 5c 6c 64 61 70 2e 63   : certlib\ldap.c
     * 70 70 28 32 31 33 31 29  3a 20 6c 64 61 70 65 72   pp(2131): ldaper
     * ...
     * ```
     * @type {Integer (Int32)}
     */
    static XCN_CRYPT_STRING_HEXASCII => 5

    /**
     * The string is base64 encoded. Enumeration values are tried in the following order:
     * 
     * <ol>
     * <li><b>XCN_CRYPT_STRING_BASE64HEADER</b></li>
     * <li><b>XCN_CRYPT_STRING_BASE64</b></li>
     * </ol>
     * @type {Integer (Int32)}
     */
    static XCN_CRYPT_STRING_BASE64_ANY => 6

    /**
     * Enumeration values are tried in the following order:
     * 
     * <ol>
     * <li><b>XCN_CRYPT_STRING_BASE64_ANY</b></li>
     * <li><b>XCN_CRYPT_STRING_BINARY</b></li>
     * </ol>
     * The <b>XCN_CRYPT_STRING_BINARY</b> value always succeeds.
     * @type {Integer (Int32)}
     */
    static XCN_CRYPT_STRING_ANY => 7

    /**
     * Enumeration values are tried in the following order:
     * 
     * <ol>
     * <li><b>XCN_CRYPT_STRING_HEXADDR</b></li>
     * <li><b>XCN_CRYPT_STRING_HEXASCIIADDR</b></li>
     * <li><b>XCN_CRYPT_STRING_HEXASCII</b></li>
     * <li><b>XCN_CRYPT_STRING_HEX</b></li>
     * </ol>
     * @type {Integer (Int32)}
     */
    static XCN_CRYPT_STRING_HEX_ANY => 8

    /**
     * The string is base64 encoded with beginning and ending <a href="https://docs.microsoft.com/windows/desktop/SecGloss/x-gly">X.509</a> <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate revocation list</a> (CRL) headers. This is shown in the following example.
     * 
     * 
     * ``` syntax
     * -----BEGIN X509 CRL-----
     * MIIDBjCCAm8CAQAwcTERMA8GA1UEAxMIcXV1eC5jb20xDzANBgNVBAsTBkJyYWlu
     * czEWMBQGA1UEChMNRGV2ZWxvcE1lbnRvcjERMA8GA1UEBxMIVG9ycmFuY2UxEzAR
     * BgNVBAgTCkNhbGlmb3JuaWExCzAJBgNVBAYTAlVTMIGfMA0GCSqGSIb3DQEBAQUA
     * A4GNADCBiQKBgQDFUxFtzr170yxptKuGI1590Sta5z2dVElLfjAn+q4T1uZE3DiH
     * HXNRHW1eS9W2aeMZhRnYRi5U8eOdG3RUO4YXy4B1sqfy5I0qjjySA89ghVd/6JcA
     * K1nhGJL9FPJ6XKVUNLez7NpSCFlYs5foyTqyxDkHzTnQwRwkkwQ9dlbnfwIDAQAB
     * oIIBUzAaBgorBgEEAYI3DQIDMQwWCjUuMC4yMTk1LjIwNQYKKwYBBAGCNwIBDjEn
     * MCUwDgYDVR0PAQH/BAQDAgTwMBMGA1UdJQQMMAoGCCsGAQUFBwMBMIH9BgorBgEE
     * AYI3DQICMYHuMIHrAgEBHloATQBpAGMAcgBvAHMAbwBmAHQAIABSAFMAQQAgAFMA
     * QwBoAGEAbgBuAGUAbAAgAEMAcgB5AHAAdABvAGcAcgBhAHAAaABpAGMAIABQAHIA
     * bwB2AGkAZABlAHIDgYkAXxNuAz6gcBaZUdef8WQ2PAroKMW8sprcKv7QD2encz6/
     * Wct9DZ5CkGynLGy0f+Lff7ViSDJqxYWaJ68ddqgXyAqIilF63kivPTiC6yxLaNX6
     * 5v3cnKFx4UrUrGXZtub7M7/NuxSipOW0Vv7yCHganypxDyRzp6IhulEnL4APEH4A
     * AAAAAAAAADANBgkqhkiG9w0BAQUFAAOBgQBljJb1ZhWOwOLfzfHbC3yxGkXDy9w3
     * NA7uhQOvgntnqmSmdHP9nsM3DnxwaHb3EVxMKbAuLsSRDAE1KGqeamvQ3uFjuuL0
     * 5q4nKhX25LyGFDSc6h1OHcv+0ugZ/9klsiViSeEGpMwllUf057o7q1Vls4HN22vM
     * wkcejcttDjo3Kw==
     * -----END X509 CRL-----
     * ```
     * @type {Integer (Int32)}
     */
    static XCN_CRYPT_STRING_BASE64X509CRLHEADER => 9

    /**
     * The string is hexadecimal encoded and displayed as a hexadecimal address. This is shown in the following example.
     * 
     * 
     * ``` syntax
     * 0000  3a 20 63 65 72 74 6c 69  62 5c 6c 64 61 70 2e 63
     * 0010  70 70 28 32 31 33 31 29  3a 20 6c 64 61 70 65 72
     * ...
     * ```
     * @type {Integer (Int32)}
     */
    static XCN_CRYPT_STRING_HEXADDR => 10

    /**
     * The string is hexadecimal encoded and displayed as a hexadecimal address along with the corresponding ASCII characters. This is shown in the following example.
     * 
     * 
     * ``` syntax
     * 0000  3a 20 63 65 72 74 6c 69  62 5c 6c 64 61 70 2e 63   : certlib\ldap.c
     * 0010  70 70 28 32 31 33 31 29  3a 20 6c 64 61 70 65 72   pp(2131): ldaper
     * ...
     * ```
     * @type {Integer (Int32)}
     */
    static XCN_CRYPT_STRING_HEXASCIIADDR => 11

    /**
     * The string is hexadecimal encoded and displayed without punctuation. <b>XCN_CRYPT_STRING_HEXRAW</b> is available only with Windows Vista.
     * 
     * 
     * ``` syntax
     * 3a20636572746c69625c6c6461702e6370702832313331293a206c6461706572...
     * ```
     * @type {Integer (Int32)}
     */
    static XCN_CRYPT_STRING_HEXRAW => 12

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CRYPT_STRING_BASE64URI => 13

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CRYPT_STRING_ENCODEMASK => 255

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CRYPT_STRING_CHAIN => 256

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CRYPT_STRING_TEXT => 512

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CRYPT_STRING_PERCENTESCAPE => 134217728

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CRYPT_STRING_HASHDATA => 268435456

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CRYPT_STRING_STRICT => 536870912

    /**
     * Removes carriage return and line feed control characters from the encoded string.
     * @type {Integer (Int32)}
     */
    static XCN_CRYPT_STRING_NOCRLF => 1073741824

    /**
     * Removes the carriage return control character from the encoded string.
     * @type {Integer (Int32)}
     */
    static XCN_CRYPT_STRING_NOCR => -2147483648
}

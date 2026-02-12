#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * This enumerated type is used to determine the encoding algorithm to send or calculate the length of an [SmsTextMessage](smstextmessage.md) object.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators, mobile broadband adapter IHV, or OEM. For more information, see [Mobile Broadband](/windows-hardware/drivers/mobilebroadband/index).
 * @remarks
 * The encodings are defined in sections 4.5.2 and 23.038 of the 3GPP2 specification C.S0015-B "Short Message Service (SM) for Wideband Spread Spectrum Systems".
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsencoding
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class SmsEncoding extends Win32Enum{

    /**
     * The data encoding is unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * 7-bit encoding if all characters can be represented, otherwise 2-byte Universal Character Set (UCS-2) encoding.
     * @type {Integer (Int32)}
     */
    static Optimal => 1

    /**
     * Seven-bit ASCII encoding.
     * @type {Integer (Int32)}
     */
    static SevenBitAscii => 2

    /**
     * Unicode encoding.
     * @type {Integer (Int32)}
     */
    static Unicode => 3

    /**
     * Standard 7-bit GSM encoding.
     * @type {Integer (Int32)}
     */
    static GsmSevenBit => 4

    /**
     * Standard eight bit encoding.
     * @type {Integer (Int32)}
     */
    static EightBit => 5

    /**
     * Latin encoding.
     * @type {Integer (Int32)}
     */
    static Latin => 6

    /**
     * Korean encoding.
     * @type {Integer (Int32)}
     */
    static Korean => 7

    /**
     * IA5 encoding.
     * @type {Integer (Int32)}
     */
    static IA5 => 8

    /**
     * Shift-JIS encoding for the Japanese language.
     * @type {Integer (Int32)}
     */
    static ShiftJis => 9

    /**
     * Latin Hebrew encoding.
     * @type {Integer (Int32)}
     */
    static LatinHebrew => 10
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a single fingerprint or palm sample from an end user.
 * @remarks
 * The *Position* member specifies the area of the hand or palm used to make the biometric sample. The Windows Biometric Framework (WBF) currently supports only fingerprint capture and uses the following constants to represent position information.
  * 
  * -   WINBIO\_ANSI\_381\_POS\_UNKNOWN
  * -   WINBIO\_ANSI\_381\_POS\_RH\_THUMB
  * -   WINBIO\_ANSI\_381\_POS\_RH\_INDEX\_FINGER
  * -   WINBIO\_ANSI\_381\_POS\_RH\_MIDDLE\_FINGER
  * -   WINBIO\_ANSI\_381\_POS\_RH\_RING\_FINGER
  * -   WINBIO\_ANSI\_381\_POS\_RH\_LITTLE\_FINGER
  * -   WINBIO\_ANSI\_381\_POS\_LH\_THUMB
  * -   WINBIO\_ANSI\_381\_POS\_LH\_INDEX\_FINGER
  * -   WINBIO\_ANSI\_381\_POS\_LH\_MIDDLE\_FINGER
  * -   WINBIO\_ANSI\_381\_POS\_LH\_RING\_FINGER
  * -   WINBIO\_ANSI\_381\_POS\_LH\_LITTLE\_FINGER
  * -   WINBIO\_ANSI\_381\_POS\_RH\_FOUR\_FINGERS
  * -   WINBIO\_ANSI\_381\_POS\_LH\_FOUR\_FINGERS
  * -   WINBIO\_ANSI\_381\_POS\_TWO\_THUMBS
  * 
  * > [!IMPORTANT]
  * >
  * > Do not attempt to validate the value supplied for the *Position* value. The Windows Biometrics Service will validate the supplied value before passing it through to your implementation. If the value is **WINBIO\_SUBTYPE\_NO\_INFORMATION** or **WINBIO\_SUBTYPE\_ANY**, then validate where appropriate.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-bdb-ansi-381-record
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_BDB_ANSI_381_RECORD extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Contains the number of bytes in this structure plus the number of bytes of sample image data.
     * @type {Integer}
     */
    BlockLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the number of pixels in a horizontal line of the sample.
     * @type {Integer}
     */
    HorizontalLineLength {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Specifies the number of pixels in a vertical line of the sample.
     * @type {Integer}
     */
    VerticalLineLength {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * A **WINBIO\_BIOMETRIC\_SUBTYPE** value that specifies the finger or palm used to generate the biometric sample. For more information, see Remarks.
     * @type {Integer}
     */
    Position {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * This must be set to one (1);
     * @type {Integer}
     */
    CountOfViews {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * This must be set to one (1);
     * @type {Integer}
     */
    ViewNumber {
        get => NumGet(this, 10, "char")
        set => NumPut("char", value, this, 10)
    }

    /**
     * Reserved. This must be 254 (0xFE).
     * @type {Integer}
     */
    ImageQuality {
        get => NumGet(this, 11, "char")
        set => NumPut("char", value, this, 11)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    ImpressionType {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }

    /**
     * Reserved. Must be set to zero (0).
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 13, "char")
        set => NumPut("char", value, this, 13)
    }
}

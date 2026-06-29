#Requires AutoHotkey v2.1-alpha.26+ 64-bit

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
 */
export default struct WINBIO_BDB_ANSI_381_RECORD {
    #StructPack 4

    /**
     * Contains the number of bytes in this structure plus the number of bytes of sample image data.
     */
    BlockLength : UInt32

    /**
     * Specifies the number of pixels in a horizontal line of the sample.
     */
    HorizontalLineLength : UInt16

    /**
     * Specifies the number of pixels in a vertical line of the sample.
     */
    VerticalLineLength : UInt16

    /**
     * A **WINBIO\_BIOMETRIC\_SUBTYPE** value that specifies the finger or palm used to generate the biometric sample. For more information, see Remarks.
     */
    Position : Int8

    /**
     * This must be set to one (1);
     */
    CountOfViews : Int8

    /**
     * This must be set to one (1);
     */
    ViewNumber : Int8

    /**
     * Reserved. This must be 254 (0xFE).
     */
    ImageQuality : Int8

    /**
     * Reserved.
     */
    ImpressionType : Int8

    /**
     * Reserved. Must be set to zero (0).
     */
    Reserved : Int8

}

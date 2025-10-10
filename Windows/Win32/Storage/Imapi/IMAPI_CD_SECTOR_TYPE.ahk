#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the sector types that can be written to CD media.
 * @remarks
 * 
  * Some sector types are not compatible with other sector types within a single image.  The following are typical examples of this condition:
  * 
  * <ul>
  * <li>If the first track is audio, then all tracks must be audio.</li>
  * <li>If the first track is Mode1, then all tracks must be Mode1.</li>
  * <li>Only the three Mode2 (XA) sectors (Mode 2 Form 0, Mode 2 Form 1, and Mode 2 Form 2) may be mixed within a single disc image, and even then, only with other Mode 2 (XA) sector types.</li>
  * </ul>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2/ne-imapi2-imapi_cd_sector_type
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IMAPI_CD_SECTOR_TYPE{

    /**
     * With this sector type, Audio data has 2352 bytes per sector/frame.  This can be broken down into 588 contiguous samples, each sample being four bytes.  The layout of a single sample matches the 16-bit stereo 44.1KHz WAV file data.  This type of sector has no additional error correcting codes.
     * @type {Integer (Int32)}
     */
    static IMAPI_CD_SECTOR_AUDIO => 0

    /**
     * With this sector type, user data has 2336 bytes per sector/frame.  This seldom-used sector type contains all zero data, and is almost never seen in media today.
     * @type {Integer (Int32)}
     */
    static IMAPI_CD_SECTOR_MODE_ZERO => 1

    /**
     * With this sector type, user data has 2048 bytes per sector/frame.  Mode1 data is the most common data form for pressed CD-ROM media.  This data type also provides the greatest level of ECC/EDC among the standard sector types.
     * @type {Integer (Int32)}
     */
    static IMAPI_CD_SECTOR_MODE1 => 2

    /**
     * With this sector type, user data has 2336 bytes per sector/frame.  All Mode 2 sector types are also known as "CD-ROM XA" modes, which allows mixing of audio and data tracks on a single disc.  This sector type is also known as Mode 2 "Formless", is considered deprecated, and is very seldom used.
     * @type {Integer (Int32)}
     */
    static IMAPI_CD_SECTOR_MODE2FORM0 => 3

    /**
     * With this sector type, user data has 2048 bytes per sector/frame.  All Mode 2 sector types are also known as "CD-ROM XA" modes, which allows mixing of audio and data tracks on a single disc.
     * @type {Integer (Int32)}
     */
    static IMAPI_CD_SECTOR_MODE2FORM1 => 4

    /**
     * With this sector type, user data has 2336 bytes per sector/frame, of which the final four bytes are an optional CRC code (zero if not used).  All Mode 2 sector types are also known as "CD-ROM XA" modes, which allows mixing of audio and data tracks on a single disc.  This sector type is most often used when writing VideoCD discs.
     * @type {Integer (Int32)}
     */
    static IMAPI_CD_SECTOR_MODE2FORM2 => 5

    /**
     * With this sector type, user data has 2352 bytes per sector/frame.  This is pre-processed Mode1Cooked data sectors, with sector header, ECC/EDC, and scrambling already added to the data stream.
     * @type {Integer (Int32)}
     */
    static IMAPI_CD_SECTOR_MODE1RAW => 6

    /**
     * With this sector type, user data has 2352 bytes per sector/frame.  This is pre-processed Mode2Form0 data sectors, with sector header, ECC/EDC, and scrambling already added to the data stream.
     * @type {Integer (Int32)}
     */
    static IMAPI_CD_SECTOR_MODE2FORM0RAW => 7

    /**
     * With this sector type, user data has 2352 bytes per sector/frame.  This is pre-processed Mode2Form1 data sectors, with sector header, ECC/EDC, and scrambling already added to the data stream.
     * @type {Integer (Int32)}
     */
    static IMAPI_CD_SECTOR_MODE2FORM1RAW => 8

    /**
     * With this sector type, user data has 2352 bytes per sector/frame.  This is pre-processed Mode2Form2 data sectors, with sector header, ECC/EDC, and scrambling already added to the data stream.
     * @type {Integer (Int32)}
     */
    static IMAPI_CD_SECTOR_MODE2FORM2RAW => 9
}

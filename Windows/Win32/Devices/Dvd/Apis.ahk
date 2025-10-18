#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 * @version v4.0.30319
 */
class Dvd {

;@region Constants

    /**
     * @type {Integer (Int32)}
     */
    static IOCTL_DVD_BASE => 51

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DVD_START_SESSION => 3362816

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DVD_READ_KEY => 3362820

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DVD_SEND_KEY => 3362824

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DVD_END_SESSION => 3362828

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DVD_SET_READ_AHEAD => 3362832

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DVD_GET_REGION => 3362836

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DVD_SEND_KEY2 => 3395608

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_AACS_READ_MEDIA_KEY_BLOCK_SIZE => 3363008

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_AACS_READ_MEDIA_KEY_BLOCK => 3363012

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_AACS_START_SESSION => 3363016

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_AACS_END_SESSION => 3363020

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_AACS_SEND_CERTIFICATE => 3363024

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_AACS_GET_CERTIFICATE => 3363028

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_AACS_GET_CHALLENGE_KEY => 3363032

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_AACS_SEND_CHALLENGE_KEY => 3363036

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_AACS_READ_VOLUME_ID => 3363040

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_AACS_READ_SERIAL_NUMBER => 3363044

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_AACS_READ_MEDIA_ID => 3363048

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_AACS_READ_BINDING_NONCE => 3363052

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_AACS_GENERATE_BINDING_NONCE => 3395824

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DVD_READ_STRUCTURE => 3363136

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_SET_READ_AHEAD => 2966528

    /**
     * @type {Integer (UInt32)}
     */
    static DVD_CGMS_RESERVED_MASK => 120

    /**
     * @type {Integer (UInt32)}
     */
    static DVD_CGMS_COPY_PROTECT_MASK => 24

    /**
     * @type {Integer (UInt32)}
     */
    static DVD_CGMS_COPY_PERMITTED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DVD_CGMS_COPY_ONCE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DVD_CGMS_NO_COPY => 24

    /**
     * @type {Integer (UInt32)}
     */
    static DVD_COPYRIGHT_MASK => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DVD_NOT_COPYRIGHTED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DVD_COPYRIGHTED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DVD_SECTOR_PROTECT_MASK => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DVD_SECTOR_NOT_PROTECTED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DVD_SECTOR_PROTECTED => 32
;@endregion Constants

;@region Methods
;@endregion Methods
}

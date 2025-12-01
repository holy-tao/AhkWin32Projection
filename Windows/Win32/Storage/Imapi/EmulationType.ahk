#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values for media types that the boot image is intended to emulate.
 * @remarks
 * Other values not defined here may exist. Consumers of this enumeration should not presume this list to be the only set of valid values.
 * 
 * For complete details of these emulation types, see the "El Torito" Bootable CD-ROM format specification at  <a href="https://www.microsoft.com/?ref=go">http://www.phoenix.com/docs/specscdrom.pdf</a>.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/ne-imapi2fs-emulationtype
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class EmulationType extends Win32Enum{

    /**
     * No emulation. The BIOS will not emulate any device type or special sector size for the CD during boot from the CD.
     * @type {Integer (Int32)}
     */
    static EmulationNone => 0

    /**
     * Emulates a 1.2 MB floppy disk.
     * @type {Integer (Int32)}
     */
    static Emulation12MFloppy => 1

    /**
     * Emulates a 1.44 MB floppy disk.
     * @type {Integer (Int32)}
     */
    static Emulation144MFloppy => 2

    /**
     * Emulates a 2.88 MB floppy disk.
     * @type {Integer (Int32)}
     */
    static Emulation288MFloppy => 3

    /**
     * Emulates a hard disk.
     * @type {Integer (Int32)}
     */
    static EmulationHardDisk => 4
}

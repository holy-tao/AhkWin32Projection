#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines values for the operating system architecture that the boot image supports.
 * @remarks
 * Other values not defined here may exist. Consumers of this enumeration should not presume this list to be the only set of valid values.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/ne-imapi2fs-platformid
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class PlatformId{

    /**
     * Intel Pentium™ series of chip sets. This entry implies a Windows  operating system.
     * @type {Integer (Int32)}
     */
    static PlatformX86 => 0

    /**
     * Apple PowerPC family.
     * @type {Integer (Int32)}
     */
    static PlatformPowerPC => 1

    /**
     * Apple Macintosh  family.
     * @type {Integer (Int32)}
     */
    static PlatformMac => 2

    /**
     * EFI Family.
     * @type {Integer (Int32)}
     */
    static PlatformEFI => 239
}

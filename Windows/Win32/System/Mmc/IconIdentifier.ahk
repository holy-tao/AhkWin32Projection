#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The IconIdentifier enumeration is introduced in MMC 1.2.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/ne-mmc-iconidentifier
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IconIdentifier extends Win32Enum{

    /**
     * No icon displayed in error message.
     * @type {Integer (Int32)}
     */
    static Icon_None => 0

    /**
     * Error icon displayed in error message.
     * @type {Integer (Int32)}
     */
    static Icon_Error => 32513

    /**
     * Question icon displayed in error message.
     * @type {Integer (Int32)}
     */
    static Icon_Question => 32514

    /**
     * Warning icon displayed in error message.
     * @type {Integer (Int32)}
     */
    static Icon_Warning => 32515

    /**
     * Information icon displayed in error message.
     * @type {Integer (Int32)}
     */
    static Icon_Information => 32516

    /**
     * Used internally by MMC.
     * @type {Integer (Int32)}
     */
    static Icon_First => 32513

    /**
     * Used internally by MMC.
     * @type {Integer (Int32)}
     */
    static Icon_Last => 32516
}

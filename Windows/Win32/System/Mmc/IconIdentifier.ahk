#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The IconIdentifier enumeration is introduced in MMC 1.2.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/ne-mmc-iconidentifier
 * @namespace Windows.Win32.System.Mmc
 */
class IconIdentifier extends Win32Enum {

    /**
     * No icon displayed in error message.
     * Native name: Icon_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Error icon displayed in error message.
     * Native name: Icon_Error
     * @type {Integer (Int32)}
     */
    static Error => 32513

    /**
     * Question icon displayed in error message.
     * Native name: Icon_Question
     * @type {Integer (Int32)}
     */
    static Question => 32514

    /**
     * Warning icon displayed in error message.
     * Native name: Icon_Warning
     * @type {Integer (Int32)}
     */
    static Warning => 32515

    /**
     * Information icon displayed in error message.
     * Native name: Icon_Information
     * @type {Integer (Int32)}
     */
    static Information => 32516

    /**
     * Used internally by MMC.
     * Native name: Icon_First
     * @type {Integer (Int32)}
     */
    static First => 32513

    /**
     * Used internally by MMC.
     * Native name: Icon_Last
     * @type {Integer (Int32)}
     */
    static Last => 32516
}

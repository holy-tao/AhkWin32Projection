#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the geographical location class.
 * @see https://docs.microsoft.com/windows/win32/api//winnls/ne-winnls-sysgeoclass
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class SYSGEOCLASS{

    /**
     * Class for nation geographical location identifiers.
     * @type {Integer (Int32)}
     */
    static GEOCLASS_NATION => 16

    /**
     * Class for region geographical location identifiers.
     * @type {Integer (Int32)}
     */
    static GEOCLASS_REGION => 14

    /**
     * <b>Starting with Windows 8:</b> Class for all geographical location identifiers.
     * @type {Integer (Int32)}
     */
    static GEOCLASS_ALL => 0
}

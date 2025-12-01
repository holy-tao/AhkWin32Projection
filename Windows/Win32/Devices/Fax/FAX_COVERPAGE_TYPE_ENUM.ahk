#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The FAX_COVERPAGE_TYPE_ENUM enumeration defines whether a cover page template file is a local computer cover page or a server-based cover page. It can also specify that no file is used.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/ne-faxcomex-fax_coverpage_type_enum
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class FAX_COVERPAGE_TYPE_ENUM extends Win32Enum{

    /**
     * No cover page.
     * @type {Integer (Int32)}
     */
    static fcptNONE => 0

    /**
     * Use a cover page from local computer.
     * @type {Integer (Int32)}
     */
    static fcptLOCAL => 1

    /**
     * Use a cover page from the fax server common coverpages folder.
     * @type {Integer (Int32)}
     */
    static fcptSERVER => 2
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DIRECTORY_TYPE enum is used to indicate the type of directory server.
 * @see https://docs.microsoft.com/windows/win32/api//rend/ne-rend-directory_type
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class DIRECTORY_TYPE extends Win32Enum{

    /**
     * Directory type is NTDS.
     * @type {Integer (Int32)}
     */
    static DT_NTDS => 1

    /**
     * Directory type is ILS. The ILS directory type is valid only for Windows 2000 and not for Windows XP.
     * @type {Integer (Int32)}
     */
    static DT_ILS => 2
}

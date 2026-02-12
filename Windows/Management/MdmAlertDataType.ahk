#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * The possible data formats of an MDM alert payload.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.mdmalertdatatype
 * @namespace Windows.Management
 * @version WindowsRuntime 1.4
 */
class MdmAlertDataType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static String => 0

    /**
     * @type {Integer (Int32)}
     */
    static Base64 => 1

    /**
     * @type {Integer (Int32)}
     */
    static Boolean => 2

    /**
     * @type {Integer (Int32)}
     */
    static Integer => 3
}

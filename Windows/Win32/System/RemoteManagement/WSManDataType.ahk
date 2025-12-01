#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the current data type of the union in the WSMAN_DATA structure.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/ne-wsman-wsmandatatype
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSManDataType extends Win32Enum{

    /**
     * The structure is not valid yet.
     * @type {Integer (Int32)}
     */
    static WSMAN_DATA_NONE => 0

    /**
     * The structure contains text.
     * @type {Integer (Int32)}
     */
    static WSMAN_DATA_TYPE_TEXT => 1

    /**
     * The structure contains binary data.
     * @type {Integer (Int32)}
     */
    static WSMAN_DATA_TYPE_BINARY => 2

    /**
     * The structure contains a DWORD integer.
     * @type {Integer (Int32)}
     */
    static WSMAN_DATA_TYPE_DWORD => 4
}

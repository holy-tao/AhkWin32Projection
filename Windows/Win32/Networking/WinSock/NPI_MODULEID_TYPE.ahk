#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class NPI_MODULEID_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MIT_GUID => 1

    /**
     * @type {Integer (Int32)}
     */
    static MIT_IF_LUID => 2
}

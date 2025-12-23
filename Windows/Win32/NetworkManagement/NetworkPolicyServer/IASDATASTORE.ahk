#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The values of the IASDATASTORE enumeration indicate the possible storage locations for SDO data.
 * @remarks
 * You cannot use this enumeration type to specify the storage location for SDO data.
 * @see https://learn.microsoft.com/windows/win32/api/sdoias/ne-sdoias-iasdatastore
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class IASDATASTORE extends Win32Enum{

    /**
     * The SDO data is stored locally on the SDO computer.
     * @type {Integer (Int32)}
     */
    static DATA_STORE_LOCAL => 0

    /**
     * The SDO data is stored in the Active Directory.
     * @type {Integer (Int32)}
     */
    static DATA_STORE_DIRECTORY => 1
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The values of the IASDATASTORE enumeration indicate the possible storage locations for SDO data.
 * @remarks
 * You cannot use this enumeration type to specify the storage location for SDO data.
 * @see https://learn.microsoft.com/windows/win32/api/sdoias/ne-sdoias-iasdatastore
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 */
export default struct IASDATASTORE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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

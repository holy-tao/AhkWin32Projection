#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates the level of a managed service account.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ne-lmaccess-msa_info_level
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct MSA_INFO_LEVEL {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The default level.
     * @type {Integer (Int32)}
     */
    static MsaInfoLevel0 => 0

    /**
     * @type {Integer (Int32)}
     */
    static MsaInfoLevel1 => 1

    /**
     * The maximum level.
     * @type {Integer (Int32)}
     */
    static MsaInfoLevelMax => 2
}

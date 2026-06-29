#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct MPR_ET {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static MPR_ET_None => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MPR_ET_Require => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MPR_ET_RequireMax => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MPR_ET_Optional => 3
}

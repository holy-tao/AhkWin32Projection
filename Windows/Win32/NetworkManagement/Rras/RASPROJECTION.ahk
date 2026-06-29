#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RASPROJECTION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static RASP_Amb => 65536

    /**
     * @type {Integer (Int32)}
     */
    static RASP_PppNbf => 32831

    /**
     * @type {Integer (Int32)}
     */
    static RASP_PppIpx => 32811

    /**
     * @type {Integer (Int32)}
     */
    static RASP_PppIp => 32801

    /**
     * @type {Integer (Int32)}
     */
    static RASP_PppCcp => 33021

    /**
     * @type {Integer (Int32)}
     */
    static RASP_PppLcp => 49185

    /**
     * @type {Integer (Int32)}
     */
    static RASP_PppIpv6 => 32855
}

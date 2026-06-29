#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct eAVEncH263VLevel {
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
    static eAVEncH263VLevel1 => 10

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncH263VLevel2 => 20

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncH263VLevel3 => 30

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncH263VLevel4 => 40

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncH263VLevel4_5 => 45

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncH263VLevel5 => 50

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncH263VLevel6 => 60

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncH263VLevel7 => 70
}

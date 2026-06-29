#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct eAVEncH265VLevel {
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
    static eAVEncH265VLevel1 => 30

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncH265VLevel2 => 60

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncH265VLevel2_1 => 63

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncH265VLevel3 => 90

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncH265VLevel3_1 => 93

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncH265VLevel4 => 120

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncH265VLevel4_1 => 123

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncH265VLevel5 => 150

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncH265VLevel5_1 => 153

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncH265VLevel5_2 => 156

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncH265VLevel6 => 180

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncH265VLevel6_1 => 183

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncH265VLevel6_2 => 186
}

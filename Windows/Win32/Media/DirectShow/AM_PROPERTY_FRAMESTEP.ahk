#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AM_PROPERTY_FRAMESTEP {
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
    static AM_PROPERTY_FRAMESTEP_STEP => 1

    /**
     * @type {Integer (Int32)}
     */
    static AM_PROPERTY_FRAMESTEP_CANCEL => 2

    /**
     * @type {Integer (Int32)}
     */
    static AM_PROPERTY_FRAMESTEP_CANSTEP => 3

    /**
     * @type {Integer (Int32)}
     */
    static AM_PROPERTY_FRAMESTEP_CANSTEPMULTIPLE => 4
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_TIMED_TEXT_BOUTEN_TYPE {
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
    static MF_TIMED_TEXT_BOUTEN_TYPE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_BOUTEN_TYPE_AUTO => 1

    /**
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_BOUTEN_TYPE_FILLEDCIRCLE => 2

    /**
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_BOUTEN_TYPE_OPENCIRCLE => 3

    /**
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_BOUTEN_TYPE_FILLEDDOT => 4

    /**
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_BOUTEN_TYPE_OPENDOT => 5

    /**
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_BOUTEN_TYPE_FILLEDSESAME => 6

    /**
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_BOUTEN_TYPE_OPENSESAME => 7
}

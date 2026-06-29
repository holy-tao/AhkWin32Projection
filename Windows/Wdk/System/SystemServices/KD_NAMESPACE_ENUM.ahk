#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct KD_NAMESPACE_ENUM {
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
    static KdNameSpacePCI => 0

    /**
     * @type {Integer (Int32)}
     */
    static KdNameSpaceACPI => 1

    /**
     * @type {Integer (Int32)}
     */
    static KdNameSpaceAny => 2

    /**
     * @type {Integer (Int32)}
     */
    static KdNameSpaceNone => 3

    /**
     * @type {Integer (Int32)}
     */
    static KdNameSpaceMax => 4
}

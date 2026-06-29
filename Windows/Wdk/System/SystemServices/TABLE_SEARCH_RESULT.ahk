#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct TABLE_SEARCH_RESULT {
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
    static TableEmptyTree => 0

    /**
     * @type {Integer (Int32)}
     */
    static TableFoundNode => 1

    /**
     * @type {Integer (Int32)}
     */
    static TableInsertAsLeft => 2

    /**
     * @type {Integer (Int32)}
     */
    static TableInsertAsRight => 3
}

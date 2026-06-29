#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct stylePointerEvents {
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
    static stylePointerEventsNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static stylePointerEventsVisiblePainted => 1

    /**
     * @type {Integer (Int32)}
     */
    static stylePointerEventsVisibleFill => 2

    /**
     * @type {Integer (Int32)}
     */
    static stylePointerEventsVisibleStroke => 3

    /**
     * @type {Integer (Int32)}
     */
    static stylePointerEventsVisible => 4

    /**
     * @type {Integer (Int32)}
     */
    static stylePointerEventsPainted => 5

    /**
     * @type {Integer (Int32)}
     */
    static stylePointerEventsFill => 6

    /**
     * @type {Integer (Int32)}
     */
    static stylePointerEventsStroke => 7

    /**
     * @type {Integer (Int32)}
     */
    static stylePointerEventsAll => 8

    /**
     * @type {Integer (Int32)}
     */
    static stylePointerEventsNone => 9

    /**
     * @type {Integer (Int32)}
     */
    static stylePointerEventsInitial => 10

    /**
     * @type {Integer (Int32)}
     */
    static stylePointerEventsAuto => 11

    /**
     * @type {Integer (Int32)}
     */
    static stylePointerEvents_Max => 2147483647
}

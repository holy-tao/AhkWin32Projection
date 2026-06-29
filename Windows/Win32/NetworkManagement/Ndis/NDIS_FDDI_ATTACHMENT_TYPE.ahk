#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_FDDI_ATTACHMENT_TYPE {
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
    static NdisFddiTypeIsolated => 1

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiTypeLocalA => 2

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiTypeLocalB => 3

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiTypeLocalAB => 4

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiTypeLocalS => 5

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiTypeWrapA => 6

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiTypeWrapB => 7

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiTypeWrapAB => 8

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiTypeWrapS => 9

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiTypeCWrapA => 10

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiTypeCWrapB => 11

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiTypeCWrapS => 12

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiTypeThrough => 13
}

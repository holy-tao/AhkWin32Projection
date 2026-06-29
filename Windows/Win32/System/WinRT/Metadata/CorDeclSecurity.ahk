#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct CorDeclSecurity {
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
    static dclActionMask => 31

    /**
     * @type {Integer (Int32)}
     */
    static dclActionNil => 0

    /**
     * @type {Integer (Int32)}
     */
    static dclRequest => 1

    /**
     * @type {Integer (Int32)}
     */
    static dclDemand => 2

    /**
     * @type {Integer (Int32)}
     */
    static dclAssert => 3

    /**
     * @type {Integer (Int32)}
     */
    static dclDeny => 4

    /**
     * @type {Integer (Int32)}
     */
    static dclPermitOnly => 5

    /**
     * @type {Integer (Int32)}
     */
    static dclLinktimeCheck => 6

    /**
     * @type {Integer (Int32)}
     */
    static dclInheritanceCheck => 7

    /**
     * @type {Integer (Int32)}
     */
    static dclRequestMinimum => 8

    /**
     * @type {Integer (Int32)}
     */
    static dclRequestOptional => 9

    /**
     * @type {Integer (Int32)}
     */
    static dclRequestRefuse => 10

    /**
     * @type {Integer (Int32)}
     */
    static dclPrejitGrant => 11

    /**
     * @type {Integer (Int32)}
     */
    static dclPrejitDenied => 12

    /**
     * @type {Integer (Int32)}
     */
    static dclNonCasDemand => 13

    /**
     * @type {Integer (Int32)}
     */
    static dclNonCasLinkDemand => 14

    /**
     * @type {Integer (Int32)}
     */
    static dclNonCasInheritance => 15

    /**
     * @type {Integer (Int32)}
     */
    static dclMaximumValue => 15
}

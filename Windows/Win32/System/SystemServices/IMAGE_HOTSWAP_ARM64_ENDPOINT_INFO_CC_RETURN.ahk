#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class IMAGE_HOTSWAP_ARM64_ENDPOINT_INFO_CC_RETURN extends Win32Enum {

    /**
     * Native name: EndpointReturnTypeNone
     * @type {Integer (Int32)}
     */
    static TypeNone => 0

    /**
     * Native name: EndpointReturnTypeX0
     * @type {Integer (Int32)}
     */
    static TypeX0 => 1

    /**
     * Native name: EndpointReturnTypeX0_X1
     * @type {Integer (Int32)}
     */
    static TypeX0_X1 => 2

    /**
     * Native name: EndpointReturnTypeX0_X2
     * @type {Integer (Int32)}
     */
    static TypeX0_X2 => 3

    /**
     * Native name: EndpointReturnTypeX0_X3
     * @type {Integer (Int32)}
     */
    static TypeX0_X3 => 4

    /**
     * Native name: EndpointReturnTypeQ0
     * @type {Integer (Int32)}
     */
    static TypeQ0 => 5

    /**
     * Native name: EndpointReturnTypeQ0_Q1
     * @type {Integer (Int32)}
     */
    static TypeQ0_Q1 => 6

    /**
     * Native name: EndpointReturnTypeQ0_Q2
     * @type {Integer (Int32)}
     */
    static TypeQ0_Q2 => 7

    /**
     * Native name: EndpointReturnTypeQ0_Q3
     * @type {Integer (Int32)}
     */
    static TypeQ0_Q3 => 8

    /**
     * Native name: EndpointReturnTypeX8
     * @type {Integer (Int32)}
     */
    static TypeX8 => 9
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class IMAGE_HOTSWAP_X64_ENDPOINT_INFO_CC_REG extends Win32Enum {

    /**
     * Native name: EndpointParamRegNone
     * @type {Integer (Int32)}
     */
    static ParamRegNone => 0

    /**
     * Native name: EndpointParamRegRAX
     * @type {Integer (Int32)}
     */
    static ParamRegRAX => 1

    /**
     * Native name: EndpointParamRegRCX
     * @type {Integer (Int32)}
     */
    static ParamRegRCX => 2

    /**
     * Native name: EndpointParamRegRDX
     * @type {Integer (Int32)}
     */
    static ParamRegRDX => 3

    /**
     * Native name: EndpointParamRegR8
     * @type {Integer (Int32)}
     */
    static ParamRegR8 => 9

    /**
     * Native name: EndpointParamRegR9
     * @type {Integer (Int32)}
     */
    static ParamRegR9 => 10

    /**
     * Native name: EndpointParamRegXMM0
     * @type {Integer (Int32)}
     */
    static ParamRegXMM0 => 200

    /**
     * Native name: EndpointParamRegXMM1
     * @type {Integer (Int32)}
     */
    static ParamRegXMM1 => 201

    /**
     * Native name: EndpointParamRegXMM2
     * @type {Integer (Int32)}
     */
    static ParamRegXMM2 => 202

    /**
     * Native name: EndpointParamRegXMM3
     * @type {Integer (Int32)}
     */
    static ParamRegXMM3 => 203
}

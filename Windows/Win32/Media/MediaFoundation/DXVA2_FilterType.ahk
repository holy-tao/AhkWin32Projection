#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class DXVA2_FilterType extends Win32Enum {

    /**
     * Native name: DXVA2_NoiseFilterLumaLevel
     * @type {Integer (Int32)}
     */
    static NoiseFilterLumaLevel => 1

    /**
     * Native name: DXVA2_NoiseFilterLumaThreshold
     * @type {Integer (Int32)}
     */
    static NoiseFilterLumaThreshold => 2

    /**
     * Native name: DXVA2_NoiseFilterLumaRadius
     * @type {Integer (Int32)}
     */
    static NoiseFilterLumaRadius => 3

    /**
     * Native name: DXVA2_NoiseFilterChromaLevel
     * @type {Integer (Int32)}
     */
    static NoiseFilterChromaLevel => 4

    /**
     * Native name: DXVA2_NoiseFilterChromaThreshold
     * @type {Integer (Int32)}
     */
    static NoiseFilterChromaThreshold => 5

    /**
     * Native name: DXVA2_NoiseFilterChromaRadius
     * @type {Integer (Int32)}
     */
    static NoiseFilterChromaRadius => 6

    /**
     * Native name: DXVA2_DetailFilterLumaLevel
     * @type {Integer (Int32)}
     */
    static DetailFilterLumaLevel => 7

    /**
     * Native name: DXVA2_DetailFilterLumaThreshold
     * @type {Integer (Int32)}
     */
    static DetailFilterLumaThreshold => 8

    /**
     * Native name: DXVA2_DetailFilterLumaRadius
     * @type {Integer (Int32)}
     */
    static DetailFilterLumaRadius => 9

    /**
     * Native name: DXVA2_DetailFilterChromaLevel
     * @type {Integer (Int32)}
     */
    static DetailFilterChromaLevel => 10

    /**
     * Native name: DXVA2_DetailFilterChromaThreshold
     * @type {Integer (Int32)}
     */
    static DetailFilterChromaThreshold => 11

    /**
     * Native name: DXVA2_DetailFilterChromaRadius
     * @type {Integer (Int32)}
     */
    static DetailFilterChromaRadius => 12
}

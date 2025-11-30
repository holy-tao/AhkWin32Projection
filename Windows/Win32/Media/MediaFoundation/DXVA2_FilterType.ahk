#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVA2_FilterType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_NoiseFilterLumaLevel => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_NoiseFilterLumaThreshold => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_NoiseFilterLumaRadius => 3

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_NoiseFilterChromaLevel => 4

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_NoiseFilterChromaThreshold => 5

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_NoiseFilterChromaRadius => 6

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_DetailFilterLumaLevel => 7

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_DetailFilterLumaThreshold => 8

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_DetailFilterLumaRadius => 9

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_DetailFilterChromaLevel => 10

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_DetailFilterChromaThreshold => 11

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_DetailFilterChromaRadius => 12
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class DXVA2_VPDev extends Win32Enum {

    /**
     * Native name: DXVA2_VPDev_HardwareDevice
     * @type {Integer (Int32)}
     */
    static HardwareDevice => 1

    /**
     * Native name: DXVA2_VPDev_EmulatedDXVA1
     * @type {Integer (Int32)}
     */
    static EmulatedDXVA1 => 2

    /**
     * Native name: DXVA2_VPDev_SoftwareDevice
     * @type {Integer (Int32)}
     */
    static SoftwareDevice => 4

    /**
     * Native name: DXVA2_VPDev_Mask
     * @type {Integer (Int32)}
     */
    static Mask => 7
}

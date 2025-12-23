#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the form factor of a device.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ne-winioctl-storage_device_form_factor
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_DEVICE_FORM_FACTOR extends Win32Enum{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static FormFactorUnknown => 0

    /**
     * 3.5-inch nominal form factor.
     * @type {Integer (Int32)}
     */
    static FormFactor3_5 => 1

    /**
     * 2.5-inch nominal form factor.
     * @type {Integer (Int32)}
     */
    static FormFactor2_5 => 2

    /**
     * 1.8-inch nominal form factor.
     * @type {Integer (Int32)}
     */
    static FormFactor1_8 => 3

    /**
     * Less than 1.8-inch nominal form factor.
     * @type {Integer (Int32)}
     */
    static FormFactor1_8Less => 4

    /**
     * Embedded on board.
     * @type {Integer (Int32)}
     */
    static FormFactorEmbedded => 5

    /**
     * Memory card such as SD, CF.
     * @type {Integer (Int32)}
     */
    static FormFactorMemoryCard => 6

    /**
     * mSATA
     * @type {Integer (Int32)}
     */
    static FormFactormSata => 7

    /**
     * M.2
     * @type {Integer (Int32)}
     */
    static FormFactorM_2 => 8

    /**
     * PCIe card plug into slot.
     * @type {Integer (Int32)}
     */
    static FormFactorPCIeBoard => 9

    /**
     * DIMM slot.
     * @type {Integer (Int32)}
     */
    static FormFactorDimm => 10
}

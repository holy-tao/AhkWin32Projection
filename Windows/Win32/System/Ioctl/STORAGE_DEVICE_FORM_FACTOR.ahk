#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the form factor of a device.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ne-winioctl-storage_device_form_factor
 * @namespace Windows.Win32.System.Ioctl
 */
class STORAGE_DEVICE_FORM_FACTOR extends Win32Enum {

    /**
     * Native name: FormFactorUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * 3.5-inch nominal form factor.
     * Native name: FormFactor3_5
     * @type {Integer (Int32)}
     */
    static Factor3_5 => 1

    /**
     * 2.5-inch nominal form factor.
     * Native name: FormFactor2_5
     * @type {Integer (Int32)}
     */
    static Factor2_5 => 2

    /**
     * 1.8-inch nominal form factor.
     * Native name: FormFactor1_8
     * @type {Integer (Int32)}
     */
    static Factor1_8 => 3

    /**
     * Less than 1.8-inch nominal form factor.
     * Native name: FormFactor1_8Less
     * @type {Integer (Int32)}
     */
    static Factor1_8Less => 4

    /**
     * Embedded on board.
     * Native name: FormFactorEmbedded
     * @type {Integer (Int32)}
     */
    static Embedded => 5

    /**
     * Memory card such as SD, CF.
     * Native name: FormFactorMemoryCard
     * @type {Integer (Int32)}
     */
    static MemoryCard => 6

    /**
     * mSATA
     * Native name: FormFactormSata
     * @type {Integer (Int32)}
     */
    static FactormSata => 7

    /**
     * M.2
     * Native name: FormFactorM_2
     * @type {Integer (Int32)}
     */
    static FactorM_2 => 8

    /**
     * PCIe card plug into slot.
     * Native name: FormFactorPCIeBoard
     * @type {Integer (Int32)}
     */
    static FactorPCIeBoard => 9

    /**
     * DIMM slot.
     * Native name: FormFactorDimm
     * @type {Integer (Int32)}
     */
    static Dimm => 10
}

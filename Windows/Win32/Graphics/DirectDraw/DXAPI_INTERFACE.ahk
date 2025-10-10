#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DXAPI_INTERFACE structure contains the interface callback functions that a video miniport driver implements to support Kernel-Mode Video Transport.
 * @see https://docs.microsoft.com/windows/win32/api//dxmini/ns-dxmini-dxapi_interface
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DXAPI_INTERFACE extends Win32Struct
{
    static sizeof => 136

    static packingSize => 8

    /**
     * Specifies the size in bytes of this DXAPI_INTERFACE structure.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Specifies the version of the video miniport driver's <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/index">DxApi interface</a>. This value is DXAPI_HALVERSION defined in <i>dxmini.h</i>.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Points to the device extension of the device.
     * @type {Pointer<Void>}
     */
    Context {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Unused by the driver.
     * @type {Pointer<Void>}
     */
    InterfaceReference {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Unused by the driver.
     * @type {Pointer<Void>}
     */
    InterfaceDereference {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_getirqinfo">DxGetIRQInfo</a> miniport driver callback function.
     * @type {Pointer<PDX_GETIRQINFO>}
     */
    DxGetIrqInfo {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_enableirq">DxEnableIRQ</a> miniport driver callback function.
     * @type {Pointer<PDX_ENABLEIRQ>}
     */
    DxEnableIrq {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_skipnextfield">DxSkipNextField</a> miniport driver callback function.
     * @type {Pointer<PDX_SKIPNEXTFIELD>}
     */
    DxSkipNextField {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_bobnextfield">DxBobNextField</a> miniport driver callback function.
     * @type {Pointer<PDX_BOBNEXTFIELD>}
     */
    DxBobNextField {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_setstate">DxSetState</a> miniport driver callback function.
     * @type {Pointer<PDX_SETSTATE>}
     */
    DxSetState {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_lock">DxLock</a> miniport driver callback function.
     * @type {Pointer<PDX_LOCK>}
     */
    DxLock {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_flipoverlay">DxFlipOverlay</a> miniport driver callback function.
     * @type {Pointer<PDX_FLIPOVERLAY>}
     */
    DxFlipOverlay {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_flipvideoport">DxFlipVideoPort</a> miniport driver callback function.
     * @type {Pointer<PDX_FLIPVIDEOPORT>}
     */
    DxFlipVideoPort {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_getpolarity">DxGetPolarity</a> miniport driver callback function.
     * @type {Pointer<PDX_GETPOLARITY>}
     */
    DxGetPolarity {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_getcurrentautoflip">DxGetCurrentAutoflip</a> miniport driver callback function.
     * @type {Pointer<PDX_GETCURRENTAUTOFLIP>}
     */
    DxGetCurrentAutoflip {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_getpreviousautoflip">DxGetPreviousAutoflip</a> miniport driver callback function.
     * @type {Pointer<PDX_GETPREVIOUSAUTOFLIP>}
     */
    DxGetPreviousAutoflip {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_transfer">DxTransfer</a> miniport driver callback function.
     * @type {Pointer<PDX_TRANSFER>}
     */
    DxTransfer {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_gettransferstatus">DxGetTransferStatus</a> miniport driver callback function.
     * @type {Pointer<PDX_GETTRANSFERSTATUS>}
     */
    DxGetTransferStatus {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }
}

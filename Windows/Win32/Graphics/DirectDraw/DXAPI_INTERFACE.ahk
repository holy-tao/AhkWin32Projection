#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PDX_BOBNEXTFIELD.ahk" { PDX_BOBNEXTFIELD }
#Import ".\PDX_ENABLEIRQ.ahk" { PDX_ENABLEIRQ }
#Import ".\PDX_FLIPOVERLAY.ahk" { PDX_FLIPOVERLAY }
#Import ".\PDX_FLIPVIDEOPORT.ahk" { PDX_FLIPVIDEOPORT }
#Import ".\PDX_GETCURRENTAUTOFLIP.ahk" { PDX_GETCURRENTAUTOFLIP }
#Import ".\PDX_GETIRQINFO.ahk" { PDX_GETIRQINFO }
#Import ".\PDX_GETPOLARITY.ahk" { PDX_GETPOLARITY }
#Import ".\PDX_GETPREVIOUSAUTOFLIP.ahk" { PDX_GETPREVIOUSAUTOFLIP }
#Import ".\PDX_GETTRANSFERSTATUS.ahk" { PDX_GETTRANSFERSTATUS }
#Import ".\PDX_LOCK.ahk" { PDX_LOCK }
#Import ".\PDX_SETSTATE.ahk" { PDX_SETSTATE }
#Import ".\PDX_SKIPNEXTFIELD.ahk" { PDX_SKIPNEXTFIELD }
#Import ".\PDX_TRANSFER.ahk" { PDX_TRANSFER }

/**
 * The DXAPI_INTERFACE structure contains the interface callback functions that a video miniport driver implements to support Kernel-Mode Video Transport.
 * @see https://learn.microsoft.com/windows/win32/api/dxmini/ns-dxmini-dxapi_interface
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DXAPI_INTERFACE {
    #StructPack 8

    /**
     * Specifies the size in bytes of this DXAPI_INTERFACE structure.
     */
    Size : UInt16

    /**
     * Specifies the version of the video miniport driver's <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/index">DxApi interface</a>. This value is DXAPI_HALVERSION defined in <i>dxmini.h</i>.
     */
    Version : UInt16

    /**
     * Points to the device extension of the device.
     */
    Context : IntPtr

    /**
     * Unused by the driver.
     */
    InterfaceReference : IntPtr

    /**
     * Unused by the driver.
     */
    InterfaceDereference : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_getirqinfo">DxGetIRQInfo</a> miniport driver callback function.
     */
    DxGetIrqInfo : PDX_GETIRQINFO

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_enableirq">DxEnableIRQ</a> miniport driver callback function.
     */
    DxEnableIrq : PDX_ENABLEIRQ

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_skipnextfield">DxSkipNextField</a> miniport driver callback function.
     */
    DxSkipNextField : PDX_SKIPNEXTFIELD

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_bobnextfield">DxBobNextField</a> miniport driver callback function.
     */
    DxBobNextField : PDX_BOBNEXTFIELD

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_setstate">DxSetState</a> miniport driver callback function.
     */
    DxSetState : PDX_SETSTATE

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_lock">DxLock</a> miniport driver callback function.
     */
    DxLock : PDX_LOCK

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_flipoverlay">DxFlipOverlay</a> miniport driver callback function.
     */
    DxFlipOverlay : PDX_FLIPOVERLAY

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_flipvideoport">DxFlipVideoPort</a> miniport driver callback function.
     */
    DxFlipVideoPort : PDX_FLIPVIDEOPORT

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_getpolarity">DxGetPolarity</a> miniport driver callback function.
     */
    DxGetPolarity : PDX_GETPOLARITY

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_getcurrentautoflip">DxGetCurrentAutoflip</a> miniport driver callback function.
     */
    DxGetCurrentAutoflip : PDX_GETCURRENTAUTOFLIP

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_getpreviousautoflip">DxGetPreviousAutoflip</a> miniport driver callback function.
     */
    DxGetPreviousAutoflip : PDX_GETPREVIOUSAUTOFLIP

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_transfer">DxTransfer</a> miniport driver callback function.
     */
    DxTransfer : PDX_TRANSFER

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_gettransferstatus">DxGetTransferStatus</a> miniport driver callback function.
     */
    DxGetTransferStatus : PDX_GETTRANSFERSTATUS

}

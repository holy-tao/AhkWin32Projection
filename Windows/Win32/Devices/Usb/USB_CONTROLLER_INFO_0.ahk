#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USB_CONTROLLER_FLAVOR.ahk" { USB_CONTROLLER_FLAVOR }

/**
 * The USB_CONTROLLER_INFO_0 structure is used with the IOCTL_USB_USER_REQUEST I/O control request to retrieve information about the USB host controller.
 * @remarks
 * The <b>USB_CONTROLLER_INFO_0</b> structure is used with the USBUSER_GET_CONTROLLER_INFO_0 user-mode request. For a description of this request, see <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ni-usbuser-ioctl_usb_user_request">IOCTL_USB_USER_REQUEST</a>.
 * @see https://learn.microsoft.com/windows/win32/api/usbuser/ns-usbuser-usb_controller_info_0
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_CONTROLLER_INFO_0 {
    #StructPack 4

    /**
     * The vendor identifier that is associated with the host controller device.
     */
    PciVendorId : UInt32

    /**
     * The device identifier that is associated with the host controller.
     */
    PciDeviceId : UInt32

    /**
     * The revision number of the host controller device.
     */
    PciRevision : UInt32

    /**
     * The number of root hub ports that the host controller has. 
     * 
     * <div class="alert"><b>Note</b>  In Windows 8, the USB 3.0 driver stack does not include the number of SuperSpeed hubs in the reported <b>NumberOfRootPorts</b> value.</div>
     * <div> </div>
     */
    NumberOfRootPorts : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/usb/ne-usb-_usb_controller_flavor">USB_CONTROLLER_FLAVOR</a>-typed enumerator  that specifies the type of controller.
     */
    ControllerFlavor : USB_CONTROLLER_FLAVOR

    /**
     * A bitwise OR of some combination of the following host controller feature flags.
     * 
     * <table>
     * <tr>
     * <th>Host controller feature</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * USB_HC_FEATURE_FLAG_PORT_POWER_SWITCHING
     * 
     * </td>
     * <td>
     * Power switching is enabled on the host controller. This flag allows powering of hot-plug devices.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * USB_HC_FEATURE_FLAG_SEL_SUSPEND
     * 
     * </td>
     * <td>
     * Selective suspend is enabled on the host controller.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * USB_HC_FEATURE_LEGACY_BIOS
     * 
     * </td>
     * <td>
     * The host controller has a legacy BIOS.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  In Windows 8, the underlying USB 3.0 driver stack does not set any host controller feature flags in <b>HcFeatureFlags.</b></div>
     * <div> </div>
     */
    HcFeatureFlags : UInt32

}

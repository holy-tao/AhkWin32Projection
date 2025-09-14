#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Describes info that PnP uses to create the software device.
 * @remarks
 * You can only specify this info at creation time, and you can't later call the Software Device API to modify this info, by setting properties, for example.
 * @see https://learn.microsoft.com/windows/win32/api/swdevicedef/ns-swdevicedef-sw_device_create_info
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 * @version v4.0.30319
 */
class SW_DEVICE_CREATE_INFO extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * The size in bytes of this structure. Use it as a version field.  Initialize it to sizeof(SW_DEVICE_CREATE_INFO).
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A string that represents the instance ID portion of the device instance ID. This value is used for <a href="https://docs.microsoft.com/windows-hardware/drivers/kernel/irp-mn-query-id">IRP_MN_QUERY_ID</a> <b>BusQueryInstanceID</b>.  Because all software devices are considered "UniqueId" devices, this string must be a unique name for all devices on this software device enumerator.  For more info, see <a href="https://docs.microsoft.com/windows-hardware/drivers/install/instance-ids">Instance IDs</a>.
     * @type {Pointer<PWSTR>}
     */
    pszInstanceId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A list of strings for the hardware IDs for the software device. This value is used for <a href="https://docs.microsoft.com/windows-hardware/drivers/kernel/irp-mn-query-id">IRP_MN_QUERY_ID</a> <b>BusQueryHardwareIDs</b>.  If a client expects a driver or device metadata to bind to the device, the client specifies hardware IDs.
     * @type {Pointer<PWSTR>}
     */
    pszzHardwareIds {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A list of strings for the compatible IDs for the software device. This value is used for <a href="https://docs.microsoft.com/windows-hardware/drivers/kernel/irp-mn-query-id">IRP_MN_QUERY_ID</a> <b>BusQueryCompatibleIDs</b>.  If a client expects a class driver to load, the client specifies compatible IDs that match the class driver.  If a driver isn't needed, we recommend to specify a compatible ID to classify the type of software device.  In addition to the compatible IDs specified in this member, SWD\Generic and possibly SWD\GenericRaw will always be added as the least specific compatible IDs.
     * @type {Pointer<PWSTR>}
     */
    pszzCompatibleIds {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A value that is used to control the base container ID for the software device.  This value will be used for <a href="https://docs.microsoft.com/windows-hardware/drivers/kernel/irp-mn-query-id">IRP_MN_QUERY_ID</a> <b>BusQueryContainerIDs</b>.  For typical situations, we recommend to set this member to <b>NULL</b> and use the <b>SWDeviceCapabilitiesRemovable</b> flag to control whether the device inherits the parent's container ID or if PnP assigns a new random container ID.  If the client needs to explicitly control the container ID, specify a <b>GUID</b> in the variable that this member points to.
     * @type {Pointer<Guid>}
     */
    pContainerId {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A combination of <b>SW_DEVICE_CAPABILITIES</b> values that are combined by using a bitwise OR operation. The resulting value specifies capabilities of the software device. The capability that you can specify when you create a software device are a subset of the capabilities that a bus driver can specify by using the <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/wdm/ns-wdm-_device_capabilities"><b>DEVICE_CAPABILTIES</b></a> structure.  Only capabilities that make sense to allow changing for a software only device are supported.  The rest receive appropriate default values. Here are possible values:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SWDeviceCapabilitiesNone"></a><a id="swdevicecapabilitiesnone"></a><a id="SWDEVICECAPABILITIESNONE"></a><dl>
     * <dt><b>SWDeviceCapabilitiesNone</b></dt>
     * <dt>0x00000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No capabilities have been specified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SWDeviceCapabilitiesRemovable"></a><a id="swdevicecapabilitiesremovable"></a><a id="SWDEVICECAPABILITIESREMOVABLE"></a><dl>
     * <dt><b>SWDeviceCapabilitiesRemovable</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This bit specifies that the device is removable from its parent.  Setting this flag is equivalent to a bus driver setting the <b>Removable</b> member of the <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/wdm/ns-wdm-_device_capabilities"><b>DEVICE_CAPABILTIES</b></a> structure for a PDO.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SWDeviceCapabilitiesSilentInstall"></a><a id="swdevicecapabilitiessilentinstall"></a><a id="SWDEVICECAPABILITIESSILENTINSTALL"></a><dl>
     * <dt><b>SWDeviceCapabilitiesSilentInstall</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This bit suppresses UI that would normally be shown during installation.  Setting this flag is equivalent to a bus driver setting the <b>SilentInstall</b> member of the <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/wdm/ns-wdm-_device_capabilities"><b>DEVICE_CAPABILTIES</b></a> structure for a PDO.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SWDeviceCapabilitiesNoDisplayInUI"></a><a id="swdevicecapabilitiesnodisplayinui"></a><a id="SWDEVICECAPABILITIESNODISPLAYINUI"></a><dl>
     * <dt><b>SWDeviceCapabilitiesNoDisplayInUI</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This bit prevents the device from being displayed in some UI.  Setting this flag is equivalent to a bus driver setting the <b>NoDisplayInUI</b> member of the <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/wdm/ns-wdm-_device_capabilities"><b>DEVICE_CAPABILTIES</b></a> structure for a PDO.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SWDeviceCapabilitiesDriverRequired"></a><a id="swdevicecapabilitiesdriverrequired"></a><a id="SWDEVICECAPABILITIESDRIVERREQUIRED"></a><dl>
     * <dt><b>SWDeviceCapabilitiesDriverRequired</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specify this bit when the client wants a driver to be loaded on the device and when this driver is required for correct function of the client’s feature.
     * 
     * When this bit is specified, at least one of <b>pszzHardwareIds</b> or <b>pszzCompatibleIds</b> must be filled in.
     * 
     *   If this bit is specified and if a driver can't be found, the device shows a yellow bang in <b>Device Manager</b> to indicate that the device has a problem, and Troubleshooters flag this as a device with a problem.  Setting this bit is equivalent to a bus driver not setting the <b>RawDeviceOK</b> member of the <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/wdm/ns-wdm-_device_capabilities"><b>DEVICE_CAPABILTIES</b></a> structure for a PDO.
     * 
     * When this bit is specified, the driver owns creating interfaces for the device, and you can't call <a href="https://docs.microsoft.com/windows/desktop/api/swdevice/nf-swdevice-swdeviceinterfaceregister">SwDeviceInterfaceRegister</a> for the device.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    CapabilityFlags {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * A string that contains the text that is displayed for the device name in the UI. This value is used for <a href="https://docs.microsoft.com/windows-hardware/drivers/kernel/irp-mn-query-device-text">IRP_MN_QUERY_DEVICE_TEXT</a> <b>DeviceTextDescription</b>.  
     * 
     * <div class="alert"><b>Note</b>  <p class="note">When an INF is matched against the device, the name from the INF overrides this name unless steps are taken to preserve this name.
     * 
     * <p class="note">We recommend that this string be a reference to a localizable resource. For the syntax of referencing resources, see <a href="https://docs.microsoft.com/windows-hardware/drivers/install/devprop-type-string-indirect">DEVPROP_TYPE_STRING_INDIRECT</a>. 
     * 
     * </div>
     * <div> </div>
     * @type {Pointer<PWSTR>}
     */
    pszDeviceDescription {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * A string that contains the text that is displayed for the device location in the UI.  This value is used for <a href="https://docs.microsoft.com/windows-hardware/drivers/kernel/irp-mn-query-device-text">IRP_MN_QUERY_DEVICE_TEXT</a> <b>DeviceTextLocationInformation</b>.  
     * 
     * <div class="alert"><b>Note</b>  Specifying a location is uncommon.</div>
     * <div> </div>
     * @type {Pointer<PWSTR>}
     */
    pszDeviceLocation {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure that contains the security information associated with the software device. If this member is <b>NULL</b>, the <a href="https://docs.microsoft.com/windows-hardware/drivers/kernel/windows-kernel-mode-i-o-manager">I/O Manager</a> assigns the default security descriptor to the device.  If a custom security descriptor is needed, specify a self-relative security descriptor.
     * @type {Pointer<SECURITY_DESCRIPTOR>}
     */
    pSecurityDescriptor {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 72
    }
}

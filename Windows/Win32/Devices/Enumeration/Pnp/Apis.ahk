#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Handle.ahk
/**
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 * @version v4.0.30319
 */
class Pnp {

;@region Constants

    /**
     * @type {Integer (Int32)}
     */
    static UPNP_E_ROOT_ELEMENT_EXPECTED => -2147220992

    /**
     * @type {Integer (Int32)}
     */
    static UPNP_E_DEVICE_ELEMENT_EXPECTED => -2147220991

    /**
     * @type {Integer (Int32)}
     */
    static UPNP_E_SERVICE_ELEMENT_EXPECTED => -2147220990

    /**
     * @type {Integer (Int32)}
     */
    static UPNP_E_SERVICE_NODE_INCOMPLETE => -2147220989

    /**
     * @type {Integer (Int32)}
     */
    static UPNP_E_DEVICE_NODE_INCOMPLETE => -2147220988

    /**
     * @type {Integer (Int32)}
     */
    static UPNP_E_ICON_ELEMENT_EXPECTED => -2147220987

    /**
     * @type {Integer (Int32)}
     */
    static UPNP_E_ICON_NODE_INCOMPLETE => -2147220986

    /**
     * @type {Integer (Int32)}
     */
    static UPNP_E_INVALID_ACTION => -2147220985

    /**
     * @type {Integer (Int32)}
     */
    static UPNP_E_INVALID_ARGUMENTS => -2147220984

    /**
     * @type {Integer (Int32)}
     */
    static UPNP_E_OUT_OF_SYNC => -2147220983

    /**
     * @type {Integer (Int32)}
     */
    static UPNP_E_ACTION_REQUEST_FAILED => -2147220976

    /**
     * @type {Integer (Int32)}
     */
    static UPNP_E_TRANSPORT_ERROR => -2147220975

    /**
     * @type {Integer (Int32)}
     */
    static UPNP_E_VARIABLE_VALUE_UNKNOWN => -2147220974

    /**
     * @type {Integer (Int32)}
     */
    static UPNP_E_INVALID_VARIABLE => -2147220973

    /**
     * @type {Integer (Int32)}
     */
    static UPNP_E_DEVICE_ERROR => -2147220972

    /**
     * @type {Integer (Int32)}
     */
    static UPNP_E_PROTOCOL_ERROR => -2147220971

    /**
     * @type {Integer (Int32)}
     */
    static UPNP_E_ERROR_PROCESSING_RESPONSE => -2147220970

    /**
     * @type {Integer (Int32)}
     */
    static UPNP_E_DEVICE_TIMEOUT => -2147220969

    /**
     * @type {Integer (Int32)}
     */
    static UPNP_E_INVALID_DOCUMENT => -2147220224

    /**
     * @type {Integer (Int32)}
     */
    static UPNP_E_EVENT_SUBSCRIPTION_FAILED => -2147220223

    /**
     * @type {Integer (UInt32)}
     */
    static FAULT_INVALID_ACTION => 401

    /**
     * @type {Integer (UInt32)}
     */
    static FAULT_INVALID_ARG => 402

    /**
     * @type {Integer (UInt32)}
     */
    static FAULT_INVALID_SEQUENCE_NUMBER => 403

    /**
     * @type {Integer (UInt32)}
     */
    static FAULT_INVALID_VARIABLE => 404

    /**
     * @type {Integer (UInt32)}
     */
    static FAULT_DEVICE_INTERNAL_ERROR => 501

    /**
     * @type {Integer (UInt32)}
     */
    static FAULT_ACTION_SPECIFIC_BASE => 600

    /**
     * @type {Integer (UInt32)}
     */
    static FAULT_ACTION_SPECIFIC_MAX => 899

    /**
     * @type {Integer (Int32)}
     */
    static UPNP_E_ACTION_SPECIFIC_BASE => -2147220736

    /**
     * @type {Integer (UInt32)}
     */
    static UPNP_ADDRESSFAMILY_IPv4 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static UPNP_ADDRESSFAMILY_IPv6 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static UPNP_ADDRESSFAMILY_BOTH => 3

    /**
     * @type {Integer (UInt32)}
     */
    static UPNP_SERVICE_DELAY_SCPD_AND_SUBSCRIPTION => 1

    /**
     * @type {Integer (Int32)}
     */
    static UPNP_E_REQUIRED_ELEMENT_ERROR => -2147180512

    /**
     * @type {Integer (Int32)}
     */
    static UPNP_E_DUPLICATE_NOT_ALLOWED => -2147180511

    /**
     * @type {Integer (Int32)}
     */
    static UPNP_E_DUPLICATE_SERVICE_ID => -2147180510

    /**
     * @type {Integer (Int32)}
     */
    static UPNP_E_INVALID_DESCRIPTION => -2147180509

    /**
     * @type {Integer (Int32)}
     */
    static UPNP_E_INVALID_SERVICE => -2147180508

    /**
     * @type {Integer (Int32)}
     */
    static UPNP_E_INVALID_ICON => -2147180507

    /**
     * @type {Integer (Int32)}
     */
    static UPNP_E_INVALID_XML => -2147180506

    /**
     * @type {Integer (Int32)}
     */
    static UPNP_E_INVALID_ROOT_NAMESPACE => -2147180505

    /**
     * @type {Integer (Int32)}
     */
    static UPNP_E_SUFFIX_TOO_LONG => -2147180504

    /**
     * @type {Integer (Int32)}
     */
    static UPNP_E_URLBASE_PRESENT => -2147180503

    /**
     * @type {Integer (Int32)}
     */
    static UPNP_E_VALUE_TOO_LONG => -2147180496

    /**
     * @type {Integer (Int32)}
     */
    static UPNP_E_DEVICE_RUNNING => -2147180495

    /**
     * @type {Integer (Int32)}
     */
    static UPNP_E_DEVICE_NOTREGISTERED => -2147180494

    /**
     * @type {String}
     */
    static REMOTE_ADDRESS_VALUE_NAME => "RemoteAddress"

    /**
     * @type {String}
     */
    static ADDRESS_FAMILY_VALUE_NAME => "AddressFamily"
;@endregion Constants

;@region Methods
    /**
     * Initiates the enumeration of a software device.
     * @param {PWSTR} pszEnumeratorName A string that names the enumerator of the software device.  Choose a name that represents the component that enumerates the devices.
     * @param {PWSTR} pszParentDeviceInstance A string that specifies the device instance ID of the device that is the parent of the software device.
     * 
     * This can be HTREE\ROOT\0, but we recommend to keep children of the root device to a minimum.  We also recommend that the preferred parent of a software device be a real device that the software device is extending the functionality for.  In situations where a software device doesn't have such a natural parent, create a device as a child of the root that can collect all the software devices that a component will enumerate; then, enumerate the actual software devices as children of this device grouping node.  This keeps the children of the root device to a manageable number.
     * @param {Pointer<SW_DEVICE_CREATE_INFO>} pCreateInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/swdevicedef/ns-swdevicedef-sw_device_create_info">SW_DEVICE_CREATE_INFO</a> structure that describes info that PnP uses to create the device.
     * @param {Integer} cPropertyCount The number of <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/dn315030(v=vs.85)">DEVPROPERTY</a> structures in the <i>pProperties</i> array.
     * @param {Pointer<DEVPROPERTY>} pProperties An optional array of <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/dn315030(v=vs.85)">DEVPROPERTY</a> structures.  These properties are set on the device after it is created but before a notification that the device has been created are sent.  For more info, see Remarks.  This pointer can be <b>NULL</b>.
     * @param {Pointer<SW_DEVICE_CREATE_CALLBACK>} pCallback The <a href="https://docs.microsoft.com/windows/desktop/api/swdevice/nc-swdevice-sw_device_create_callback">SW_DEVICE_CREATE_CALLBACK</a> callback function that the operating system calls after PnP enumerates the device.
     * @param {Pointer<Void>} pContext An optional client context that the operating system passes to the callback function. This pointer can be <b>NULL</b>.
     * @param {Pointer<HSWDEVICE>} phSwDevice A pointer to a variable that receives the <b>HSWDEVICE</b> handle that represents the device.  Call <a href="https://docs.microsoft.com/windows/desktop/api/swdevice/nf-swdevice-swdeviceclose">SwDeviceClose</a> to close this handle after the client app wants PnP to remove the device.
     * 
     * <pre class="syntax" xml:space="preserve"><code>
     * DECLARE_HANDLE(HSWDEVICE);
     * typedef HSWDEVICE *PHSWDEVICE;
     * </code></pre>
     * @returns {HRESULT} S_OK is returned if device enumeration was successfully initiated.  This does not mean that the device has been successfully enumerated.  Check the <i>CreateResult</i> parameter of the <a href="/windows/desktop/api/swdevice/nc-swdevice-sw_device_create_callback">SW_DEVICE_CREATE_CALLBACK</a> callback function to determine if the device was successfully enumerated.
     * @see https://docs.microsoft.com/windows/win32/api//swdevice/nf-swdevice-swdevicecreate
     * @since windows8.0
     */
    static SwDeviceCreate(pszEnumeratorName, pszParentDeviceInstance, pCreateInfo, cPropertyCount, pProperties, pCallback, pContext, phSwDevice) {
        pszEnumeratorName := pszEnumeratorName is String ? StrPtr(pszEnumeratorName) : pszEnumeratorName
        pszParentDeviceInstance := pszParentDeviceInstance is String ? StrPtr(pszParentDeviceInstance) : pszParentDeviceInstance

        result := DllCall("CFGMGR32.dll\SwDeviceCreate", "ptr", pszEnumeratorName, "ptr", pszParentDeviceInstance, "ptr", pCreateInfo, "uint", cPropertyCount, "ptr", pProperties, "ptr", pCallback, "ptr", pContext, "ptr", phSwDevice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Closes the software device handle. When the handle is closed, PnP will initiate the process of removing the device.
     * @remarks
     * 
     * After <b>SwDeviceClose</b> returns, the operating system is guaranteed to not call the <a href="https://docs.microsoft.com/windows/desktop/api/swdevice/nc-swdevice-sw_device_create_callback">SW_DEVICE_CREATE_CALLBACK</a> callback function, and any calls to Software Device API functions that were in progress are  guaranteed to have completed.
     * 
     * You can call <b>SwDeviceClose</b> at any time even if the callback function hasn't been called yet.
     * 
     * In Windows 8, you can't call <b>SwDeviceClose</b> inside the <a href="https://docs.microsoft.com/windows/desktop/api/swdevice/nc-swdevice-sw_device_create_callback">SW_DEVICE_CREATE_CALLBACK</a> callback function.  Doing so will cause a deadlock.  Be careful of releasing a ref counted object that will call <b>SwDeviceClose</b> when its destructor runs.  In Windows 8.1, this restriction is lifted, and you can call <b>SwDeviceClose</b> inside the callback function.
     * 
     * By calling <b>SwDeviceClose</b>, you initiate the process of removing a device from PnP.  The call to <b>SwDeviceClose</b> returns before this removal is complete.  But you can safely call <a href="https://docs.microsoft.com/windows/desktop/api/swdevice/nf-swdevice-swdevicecreate">SwDeviceCreate</a> immediately  after <b>SwDeviceClose</b>.  The new create will be queued until the previous removal processing completes, and then the device will be re-created.
     * 
     * PnP removal makes the device "Not present." PnP removal of a device is the same us unplugging a USB device.  All the persisted property state for the device remains in memory.
     * 
     * 
     * @param {HSWDEVICE} hSwDevice The <b>HSWDEVICE</b> handle to close.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//swdevice/nf-swdevice-swdeviceclose
     * @since windows8.0
     */
    static SwDeviceClose(hSwDevice) {
        hSwDevice := hSwDevice is Win32Handle ? NumGet(hSwDevice, "ptr") : hSwDevice

        DllCall("CFGMGR32.dll\SwDeviceClose", "ptr", hSwDevice)
    }

    /**
     * Manages the lifetime of a software device.
     * @param {HSWDEVICE} hSwDevice The <b>HSWDEVICE</b> handle to the software device to manage.
     * @param {Integer} Lifetime A <b>SW_DEVICE_LIFETIME</b>-typed value that indicates the new lifetime value for the software device. Here are possible values:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SWDeviceLifetimeHandle"></a><a id="swdevicelifetimehandle"></a><a id="SWDEVICELIFETIMEHANDLE"></a><dl>
     * <dt><b>SWDeviceLifetimeHandle</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the lifetime of the software device is determined by the lifetime of the handle that is associated with the software device.  As long as the handle is open, the software device is enumerated by PnP.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SWDeviceLifetimeParentPresent"></a><a id="swdevicelifetimeparentpresent"></a><a id="SWDEVICELIFETIMEPARENTPRESENT"></a><dl>
     * <dt><b>SWDeviceLifetimeParentPresent</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the lifetime of the software device is tied to the lifetime of its parent. 
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} S_OK is returned if <b>SwDeviceSetLifetime</b> successfully updated the lifetime.
     * @see https://docs.microsoft.com/windows/win32/api//swdevice/nf-swdevice-swdevicesetlifetime
     * @since windows8.1
     */
    static SwDeviceSetLifetime(hSwDevice, Lifetime) {
        hSwDevice := hSwDevice is Win32Handle ? NumGet(hSwDevice, "ptr") : hSwDevice

        result := DllCall("CFGMGR32.dll\SwDeviceSetLifetime", "ptr", hSwDevice, "int", Lifetime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets the lifetime of a software device.
     * @param {HSWDEVICE} hSwDevice The <b>HSWDEVICE</b> handle to the software device to retrieve.
     * @param {Pointer<Int32>} pLifetime A pointer to a variable that receives a <b>SW_DEVICE_LIFETIME</b>-typed value that indicates the current lifetime value for the software device. Here are possible values:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SWDeviceLifetimeHandle"></a><a id="swdevicelifetimehandle"></a><a id="SWDEVICELIFETIMEHANDLE"></a><dl>
     * <dt><b>SWDeviceLifetimeHandle</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the lifetime of the software device is determined by the lifetime of the handle that is associated with the software device.  As long as the handle is open, the software device is enumerated by PnP.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SWDeviceLifetimeParentPresent"></a><a id="swdevicelifetimeparentpresent"></a><a id="SWDEVICELIFETIMEPARENTPRESENT"></a><dl>
     * <dt><b>SWDeviceLifetimeParentPresent</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the lifetime of the software device is tied to the lifetime of its parent. 
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} S_OK is returned if <a href="/windows/desktop/api/swdevice/nf-swdevice-swdevicesetlifetime">SwDeviceSetLifetime</a> successfully retrieved the lifetime.
     * @see https://docs.microsoft.com/windows/win32/api//swdevice/nf-swdevice-swdevicegetlifetime
     * @since windows8.1
     */
    static SwDeviceGetLifetime(hSwDevice, pLifetime) {
        hSwDevice := hSwDevice is Win32Handle ? NumGet(hSwDevice, "ptr") : hSwDevice

        result := DllCall("CFGMGR32.dll\SwDeviceGetLifetime", "ptr", hSwDevice, "int*", pLifetime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets properties on a software device.
     * @param {HSWDEVICE} hSwDevice The <b>HSWDEVICE</b> handle to the software device to set properties for.
     * @param {Integer} cPropertyCount The number of <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/dn315030(v=vs.85)">DEVPROPERTY</a> structures in the <i>pProperties</i> array.
     * @param {Pointer<DEVPROPERTY>} pProperties An array of <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/dn315030(v=vs.85)">DEVPROPERTY</a> structures containing the properties to set.
     * @returns {HRESULT} S_OK is returned if <b>SwDevicePropertySet</b> successfully set the properties; otherwise, an appropriate error value.
     * @see https://docs.microsoft.com/windows/win32/api//swdevice/nf-swdevice-swdevicepropertyset
     * @since windows8.0
     */
    static SwDevicePropertySet(hSwDevice, cPropertyCount, pProperties) {
        hSwDevice := hSwDevice is Win32Handle ? NumGet(hSwDevice, "ptr") : hSwDevice

        result := DllCall("CFGMGR32.dll\SwDevicePropertySet", "ptr", hSwDevice, "uint", cPropertyCount, "ptr", pProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Registers a device interface for a software device and optionally sets properties on that interface.
     * @param {HSWDEVICE} hSwDevice The <b>HSWDEVICE</b> handle to the software device to register a device interface for.
     * @param {Pointer<Guid>} pInterfaceClassGuid A pointer to the interface class GUID that names the contract that this interface implements.
     * @param {PWSTR} pszReferenceString An optional reference string that differentiates multiple interfaces of the same class for this device.  This pointer can be <b>NULL</b>.
     * @param {Integer} cPropertyCount The number of <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/dn315030(v=vs.85)">DEVPROPERTY</a> structures in the <i>pProperties</i> array.
     * @param {Pointer<DEVPROPERTY>} pProperties An optional array of <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/dn315030(v=vs.85)">DEVPROPERTY</a> structures for the properties to set on the interface.  This pointer can be <b>NULL</b>.
     * 
     * Set these properties on the interface after it is created but before a notification that the interface has been created are sent.  For more info, see Remarks.  This pointer can be <b>NULL</b>.
     * @param {BOOL} fEnabled A Boolean value that indicates whether to either enable or disable  the interface. <b>TRUE</b> to enable; <b>FALSE</b> to disable.
     * @param {Pointer<PWSTR>} ppszDeviceInterfaceId A pointer to a variable that receives a pointer to the device interface ID for the interface. The caller must free this value with <a href="https://docs.microsoft.com/windows/desktop/api/swdevice/nf-swdevice-swmemfree">SwMemFree</a>.  This value can be <b>NULL</b> if the client app doesn't need to retrieve the name.
     * @returns {HRESULT} S_OK is returned if <b>SwDeviceInterfaceRegister</b> successfully registered the interface; otherwise, an appropriate error value.
     * @see https://docs.microsoft.com/windows/win32/api//swdevice/nf-swdevice-swdeviceinterfaceregister
     * @since windows8.0
     */
    static SwDeviceInterfaceRegister(hSwDevice, pInterfaceClassGuid, pszReferenceString, cPropertyCount, pProperties, fEnabled, ppszDeviceInterfaceId) {
        pszReferenceString := pszReferenceString is String ? StrPtr(pszReferenceString) : pszReferenceString
        hSwDevice := hSwDevice is Win32Handle ? NumGet(hSwDevice, "ptr") : hSwDevice

        result := DllCall("CFGMGR32.dll\SwDeviceInterfaceRegister", "ptr", hSwDevice, "ptr", pInterfaceClassGuid, "ptr", pszReferenceString, "uint", cPropertyCount, "ptr", pProperties, "int", fEnabled, "ptr", ppszDeviceInterfaceId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Frees memory that other Software Device API functions allocated.
     * @param {Pointer<Void>} pMem A pointer to the block of memory to free.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//swdevice/nf-swdevice-swmemfree
     * @since windows8.0
     */
    static SwMemFree(pMem) {
        DllCall("CFGMGR32.dll\SwMemFree", "ptr", pMem)
    }

    /**
     * Enables or disables a device interface for a software device.
     * @param {HSWDEVICE} hSwDevice The <b>HSWDEVICE</b> handle to the software device to register a device interface for.
     * @param {PWSTR} pszDeviceInterfaceId A string that identifies the interface to enable or disable.
     * @param {BOOL} fEnabled A Boolean value that indicates whether to either enable or disable  the interface. <b>TRUE</b> to enable; <b>FALSE</b> to disable.
     * @returns {HRESULT} S_OK is returned if <b>SwDeviceInterfaceSetState</b> successfully enabled or disabled the interface; otherwise, an appropriate error value.
     * @see https://docs.microsoft.com/windows/win32/api//swdevice/nf-swdevice-swdeviceinterfacesetstate
     * @since windows8.0
     */
    static SwDeviceInterfaceSetState(hSwDevice, pszDeviceInterfaceId, fEnabled) {
        pszDeviceInterfaceId := pszDeviceInterfaceId is String ? StrPtr(pszDeviceInterfaceId) : pszDeviceInterfaceId
        hSwDevice := hSwDevice is Win32Handle ? NumGet(hSwDevice, "ptr") : hSwDevice

        result := DllCall("CFGMGR32.dll\SwDeviceInterfaceSetState", "ptr", hSwDevice, "ptr", pszDeviceInterfaceId, "int", fEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets properties on a software device interface.
     * @param {HSWDEVICE} hSwDevice The <b>HSWDEVICE</b> handle to the software device of the interface to set properties for.
     * @param {PWSTR} pszDeviceInterfaceId A string that identifies the interface to set properties on.
     * @param {Integer} cPropertyCount The number of <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/dn315030(v=vs.85)">DEVPROPERTY</a> structures in the <i>pProperties</i> array.
     * @param {Pointer<DEVPROPERTY>} pProperties An array of <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/dn315030(v=vs.85)">DEVPROPERTY</a> structures containing the properties to set on the interface.
     * @returns {HRESULT} S_OK is returned if <b>SwDeviceInterfacePropertySet</b> successfully set the properties on the interface; otherwise, an appropriate error value.
     * @see https://docs.microsoft.com/windows/win32/api//swdevice/nf-swdevice-swdeviceinterfacepropertyset
     * @since windows8.0
     */
    static SwDeviceInterfacePropertySet(hSwDevice, pszDeviceInterfaceId, cPropertyCount, pProperties) {
        pszDeviceInterfaceId := pszDeviceInterfaceId is String ? StrPtr(pszDeviceInterfaceId) : pszDeviceInterfaceId
        hSwDevice := hSwDevice is Win32Handle ? NumGet(hSwDevice, "ptr") : hSwDevice

        result := DllCall("CFGMGR32.dll\SwDeviceInterfacePropertySet", "ptr", hSwDevice, "ptr", pszDeviceInterfaceId, "uint", cPropertyCount, "ptr", pProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}

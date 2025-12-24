#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enumerates devices that are connected to the computer and provides a simple way to request installation information, including manufacturer, friendly name, and description.
 * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nn-portabledeviceapi-iportabledevicemanager
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IPortableDeviceManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPortableDeviceManager
     * @type {Guid}
     */
    static IID => Guid("{a1567595-4c2f-4574-a6fa-ecef917b9a40}")

    /**
     * The class identifier for PortableDeviceManager
     * @type {Guid}
     */
    static CLSID => Guid("{0af10cec-2ecd-4b92-9581-34f6ae0637f3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDevices", "RefreshDeviceList", "GetDeviceFriendlyName", "GetDeviceDescription", "GetDeviceManufacturer", "GetDeviceProperty", "GetPrivateDevices"]

    /**
     * Retrieves a list of portable devices connected to the computer.
     * @param {Pointer<PWSTR>} pPnPDeviceIDs A caller-allocated array of string pointers that holds the Plug and Play names of all of the connected devices. To learn the required size for this parameter, first call this method with this parameter set to <b>NULL</b> and <i>pcPnPDeviceIDs</i> set to zero, and then allocate a buffer according to the value retrieved by <i>pcPnPDeviceIDs</i>. These names can be used by <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nf-portabledeviceapi-iportabledevice-open">IPortableDevice::Open</a> to create a connection to a device.
     * @param {Pointer<Integer>} pcPnPDeviceIDs On input, the number of values that <i>pPnPDeviceIDs</i> can hold. On output, a pointer to the number of devices actually written to <i>pPnPDeviceIDs</i>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one of the required arguments was a <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pPnPDeviceIDs</i> buffer is too small to hold all the values requested, but <i>pcPnPDeviceIDs</i> values have been written to <i>pPnPDeviceIDs</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledevicemanager-getdevices
     */
    GetDevices(pPnPDeviceIDs, pcPnPDeviceIDs) {
        pPnPDeviceIDsMarshal := pPnPDeviceIDs is VarRef ? "ptr*" : "ptr"
        pcPnPDeviceIDsMarshal := pcPnPDeviceIDs is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pPnPDeviceIDsMarshal, pPnPDeviceIDs, pcPnPDeviceIDsMarshal, pcPnPDeviceIDs, "HRESULT")
        return result
    }

    /**
     * The RefreshDeviceList method refreshes the list of devices that are connected to the computer.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledevicemanager-refreshdevicelist
     */
    RefreshDeviceList() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Retrieves the user-friendly name for the device.
     * @param {PWSTR} pszPnPDeviceID Pointer to a null-terminated string that contains the device's Plug and Play ID. You can retrieve a list of Plug and Play names of all devices that are connected to the computer by calling <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicemanager-getdevices">GetDevices</a>.
     * @param {PWSTR} pDeviceFriendlyName A caller-allocated buffer that is used to hold the user-friendly name for the device. To learn the required size for this parameter, first call this method with this parameter set to <b>NULL</b> and <i>pcchDeviceFriendlyName</i> set to <b>0</b>; the method will succeed and set <i>pcchDeviceFriendlyName</i> to the required buffer size to hold the device-friendly name, including the termination character.
     * @param {Pointer<Integer>} pcchDeviceFriendlyName On input, the maximum number of characters that <i>pDeviceFriendlyName</i> can hold, not including the termination character. On output, the number of characters that is returned by <i>pDeviceFriendlyName</i>, not including the termination character.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The supplied buffer is not large enough to hold the device description. (Refer to the value returned in <i>pcchDeviceDescription</i> for the required size.)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_INVALID_DATA)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device description could not be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one of the required arguments was a <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledevicemanager-getdevicefriendlyname
     */
    GetDeviceFriendlyName(pszPnPDeviceID, pDeviceFriendlyName, pcchDeviceFriendlyName) {
        pszPnPDeviceID := pszPnPDeviceID is String ? StrPtr(pszPnPDeviceID) : pszPnPDeviceID
        pDeviceFriendlyName := pDeviceFriendlyName is String ? StrPtr(pDeviceFriendlyName) : pDeviceFriendlyName

        pcchDeviceFriendlyNameMarshal := pcchDeviceFriendlyName is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pszPnPDeviceID, "ptr", pDeviceFriendlyName, pcchDeviceFriendlyNameMarshal, pcchDeviceFriendlyName, "HRESULT")
        return result
    }

    /**
     * Retrieves the description of a device.
     * @param {PWSTR} pszPnPDeviceID Pointer to a null-terminated string that contains the device's Plug and Play ID. You can retrieve a list of Plug and Play names of devices that are currently connected by calling <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicemanager-getdevices">GetDevices</a>.
     * @param {PWSTR} pDeviceDescription A caller-allocated buffer to hold the user-description name of the device. The caller must allocate the memory for this parameter. To learn the required size for this parameter, first call this method with this parameter set to <b>NULL</b> and <i>pcchDeviceDescription</i> set to <b>0</b>; the method will succeed and set <i>pcchDeviceDescription</i> to the required buffer size to hold the device-friendly name, including the termination character.
     * @param {Pointer<Integer>} pcchDeviceDescription The number of characters (not including the termination character) in <i>pDeviceDescription</i>. On input, the maximum length of <i>pDeviceDescription</i>; on output, the length of the returned string in <i>pDeviceDescription</i>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The supplied buffer is not large enough to hold the device description. (Refer to the value returned in <i>pcchDeviceDescription</i> for the required size.)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_INVALID_DATA)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device description could not be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one of the required arguments was a <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledevicemanager-getdevicedescription
     */
    GetDeviceDescription(pszPnPDeviceID, pDeviceDescription, pcchDeviceDescription) {
        pszPnPDeviceID := pszPnPDeviceID is String ? StrPtr(pszPnPDeviceID) : pszPnPDeviceID
        pDeviceDescription := pDeviceDescription is String ? StrPtr(pDeviceDescription) : pDeviceDescription

        pcchDeviceDescriptionMarshal := pcchDeviceDescription is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", pszPnPDeviceID, "ptr", pDeviceDescription, pcchDeviceDescriptionMarshal, pcchDeviceDescription, "HRESULT")
        return result
    }

    /**
     * Retrieves the name of the device manufacturer.
     * @param {PWSTR} pszPnPDeviceID Pointer to a null-terminated string that contains the device's Plug and Play ID. You can retrieve a list of Plug and Play names of all devices that are connected to the computer by calling <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicemanager-getdevices">GetDevices</a>.
     * @param {PWSTR} pDeviceManufacturer A caller-allocated buffer that holds the name of the device manufacturer. To learn the required size for this parameter, first call this method with this parameter set to <b>NULL</b> and <i>pcchDeviceManufacturer</i> set to <b>0</b>; the method will succeed and set <i>pcchDeviceManufacturer</i> to the required buffer size to hold the device-friendly name, including the termination character.
     * @param {Pointer<Integer>} pcchDeviceManufacturer On input, the maximum number of characters that <i>pDeviceManufacturer</i> can hold, not including the termination character. On output, the number of characters returned by <i>pDeviceManufacturer</i>, not including the termination character.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The supplied buffer is not large enough to hold the device description. (Refer to the value returned in <i>pcchDeviceDescription</i> for the required size.)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_INVALID_DATA)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device description could not be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one of the required arguments was a <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledevicemanager-getdevicemanufacturer
     */
    GetDeviceManufacturer(pszPnPDeviceID, pDeviceManufacturer, pcchDeviceManufacturer) {
        pszPnPDeviceID := pszPnPDeviceID is String ? StrPtr(pszPnPDeviceID) : pszPnPDeviceID
        pDeviceManufacturer := pDeviceManufacturer is String ? StrPtr(pDeviceManufacturer) : pDeviceManufacturer

        pcchDeviceManufacturerMarshal := pcchDeviceManufacturer is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "ptr", pszPnPDeviceID, "ptr", pDeviceManufacturer, pcchDeviceManufacturerMarshal, pcchDeviceManufacturer, "HRESULT")
        return result
    }

    /**
     * Retrieves a property value stored by the device on the computer. (These are not standard properties that are defined by Windows Portable Devices.).
     * @param {PWSTR} pszPnPDeviceID Pointer to a null-terminated string that contains the device's Plug and Play ID. You can retrieve a list of Plug and Play names of all devices that are connected to the computer by calling <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicemanager-getdevices">GetDevices</a>.
     * @param {PWSTR} pszDevicePropertyName Pointer to a null-terminated string that contains the name of the property to request. These are custom property names defined by a device manufacturer.
     * @param {Pointer<Integer>} pData A caller-allocated buffer to hold the retrieved data. To get the size required, call this method with this parameter set to <b>NULL</b> and <i>pcbData</i> set to zero, and the required size will be retrieved in <i>pcbData</i>. This call will also return an error that can be ignored. See Return Values.
     * @param {Pointer<Integer>} pcbData The size of the buffer allocated or returned by <i>pData</i>, in bytes.
     * @param {Pointer<Integer>} pdwType A constant describing the type of data returned in <i>pData</i>. The values for this parameter are the same types used to describe the <i>lpType</i> parameter of the Platform SDK function <b>RegQueryValueEx</b>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The supplied buffer is not large enough to hold the requested data. (This result is always returned when <i>pData</i> is <b>NULL</b>. You can ignore this result if you are calling the method to retrieve the required buffer size. See the description of the <i>pData</i> parameter.)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one of the required arguments was a <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledevicemanager-getdeviceproperty
     */
    GetDeviceProperty(pszPnPDeviceID, pszDevicePropertyName, pData, pcbData, pdwType) {
        pszPnPDeviceID := pszPnPDeviceID is String ? StrPtr(pszPnPDeviceID) : pszPnPDeviceID
        pszDevicePropertyName := pszDevicePropertyName is String ? StrPtr(pszDevicePropertyName) : pszDevicePropertyName

        pDataMarshal := pData is VarRef ? "char*" : "ptr"
        pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"
        pdwTypeMarshal := pdwType is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "ptr", pszPnPDeviceID, "ptr", pszDevicePropertyName, pDataMarshal, pData, pcbDataMarshal, pcbData, pdwTypeMarshal, pdwType, "HRESULT")
        return result
    }

    /**
     * The GetPrivateDevices method retrieves a list of private portable devices connected to the computer. These private devices are only accessible through an application that is designed for these particular devices.
     * @param {Pointer<PWSTR>} pPnPDeviceIDs A caller-allocated array of string pointers that holds the Plug and Play names of all of the connected devices. To learn the required size for this parameter, first call this method with this parameter set to <b>NULL</b> and <i>pcPnPDeviceIDs</i> set to zero, and then allocate a buffer according to the value retrieved by <i>pcPnPDeviceIDs</i>. These names can be used by <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nf-portabledeviceapi-iportabledevice-open">IPortableDevice::Open</a> to create a connection to a device.
     * @param {Pointer<Integer>} pcPnPDeviceIDs On input, the number of values that <i>pPnPDeviceIDs</i> can hold. On output, a pointer to the number of devices actually written to <i>pPnPDeviceIDs</i>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one of the required arguments was a <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pPnPDeviceIDs</i> buffer is too small to hold all the values requested, but <i>pcPnPDeviceIDs</i> values have been written to <i>pPnPDeviceIDs</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledevicemanager-getprivatedevices
     */
    GetPrivateDevices(pPnPDeviceIDs, pcPnPDeviceIDs) {
        pPnPDeviceIDsMarshal := pPnPDeviceIDs is VarRef ? "ptr*" : "ptr"
        pcPnPDeviceIDsMarshal := pcPnPDeviceIDs is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, pPnPDeviceIDsMarshal, pPnPDeviceIDs, pcPnPDeviceIDsMarshal, pcPnPDeviceIDs, "HRESULT")
        return result
    }
}

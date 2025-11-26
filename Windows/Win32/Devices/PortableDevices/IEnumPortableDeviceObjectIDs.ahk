#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumPortableDeviceObjectIDs.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IEnumPortableDeviceObjectIDs interface enumerates the objects on a portable device. Get this interface initially by calling IPortableDeviceContent::EnumObjects on a device.
 * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nn-portabledeviceapi-ienumportabledeviceobjectids
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IEnumPortableDeviceObjectIDs extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumPortableDeviceObjectIDs
     * @type {Guid}
     */
    static IID => Guid("{10ece955-cf41-4728-bfa0-41eedf1bbf19}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone", "Cancel"]

    /**
     * The Next method retrieves the next one or more object IDs in the enumeration sequence.
     * @param {Integer} cObjects A count of the objects requested.
     * @param {Pointer<Integer>} pcFetched On input, this parameter is ignored. On output, the number of IDs actually retrieved. If no object IDs are released and the return value is S_FALSE, there are no more objects to enumerate.
     * @returns {PWSTR} An array of <b>LPWSTR</b> pointers, each specifying a retrieved object ID. The caller must allocate an array of <i>cObjects</i> LPWSTR elements. The caller must free both the array and the returned strings. The strings are freed by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-ienumportabledeviceobjectids-next
     */
    Next(cObjects, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cObjects, "ptr*", &pObjIDs := 0, pcFetchedMarshal, pcFetched, "int")
        return pObjIDs
    }

    /**
     * The Skip method skips a specified number of objects in the enumeration sequence.
     * @param {Integer} cObjects The number of objects to skip.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     *           
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
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified number of objects could not be skipped (for instance, if fewer than <i>cObjects</i> remained in the enumeration sequence).
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-ienumportabledeviceobjectids-skip
     */
    Skip(cObjects) {
        result := ComCall(4, this, "uint", cObjects, "int")
        return result
    }

    /**
     * The Reset method resets the enumeration sequence to the beginning.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     *           
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
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-ienumportabledeviceobjectids-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The Clone method duplicates the current IEnumPortableDeviceObjectIDs interface.
     * @returns {IEnumPortableDeviceObjectIDs} Address of a variable that receives a pointer to an enumeration interface. The caller must release this interface when it is finished with the interface.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-ienumportabledeviceobjectids-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumPortableDeviceObjectIDs(ppEnum)
    }

    /**
     * The Cancel method cancels a pending operation.
     * @returns {HRESULT} The method returns an 
     * <b>HRESULT</b>
     * . Possible values include, but are not limited to, those in the following table.
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
     * The operation was canceled successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_WPD_DEVICE_NOT_OPEN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device is not opened.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-ienumportabledeviceobjectids-cancel
     */
    Cancel() {
        result := ComCall(7, this, "HRESULT")
        return result
    }
}

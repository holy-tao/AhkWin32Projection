#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPortableDeviceConnector.ahk
#Include .\IEnumPortableDeviceConnectors.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Supports the enumeration of IPortableDeviceConnector interfaces, representing MTP/Bluetooth devices that were paired with the PC.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/ienumportabledeviceconnectors
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IEnumPortableDeviceConnectors extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumPortableDeviceConnectors
     * @type {Guid}
     */
    static IID => Guid("{bfdef549-9247-454f-bd82-06fe80853faa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone"]

    /**
     * Retrieves the next one or more IPortableDeviceConnector objects in the enumeration sequence.
     * @param {Integer} cRequested The number of requested devices. This value also indicates the number of elements in the caller-allocated array specified by the *pConnectors* parameter.
     * @param {Pointer<Integer>} pcFetched The number of [**IPortableDeviceConnector**](/windows/desktop/api/portabledeviceconnectapi/nn-portabledeviceconnectapi-iportabledeviceconnector) interfaces that are actually retrieved. If no **IPortableDeviceConnector** interfaces are retrieved and the return value is **S\_FALSE**, there are no more **IPortableDeviceConnector** interfaces to enumerate.
     * @returns {IPortableDeviceConnector} An array of [**IPortableDeviceConnector**](/windows/desktop/api/portabledeviceconnectapi/nn-portabledeviceconnectapi-iportabledeviceconnector) pointers, each specifying a paired MTP Bluetooth device. The caller must allocate an array of **IPortableDeviceConnector** pointers, with the array length specified by the *cRequested* parameter. On successful return, the caller must free both the array and the returned pointers. The **IPortableDeviceConnector** interfaces are freed by calling the **IUnknown::Release** method.
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/ienumportabledeviceconnectors-next
     */
    Next(cRequested, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cRequested, "ptr*", &pConnectors := 0, pcFetchedMarshal, pcFetched, "HRESULT")
        return IPortableDeviceConnector(pConnectors)
    }

    /**
     * Skips the specified number of devices in the enumeration sequence.
     * @param {Integer} cConnectors The number of devices to skip.
     * @returns {HRESULT} The method returns an **HRESULT**. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * 
     * | Return code                                                                             | Description                                                                                                                                                                               |
     * |-----------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl>    | The method succeeded.<br/>                                                                                                                                                          |
     * | <dl> <dt>**S\_FALSE**</dt> </dl> | The specified number of devices could not be skipped. One possible cause: The *cConnectors* parameter specifies more devices than actually remain in the enumeration sequence.<br/> |
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/ienumportabledeviceconnectors-skip
     */
    Skip(cConnectors) {
        result := ComCall(4, this, "uint", cConnectors, "HRESULT")
        return result
    }

    /**
     * IEnumPortableDeviceConnectors::Reset method - Resets the enumeration sequence to the beginning.
     * @returns {HRESULT} This method has no parameters.
     * 
     * 
     * The method returns an **HRESULT**. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * 
     * | Return code                                                                          | Description                      |
     * |--------------------------------------------------------------------------------------|----------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl> | The method succeeded.<br/> |
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/ienumportabledeviceconnectors-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Creates a copy of the current IEnumPortableDeviceConnectors interface.
     * @returns {IEnumPortableDeviceConnectors} The address of a pointer to an [**IEnumPortableDeviceConnectors**](ienumportabledeviceconnectors.md) interface. The calling application must release this interface when it is done with it.
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/ienumportabledeviceconnectors-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumPortableDeviceConnectors(ppEnum)
    }
}

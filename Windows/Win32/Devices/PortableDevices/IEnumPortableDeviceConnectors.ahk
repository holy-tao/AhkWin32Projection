#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IPortableDeviceConnector.ahk" { IPortableDeviceConnector }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Supports the enumeration of IPortableDeviceConnector interfaces, representing MTP/Bluetooth devices that were paired with the PC.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/ienumportabledeviceconnectors
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct IEnumPortableDeviceConnectors extends IUnknown {
    /**
     * The interface identifier for IEnumPortableDeviceConnectors
     * @type {Guid}
     */
    static IID := Guid("{bfdef549-9247-454f-bd82-06fe80853faa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumPortableDeviceConnectors interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumPortableDeviceConnectors.Vtbl()
        }
        super.__New(implObj, flags)
    }

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

    Query(iid) {
        if (IEnumPortableDeviceConnectors.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Next := CallbackCreate(GetMethod(implObj, "Next"), flags, 4)
        this.vtbl.Skip := CallbackCreate(GetMethod(implObj, "Skip"), flags, 2)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Next)
        CallbackFree(this.vtbl.Skip)
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.Clone)
    }
}

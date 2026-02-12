#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class pHalAssignSlotResources extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<UNICODE_STRING>} RegistryPath 
     * @param {Pointer<UNICODE_STRING>} DriverClassName 
     * @param {Pointer<DRIVER_OBJECT>} DriverObject 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Integer} BusType 
     * @param {Integer} BusNumber 
     * @param {Integer} SlotNumber 
     * @param {Pointer<Pointer<CM_RESOURCE_LIST>>} AllocatedResources 
     * @returns {NTSTATUS} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(RegistryPath, DriverClassName, DriverObject, DeviceObject, BusType, BusNumber, SlotNumber, AllocatedResources) {
        AllocatedResourcesMarshal := AllocatedResources is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", RegistryPath, "ptr", DriverClassName, "ptr", DriverObject, "ptr", DeviceObject, "int", BusType, "uint", BusNumber, "uint", SlotNumber, AllocatedResourcesMarshal, AllocatedResources, "int")
        return result
    }
}

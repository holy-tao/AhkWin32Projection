#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class IOMMU_MAP_LOGICAL_RANGE_EX extends IUnknown {

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
     * @param {Pointer<IOMMU_DMA_DOMAIN>} Domain 
     * @param {Integer} Permissions 
     * @param {Pointer<IOMMU_MAP_PHYSICAL_ADDRESS>} PhysicalAddressToMap 
     * @param {Pointer<Integer>} ExplicitLogicalAddress 
     * @param {Pointer<Integer>} MinLogicalAddress 
     * @param {Pointer<Integer>} MaxLogicalAddress 
     * @param {Pointer<Integer>} LogicalAddressOut 
     * @returns {NTSTATUS} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Domain, Permissions, PhysicalAddressToMap, ExplicitLogicalAddress, MinLogicalAddress, MaxLogicalAddress, LogicalAddressOut) {
        ExplicitLogicalAddressMarshal := ExplicitLogicalAddress is VarRef ? "uint*" : "ptr"
        MinLogicalAddressMarshal := MinLogicalAddress is VarRef ? "uint*" : "ptr"
        MaxLogicalAddressMarshal := MaxLogicalAddress is VarRef ? "uint*" : "ptr"
        LogicalAddressOutMarshal := LogicalAddressOut is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", Domain, "uint", Permissions, "ptr", PhysicalAddressToMap, ExplicitLogicalAddressMarshal, ExplicitLogicalAddress, MinLogicalAddressMarshal, MinLogicalAddress, MaxLogicalAddressMarshal, MaxLogicalAddress, LogicalAddressOutMarshal, LogicalAddressOut, "int")
        return result
    }
}

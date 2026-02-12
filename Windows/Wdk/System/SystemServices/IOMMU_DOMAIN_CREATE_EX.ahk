#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class IOMMU_DOMAIN_CREATE_EX extends IUnknown {

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
     * @param {Integer} DomainType 
     * @param {IOMMU_DMA_DOMAIN_CREATION_FLAGS} Flags 
     * @param {Pointer<IOMMU_DMA_LOGICAL_ALLOCATOR_CONFIG>} LogicalAllocatorConfig 
     * @param {Pointer<IOMMU_DMA_RESERVED_REGION>} ReservedRegions 
     * @param {Pointer<Pointer<IOMMU_DMA_DOMAIN>>} DomainOut 
     * @returns {NTSTATUS} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(DomainType, Flags, LogicalAllocatorConfig, ReservedRegions, DomainOut) {
        DomainOutMarshal := DomainOut is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "int", DomainType, "ptr", Flags, "ptr", LogicalAllocatorConfig, "ptr", ReservedRegions, DomainOutMarshal, DomainOut, "int")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PALLOCATE_DOMAIN_COMMON_BUFFER extends IUnknown {

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
     * @param {Pointer<DMA_ADAPTER>} DmaAdapter 
     * @param {HANDLE} DomainHandle 
     * @param {Pointer<Integer>} MaximumAddress 
     * @param {Integer} Length 
     * @param {Integer} Flags 
     * @param {Pointer<Integer>} CacheType 
     * @param {Integer} PreferredNode 
     * @param {Pointer<Integer>} LogicalAddress 
     * @param {Pointer<Pointer<Void>>} VirtualAddress 
     * @returns {NTSTATUS} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(DmaAdapter, DomainHandle, MaximumAddress, Length, Flags, CacheType, PreferredNode, LogicalAddress, VirtualAddress) {
        DomainHandle := DomainHandle is Win32Handle ? NumGet(DomainHandle, "ptr") : DomainHandle

        MaximumAddressMarshal := MaximumAddress is VarRef ? "int64*" : "ptr"
        CacheTypeMarshal := CacheType is VarRef ? "int*" : "ptr"
        LogicalAddressMarshal := LogicalAddress is VarRef ? "int64*" : "ptr"
        VirtualAddressMarshal := VirtualAddress is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", DmaAdapter, "ptr", DomainHandle, MaximumAddressMarshal, MaximumAddress, "uint", Length, "uint", Flags, CacheTypeMarshal, CacheType, "uint", PreferredNode, LogicalAddressMarshal, LogicalAddress, VirtualAddressMarshal, VirtualAddress, "int")
        return result
    }
}

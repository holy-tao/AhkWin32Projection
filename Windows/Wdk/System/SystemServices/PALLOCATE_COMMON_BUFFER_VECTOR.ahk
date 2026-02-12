#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PALLOCATE_COMMON_BUFFER_VECTOR extends IUnknown {

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
     * @param {Integer} LowAddress 
     * @param {Integer} HighAddress 
     * @param {Integer} CacheType 
     * @param {Integer} IdealNode 
     * @param {Integer} Flags 
     * @param {Integer} NumberOfElements 
     * @param {Integer} SizeOfElements 
     * @param {Pointer<Pointer<DMA_COMMON_BUFFER_VECTOR>>} VectorOut 
     * @returns {NTSTATUS} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(DmaAdapter, LowAddress, HighAddress, CacheType, IdealNode, Flags, NumberOfElements, SizeOfElements, VectorOut) {
        VectorOutMarshal := VectorOut is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", DmaAdapter, "int64", LowAddress, "int64", HighAddress, "int", CacheType, "uint", IdealNode, "uint", Flags, "uint", NumberOfElements, "uint", SizeOfElements, VectorOutMarshal, VectorOut, "int")
        return result
    }
}

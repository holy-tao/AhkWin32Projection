#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PGET_COMMON_BUFFER_FROM_VECTOR_BY_INDEX extends IUnknown {

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
     * @param {Pointer<DMA_COMMON_BUFFER_VECTOR>} Vector 
     * @param {Integer} Index 
     * @param {Pointer<Pointer<Void>>} VirtualAddressOut 
     * @param {Pointer<Integer>} LogicalAddressOut 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(DmaAdapter, Vector, Index, VirtualAddressOut, LogicalAddressOut) {
        VirtualAddressOutMarshal := VirtualAddressOut is VarRef ? "ptr*" : "ptr"
        LogicalAddressOutMarshal := LogicalAddressOut is VarRef ? "int64*" : "ptr"

        ComCall(3, this, "ptr", DmaAdapter, "ptr", Vector, "uint", Index, VirtualAddressOutMarshal, VirtualAddressOut, LogicalAddressOutMarshal, LogicalAddressOut)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostFunctionLocalStorage extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostFunctionLocalStorage
     * @type {Guid}
     */
    static IID => Guid("{2f2f303b-39be-4b6d-9bfb-4faa49dbbd45}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetValidRange", "GetStorageKind", "GetRegister", "GetOffset"]

    /**
     * 
     * @param {Pointer<Integer>} start 
     * @param {Pointer<Integer>} end 
     * @param {Pointer<Boolean>} guaranteed 
     * @returns {HRESULT} 
     */
    GetValidRange(start, end, guaranteed) {
        startMarshal := start is VarRef ? "uint*" : "ptr"
        endMarshal := end is VarRef ? "uint*" : "ptr"
        guaranteedMarshal := guaranteed is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, startMarshal, start, endMarshal, end, guaranteedMarshal, guaranteed, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetStorageKind() {
        result := ComCall(4, this, "int*", &kind := 0, "HRESULT")
        return kind
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetRegister() {
        result := ComCall(5, this, "uint*", &registerId := 0, "HRESULT")
        return registerId
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetOffset() {
        result := ComCall(6, this, "int64*", &offset := 0, "HRESULT")
        return offset
    }
}

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
     * @param {Pointer<Integer>} kind 
     * @returns {HRESULT} 
     */
    GetStorageKind(kind) {
        kindMarshal := kind is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, kindMarshal, kind, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} registerId 
     * @returns {HRESULT} 
     */
    GetRegister(registerId) {
        registerIdMarshal := registerId is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, registerIdMarshal, registerId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} offset 
     * @returns {HRESULT} 
     */
    GetOffset(offset) {
        offsetMarshal := offset is VarRef ? "int64*" : "ptr"

        result := ComCall(6, this, offsetMarshal, offset, "HRESULT")
        return result
    }
}

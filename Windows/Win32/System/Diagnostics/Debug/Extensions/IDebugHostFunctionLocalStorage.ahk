#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostFunctionLocalStorage extends IUnknown{
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
     * 
     * @param {Pointer<UInt64>} start 
     * @param {Pointer<UInt64>} end 
     * @param {Pointer<Boolean>} guaranteed 
     * @returns {HRESULT} 
     */
    GetValidRange(start, end, guaranteed) {
        result := ComCall(3, this, "uint*", start, "uint*", end, "int*", guaranteed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} kind 
     * @returns {HRESULT} 
     */
    GetStorageKind(kind) {
        result := ComCall(4, this, "int*", kind, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} registerId 
     * @returns {HRESULT} 
     */
    GetRegister(registerId) {
        result := ComCall(5, this, "uint*", registerId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int64>} offset 
     * @returns {HRESULT} 
     */
    GetOffset(offset) {
        result := ComCall(6, this, "int64*", offset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

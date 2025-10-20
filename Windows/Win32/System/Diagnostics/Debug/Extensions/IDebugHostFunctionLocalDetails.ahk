#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostFunctionLocalDetails extends IUnknown{
    /**
     * The interface identifier for IDebugHostFunctionLocalDetails
     * @type {Guid}
     */
    static IID => Guid("{89280ea8-b3b9-408c-be16-32ab28f5c0ac}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BSTR>} name 
     * @returns {HRESULT} 
     */
    GetName(name) {
        result := ComCall(3, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugHostType>} localType 
     * @returns {HRESULT} 
     */
    GetType(localType) {
        result := ComCall(4, this, "ptr", localType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugHostFunctionLocalStorageEnumerator>} storageEnum 
     * @returns {HRESULT} 
     */
    EnumerateStorage(storageEnum) {
        result := ComCall(5, this, "ptr", storageEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} kind 
     * @returns {HRESULT} 
     */
    GetLocalKind(kind) {
        result := ComCall(6, this, "int*", kind, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} argPosition 
     * @returns {HRESULT} 
     */
    GetArgumentPosition(argPosition) {
        result := ComCall(7, this, "uint*", argPosition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

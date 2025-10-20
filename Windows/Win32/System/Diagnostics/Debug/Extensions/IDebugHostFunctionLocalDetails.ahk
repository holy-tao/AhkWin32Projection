#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostFunctionLocalDetails extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetName", "GetType", "EnumerateStorage", "GetLocalKind", "GetArgumentPosition"]

    /**
     * 
     * @param {Pointer<BSTR>} name 
     * @returns {HRESULT} 
     */
    GetName(name) {
        result := ComCall(3, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDebugHostType>} localType 
     * @returns {HRESULT} 
     */
    GetType(localType) {
        result := ComCall(4, this, "ptr*", localType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDebugHostFunctionLocalStorageEnumerator>} storageEnum 
     * @returns {HRESULT} 
     */
    EnumerateStorage(storageEnum) {
        result := ComCall(5, this, "ptr*", storageEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} kind 
     * @returns {HRESULT} 
     */
    GetLocalKind(kind) {
        result := ComCall(6, this, "int*", kind, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} argPosition 
     * @returns {HRESULT} 
     */
    GetArgumentPosition(argPosition) {
        result := ComCall(7, this, "uint*", argPosition, "HRESULT")
        return result
    }
}

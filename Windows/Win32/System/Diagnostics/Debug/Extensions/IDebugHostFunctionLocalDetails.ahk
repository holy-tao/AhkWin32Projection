#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\BSTR.ahk
#Include .\IDebugHostType.ahk
#Include .\IDebugHostFunctionLocalStorageEnumerator.ahk
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
     * @returns {BSTR} 
     */
    GetName() {
        name := BSTR()
        result := ComCall(3, this, "ptr", name, "HRESULT")
        return name
    }

    /**
     * 
     * @returns {IDebugHostType} 
     */
    GetType() {
        result := ComCall(4, this, "ptr*", &localType := 0, "HRESULT")
        return IDebugHostType(localType)
    }

    /**
     * 
     * @returns {IDebugHostFunctionLocalStorageEnumerator} 
     */
    EnumerateStorage() {
        result := ComCall(5, this, "ptr*", &storageEnum := 0, "HRESULT")
        return IDebugHostFunctionLocalStorageEnumerator(storageEnum)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetLocalKind() {
        result := ComCall(6, this, "int*", &kind := 0, "HRESULT")
        return kind
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetArgumentPosition() {
        result := ComCall(7, this, "uint*", &argPosition := 0, "HRESULT")
        return argPosition
    }
}

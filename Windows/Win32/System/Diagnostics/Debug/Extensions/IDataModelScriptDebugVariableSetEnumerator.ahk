#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDataModelScriptDebugVariableSetEnumerator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataModelScriptDebugVariableSetEnumerator
     * @type {Guid}
     */
    static IID => Guid("{0f9feed7-d045-4ac3-98a8-a98942cf6a35}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Reset", "GetNext"]

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} variableName 
     * @param {Pointer<IModelObject>} variableValue 
     * @param {Pointer<IKeyStore>} variableMetadata 
     * @returns {HRESULT} 
     */
    GetNext(variableName, variableValue, variableMetadata) {
        result := ComCall(4, this, "ptr", variableName, "ptr*", variableValue, "ptr*", variableMetadata, "HRESULT")
        return result
    }
}

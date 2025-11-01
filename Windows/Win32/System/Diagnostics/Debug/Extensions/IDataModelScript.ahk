#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDataModelScript extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataModelScript
     * @type {Guid}
     */
    static IID => Guid("{7b4d30fc-b14a-49f8-8d87-d9a1480c97f7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetName", "Rename", "Populate", "Execute", "Unlink", "IsInvocable", "InvokeMain"]

    /**
     * 
     * @param {Pointer<BSTR>} scriptName 
     * @returns {HRESULT} 
     */
    GetName(scriptName) {
        result := ComCall(3, this, "ptr", scriptName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} scriptName 
     * @returns {HRESULT} 
     */
    Rename(scriptName) {
        scriptName := scriptName is String ? StrPtr(scriptName) : scriptName

        result := ComCall(4, this, "ptr", scriptName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} contentStream 
     * @returns {HRESULT} 
     */
    Populate(contentStream) {
        result := ComCall(5, this, "ptr", contentStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDataModelScriptClient} client 
     * @returns {HRESULT} 
     */
    Execute(client) {
        result := ComCall(6, this, "ptr", client, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Unlink() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Boolean>} isInvocable 
     * @returns {HRESULT} 
     */
    IsInvocable(isInvocable) {
        isInvocableMarshal := isInvocable is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, isInvocableMarshal, isInvocable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDataModelScriptClient} client 
     * @returns {HRESULT} 
     */
    InvokeMain(client) {
        result := ComCall(9, this, "ptr", client, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDataModelScriptHostContext extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataModelScriptHostContext
     * @type {Guid}
     */
    static IID => Guid("{014d366a-1f23-4981-9219-b2db8b402054}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["NotifyScriptChange", "GetNamespaceObject"]

    /**
     * 
     * @param {IDataModelScript} script 
     * @param {Integer} changeKind 
     * @returns {HRESULT} 
     */
    NotifyScriptChange(script, changeKind) {
        result := ComCall(3, this, "ptr", script, "int", changeKind, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IModelObject>} namespaceObject 
     * @returns {HRESULT} 
     */
    GetNamespaceObject(namespaceObject) {
        result := ComCall(4, this, "ptr*", namespaceObject, "HRESULT")
        return result
    }
}

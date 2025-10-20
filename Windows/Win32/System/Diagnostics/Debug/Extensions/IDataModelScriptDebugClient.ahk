#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDataModelScriptDebugClient extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataModelScriptDebugClient
     * @type {Guid}
     */
    static IID => Guid("{53159b6d-d4c4-471b-a863-5b110ca800ca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["NotifyDebugEvent"]

    /**
     * 
     * @param {Pointer<ScriptDebugEventInformation>} pEventInfo 
     * @param {IDataModelScript} pScript 
     * @param {IModelObject} pEventDataObject 
     * @param {Pointer<Integer>} resumeEventKind 
     * @returns {HRESULT} 
     */
    NotifyDebugEvent(pEventInfo, pScript, pEventDataObject, resumeEventKind) {
        result := ComCall(3, this, "ptr", pEventInfo, "ptr", pScript, "ptr", pEventDataObject, "int*", resumeEventKind, "HRESULT")
        return result
    }
}

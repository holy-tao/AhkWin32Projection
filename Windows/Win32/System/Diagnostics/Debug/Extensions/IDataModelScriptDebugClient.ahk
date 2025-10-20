#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDataModelScriptDebugClient extends IUnknown{
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
     * 
     * @param {Pointer<ScriptDebugEventInformation>} pEventInfo 
     * @param {Pointer<IDataModelScript>} pScript 
     * @param {Pointer<IModelObject>} pEventDataObject 
     * @param {Pointer<Int32>} resumeEventKind 
     * @returns {HRESULT} 
     */
    NotifyDebugEvent(pEventInfo, pScript, pEventDataObject, resumeEventKind) {
        result := ComCall(3, this, "ptr", pEventInfo, "ptr", pScript, "ptr", pEventDataObject, "int*", resumeEventKind, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

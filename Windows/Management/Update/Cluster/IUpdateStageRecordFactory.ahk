#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\UpdateStageRecord.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update.Cluster
 * @version WindowsRuntime 1.4
 */
class IUpdateStageRecordFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdateStageRecordFactory
     * @type {Guid}
     */
    static IID => Guid("{b5c12a84-ebf5-505b-872f-4de71fdda7e8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstance", "CreateInstance2"]

    /**
     * The CWbemGlueFactory class is part of the WMI Provider Framework. The Provider Framework implements methods of this interface internally to create new instances of classes for the provider.
     * @remarks
     * The destructor for the class is <b>CWbemGlueFactory::~CWbemGlueFactory.</b>
     * @param {HSTRING} updateId 
     * @param {Integer} status_ 
     * @param {HSTRING} failureMessage 
     * @returns {UpdateStageRecord} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(updateId, status_, failureMessage) {
        if(updateId is String) {
            pin := HSTRING.Create(updateId)
            updateId := pin.Value
        }
        updateId := updateId is Win32Handle ? NumGet(updateId, "ptr") : updateId
        if(failureMessage is String) {
            pin := HSTRING.Create(failureMessage)
            failureMessage := pin.Value
        }
        failureMessage := failureMessage is Win32Handle ? NumGet(failureMessage, "ptr") : failureMessage

        result := ComCall(6, this, "ptr", updateId, "int", status_, "ptr", failureMessage, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UpdateStageRecord(value)
    }

    /**
     * 
     * @param {HSTRING} updateId 
     * @param {Integer} status_ 
     * @param {HSTRING} failureMessage 
     * @param {HSTRING} updatedPluginSpecificData 
     * @returns {UpdateStageRecord} 
     */
    CreateInstance2(updateId, status_, failureMessage, updatedPluginSpecificData) {
        if(updateId is String) {
            pin := HSTRING.Create(updateId)
            updateId := pin.Value
        }
        updateId := updateId is Win32Handle ? NumGet(updateId, "ptr") : updateId
        if(failureMessage is String) {
            pin := HSTRING.Create(failureMessage)
            failureMessage := pin.Value
        }
        failureMessage := failureMessage is Win32Handle ? NumGet(failureMessage, "ptr") : failureMessage
        if(updatedPluginSpecificData is String) {
            pin := HSTRING.Create(updatedPluginSpecificData)
            updatedPluginSpecificData := pin.Value
        }
        updatedPluginSpecificData := updatedPluginSpecificData is Win32Handle ? NumGet(updatedPluginSpecificData, "ptr") : updatedPluginSpecificData

        result := ComCall(7, this, "ptr", updateId, "int", status_, "ptr", failureMessage, "ptr", updatedPluginSpecificData, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UpdateStageRecord(value)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\UpdateInstallRecord.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update.Cluster
 * @version WindowsRuntime 1.4
 */
class IUpdateInstallRecordFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdateInstallRecordFactory
     * @type {Guid}
     */
    static IID => Guid("{9b6c54b5-d229-5147-9d6e-16e47f2317db}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstance"]

    /**
     * The CWbemGlueFactory class is part of the WMI Provider Framework. The Provider Framework implements methods of this interface internally to create new instances of classes for the provider.
     * @remarks
     * The destructor for the class is <b>CWbemGlueFactory::~CWbemGlueFactory.</b>
     * @param {HSTRING} updateId 
     * @param {Boolean} isRebootRequired 
     * @param {Integer} status_ 
     * @param {HSTRING} failureMessage 
     * @returns {UpdateInstallRecord} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(updateId, isRebootRequired, status_, failureMessage) {
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

        result := ComCall(6, this, "ptr", updateId, "int", isRebootRequired, "int", status_, "ptr", failureMessage, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UpdateInstallRecord(value)
    }
}

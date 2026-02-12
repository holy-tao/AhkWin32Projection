#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\UpdateScanRecord.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update.Cluster
 * @version WindowsRuntime 1.4
 */
class IUpdateScanRecordFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdateScanRecordFactory
     * @type {Guid}
     */
    static IID => Guid("{d9a3860e-a05a-58c3-b368-07bb350072d0}")

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
     * @param {HSTRING} updateTitle 
     * @param {HSTRING} updateDescription 
     * @param {Boolean} isRebootRequired 
     * @param {HSTRING} pluginSpecificData 
     * @returns {UpdateScanRecord} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(updateId, updateTitle, updateDescription, isRebootRequired, pluginSpecificData) {
        if(updateId is String) {
            pin := HSTRING.Create(updateId)
            updateId := pin.Value
        }
        updateId := updateId is Win32Handle ? NumGet(updateId, "ptr") : updateId
        if(updateTitle is String) {
            pin := HSTRING.Create(updateTitle)
            updateTitle := pin.Value
        }
        updateTitle := updateTitle is Win32Handle ? NumGet(updateTitle, "ptr") : updateTitle
        if(updateDescription is String) {
            pin := HSTRING.Create(updateDescription)
            updateDescription := pin.Value
        }
        updateDescription := updateDescription is Win32Handle ? NumGet(updateDescription, "ptr") : updateDescription
        if(pluginSpecificData is String) {
            pin := HSTRING.Create(pluginSpecificData)
            pluginSpecificData := pin.Value
        }
        pluginSpecificData := pluginSpecificData is Win32Handle ? NumGet(pluginSpecificData, "ptr") : pluginSpecificData

        result := ComCall(6, this, "ptr", updateId, "ptr", updateTitle, "ptr", updateDescription, "int", isRebootRequired, "ptr", pluginSpecificData, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UpdateScanRecord(value)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ProtectionPolicyAuditInfo.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.EnterpriseData
 * @version WindowsRuntime 1.4
 */
class IProtectionPolicyAuditInfoFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProtectionPolicyAuditInfoFactory
     * @type {Guid}
     */
    static IID => Guid("{7ed4180b-92e8-42d5-83d4-25440b423549}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create", "CreateWithActionAndDataDescription"]

    /**
     * Create Extended Stored Procedures
     * @param {Integer} action 
     * @param {HSTRING} dataDescription 
     * @param {HSTRING} sourceDescription 
     * @param {HSTRING} targetDescription 
     * @returns {ProtectionPolicyAuditInfo} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(action, dataDescription, sourceDescription, targetDescription) {
        if(dataDescription is String) {
            pin := HSTRING.Create(dataDescription)
            dataDescription := pin.Value
        }
        dataDescription := dataDescription is Win32Handle ? NumGet(dataDescription, "ptr") : dataDescription
        if(sourceDescription is String) {
            pin := HSTRING.Create(sourceDescription)
            sourceDescription := pin.Value
        }
        sourceDescription := sourceDescription is Win32Handle ? NumGet(sourceDescription, "ptr") : sourceDescription
        if(targetDescription is String) {
            pin := HSTRING.Create(targetDescription)
            targetDescription := pin.Value
        }
        targetDescription := targetDescription is Win32Handle ? NumGet(targetDescription, "ptr") : targetDescription

        result := ComCall(6, this, "int", action, "ptr", dataDescription, "ptr", sourceDescription, "ptr", targetDescription, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ProtectionPolicyAuditInfo(result_)
    }

    /**
     * 
     * @param {Integer} action 
     * @param {HSTRING} dataDescription 
     * @returns {ProtectionPolicyAuditInfo} 
     */
    CreateWithActionAndDataDescription(action, dataDescription) {
        if(dataDescription is String) {
            pin := HSTRING.Create(dataDescription)
            dataDescription := pin.Value
        }
        dataDescription := dataDescription is Win32Handle ? NumGet(dataDescription, "ptr") : dataDescription

        result := ComCall(7, this, "int", action, "ptr", dataDescription, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ProtectionPolicyAuditInfo(result_)
    }
}

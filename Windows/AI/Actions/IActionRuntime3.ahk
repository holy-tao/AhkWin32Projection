#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ActionInvocationContext.ahk
#Include .\ActionEntity.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class IActionRuntime3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActionRuntime3
     * @type {Guid}
     */
    static IID => Guid("{f020c3c0-caec-5928-ad00-81069b80fbc1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInvocationContextWithWindowId", "GetActionEntityById", "get_LatestSupportedSchemaVersion"]

    /**
     * @type {Integer} 
     */
    LatestSupportedSchemaVersion {
        get => this.get_LatestSupportedSchemaVersion()
    }

    /**
     * 
     * @param {HSTRING} actionId 
     * @param {WindowId} invokerWindowId 
     * @returns {ActionInvocationContext} 
     */
    CreateInvocationContextWithWindowId(actionId, invokerWindowId) {
        if(actionId is String) {
            pin := HSTRING.Create(actionId)
            actionId := pin.Value
        }
        actionId := actionId is Win32Handle ? NumGet(actionId, "ptr") : actionId
        invokerWindowId := invokerWindowId is Win32Handle ? NumGet(invokerWindowId, "ptr") : invokerWindowId

        result := ComCall(6, this, "ptr", actionId, "ptr", invokerWindowId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ActionInvocationContext(result_)
    }

    /**
     * 
     * @param {HSTRING} entityId 
     * @returns {ActionEntity} 
     */
    GetActionEntityById(entityId) {
        if(entityId is String) {
            pin := HSTRING.Create(entityId)
            entityId := pin.Value
        }
        entityId := entityId is Win32Handle ? NumGet(entityId, "ptr") : entityId

        result := ComCall(7, this, "ptr", entityId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ActionEntity(result_)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LatestSupportedSchemaVersion() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

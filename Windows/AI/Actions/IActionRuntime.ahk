#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include Hosting\ActionCatalog.ahk
#Include .\ActionEntityFactory.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ActionInvocationContext.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class IActionRuntime extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActionRuntime
     * @type {Guid}
     */
    static IID => Guid("{206efa2c-c909-508a-b4b0-9482be96db9c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ActionCatalog", "get_EntityFactory", "CreateInvocationContext"]

    /**
     * @type {ActionCatalog} 
     */
    ActionCatalog {
        get => this.get_ActionCatalog()
    }

    /**
     * @type {ActionEntityFactory} 
     */
    EntityFactory {
        get => this.get_EntityFactory()
    }

    /**
     * 
     * @returns {ActionCatalog} 
     */
    get_ActionCatalog() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ActionCatalog(value)
    }

    /**
     * 
     * @returns {ActionEntityFactory} 
     */
    get_EntityFactory() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ActionEntityFactory(value)
    }

    /**
     * 
     * @param {HSTRING} actionId 
     * @returns {ActionInvocationContext} 
     */
    CreateInvocationContext(actionId) {
        if(actionId is String) {
            pin := HSTRING.Create(actionId)
            actionId := pin.Value
        }
        actionId := actionId is Win32Handle ? NumGet(actionId, "ptr") : actionId

        result := ComCall(8, this, "ptr", actionId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ActionInvocationContext(result_)
    }
}

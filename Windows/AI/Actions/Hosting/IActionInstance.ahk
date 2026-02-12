#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ActionInstanceDisplayInfo.ahk
#Include .\ActionDefinition.ahk
#Include ..\ActionInvocationContext.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.Actions.Hosting
 * @version WindowsRuntime 1.4
 */
class IActionInstance extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActionInstance
     * @type {Guid}
     */
    static IID => Guid("{809bcb6e-e6ef-5f16-b89a-06b8893df20e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DisplayInfo", "get_Definition", "get_Context", "InvokeAsync"]

    /**
     * @type {ActionInstanceDisplayInfo} 
     */
    DisplayInfo {
        get => this.get_DisplayInfo()
    }

    /**
     * @type {ActionDefinition} 
     */
    Definition {
        get => this.get_Definition()
    }

    /**
     * @type {ActionInvocationContext} 
     */
    Context {
        get => this.get_Context()
    }

    /**
     * 
     * @returns {ActionInstanceDisplayInfo} 
     */
    get_DisplayInfo() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ActionInstanceDisplayInfo(value)
    }

    /**
     * 
     * @returns {ActionDefinition} 
     */
    get_Definition() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ActionDefinition(value)
    }

    /**
     * 
     * @returns {ActionInvocationContext} 
     */
    get_Context() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ActionInvocationContext(value)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    InvokeAsync() {
        result := ComCall(9, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}

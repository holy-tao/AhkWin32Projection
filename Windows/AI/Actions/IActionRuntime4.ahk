#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ActionInvocationContext.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class IActionRuntime4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActionRuntime4
     * @type {Guid}
     */
    static IID => Guid("{06851dcd-c743-5c7f-88a1-bbaeb02f5e28}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetActionInvocationContextFromToken"]

    /**
     * 
     * @param {HSTRING} token 
     * @returns {ActionInvocationContext} 
     */
    GetActionInvocationContextFromToken(token) {
        if(token is String) {
            pin := HSTRING.Create(token)
            token := pin.Value
        }
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(6, this, "ptr", token, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ActionInvocationContext(result_)
    }
}

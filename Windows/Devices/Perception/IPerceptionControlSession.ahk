#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\PerceptionFrameSourcePropertyChangeResult.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class IPerceptionControlSession extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPerceptionControlSession
     * @type {Guid}
     */
    static IID => Guid("{99998653-5a3d-417f-9239-f1889e548b48}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_ControlLost", "remove_ControlLost", "TrySetPropertyAsync"]

    /**
     * 
     * @param {TypedEventHandler<PerceptionControlSession, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ControlLost(handler) {
        token := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ControlLost(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {IInspectable} value 
     * @returns {IAsyncOperation<PerceptionFrameSourcePropertyChangeResult>} 
     */
    TrySetPropertyAsync(name, value) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(8, this, "ptr", name, "ptr", value, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PerceptionFrameSourcePropertyChangeResult, result_)
    }
}

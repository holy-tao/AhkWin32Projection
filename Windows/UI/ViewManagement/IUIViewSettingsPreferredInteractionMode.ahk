#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class IUIViewSettingsPreferredInteractionMode extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIViewSettingsPreferredInteractionMode
     * @type {Guid}
     */
    static IID => Guid("{426de261-82ec-5f61-bad4-19b2d0d3cf35}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPreferredInteractionMode", "add_PreferredInteractionModeChanged", "remove_PreferredInteractionModeChanged"]

    /**
     * 
     * @param {Integer} supportedModes_length 
     * @param {Pointer<Integer>} supportedModes 
     * @returns {Integer} 
     */
    GetPreferredInteractionMode(supportedModes_length, supportedModes) {
        supportedModesMarshal := supportedModes is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, "uint", supportedModes_length, supportedModesMarshal, supportedModes, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {TypedEventHandler<UIViewSettings, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PreferredInteractionModeChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(7, this, "ptr", handler, "ptr", token, "int")
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
    remove_PreferredInteractionModeChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(8, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

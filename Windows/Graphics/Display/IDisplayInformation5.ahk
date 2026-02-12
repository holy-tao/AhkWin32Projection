#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AdvancedColorInfo.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Display
 * @version WindowsRuntime 1.4
 */
class IDisplayInformation5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDisplayInformation5
     * @type {Guid}
     */
    static IID => Guid("{3a5442dc-2cde-4a8d-80d1-21dc5adcc1aa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAdvancedColorInfo", "add_AdvancedColorInfoChanged", "remove_AdvancedColorInfoChanged"]

    /**
     * 
     * @returns {AdvancedColorInfo} 
     */
    GetAdvancedColorInfo() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AdvancedColorInfo(value)
    }

    /**
     * 
     * @param {TypedEventHandler<DisplayInformation, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AdvancedColorInfoChanged(handler) {
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
    remove_AdvancedColorInfoChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(8, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

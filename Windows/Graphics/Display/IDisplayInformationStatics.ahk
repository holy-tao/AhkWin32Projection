#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\DisplayInformation.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Desktop interop interface for the [DisplayInformation](/uwp/api/windows.graphics.display.displayinformation) activation factory.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/windows.graphics.display.interop/nn-windows-graphics-display-interop-idisplayinformationstaticsinterop
 * @namespace Windows.Graphics.Display
 * @version WindowsRuntime 1.4
 */
class IDisplayInformationStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDisplayInformationStatics
     * @type {Guid}
     */
    static IID => Guid("{c6a02a6c-d452-44dc-ba07-96f3c6adf9d1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetForCurrentView", "get_AutoRotationPreferences", "put_AutoRotationPreferences", "add_DisplayContentsInvalidated", "remove_DisplayContentsInvalidated"]

    /**
     * @type {Integer} 
     */
    AutoRotationPreferences {
        get => this.get_AutoRotationPreferences()
        set => this.put_AutoRotationPreferences(value)
    }

    /**
     * 
     * @returns {DisplayInformation} 
     */
    GetForCurrentView() {
        result := ComCall(6, this, "ptr*", &current := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DisplayInformation(current)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AutoRotationPreferences() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AutoRotationPreferences(value) {
        result := ComCall(8, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<DisplayInformation, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DisplayContentsInvalidated(handler) {
        token := EventRegistrationToken()
        result := ComCall(9, this, "ptr", handler, "ptr", token, "int")
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
    remove_DisplayContentsInvalidated(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(10, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

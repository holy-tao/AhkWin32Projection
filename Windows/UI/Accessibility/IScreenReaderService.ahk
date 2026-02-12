#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ScreenReaderPositionChangedEventArgs.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Accessibility
 * @version WindowsRuntime 1.4
 */
class IScreenReaderService extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IScreenReaderService
     * @type {Guid}
     */
    static IID => Guid("{19475427-eac0-50d3-bdd9-9b487a226256}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CurrentScreenReaderPosition", "add_ScreenReaderPositionChanged", "remove_ScreenReaderPositionChanged"]

    /**
     * @type {ScreenReaderPositionChangedEventArgs} 
     */
    CurrentScreenReaderPosition {
        get => this.get_CurrentScreenReaderPosition()
    }

    /**
     * 
     * @returns {ScreenReaderPositionChangedEventArgs} 
     */
    get_CurrentScreenReaderPosition() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ScreenReaderPositionChangedEventArgs(value)
    }

    /**
     * 
     * @param {TypedEventHandler<ScreenReaderService, ScreenReaderPositionChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ScreenReaderPositionChanged(handler) {
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
    remove_ScreenReaderPositionChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(8, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

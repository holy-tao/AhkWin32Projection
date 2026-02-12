#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\RefreshVisualizer.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IRefreshContainer extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRefreshContainer
     * @type {Guid}
     */
    static IID => Guid("{535dc413-b1d5-43c1-b057-8658ce1e0ba2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Visualizer", "put_Visualizer", "get_PullDirection", "put_PullDirection", "add_RefreshRequested", "remove_RefreshRequested", "RequestRefresh"]

    /**
     * @type {RefreshVisualizer} 
     */
    Visualizer {
        get => this.get_Visualizer()
        set => this.put_Visualizer(value)
    }

    /**
     * @type {Integer} 
     */
    PullDirection {
        get => this.get_PullDirection()
        set => this.put_PullDirection(value)
    }

    /**
     * 
     * @returns {RefreshVisualizer} 
     */
    get_Visualizer() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RefreshVisualizer(value)
    }

    /**
     * 
     * @param {RefreshVisualizer} value 
     * @returns {HRESULT} 
     */
    put_Visualizer(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PullDirection() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_PullDirection(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<RefreshContainer, RefreshRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RefreshRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(10, this, "ptr", handler, "ptr", token, "int")
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
    remove_RefreshRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(11, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RequestRefresh() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

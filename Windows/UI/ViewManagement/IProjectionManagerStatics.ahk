#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class IProjectionManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProjectionManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{b65f913d-e2f0-4ffd-ba95-34241647e45c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartProjectingAsync", "SwapDisplaysForViewsAsync", "StopProjectingAsync", "get_ProjectionDisplayAvailable", "add_ProjectionDisplayAvailableChanged", "remove_ProjectionDisplayAvailableChanged"]

    /**
     * @type {Boolean} 
     */
    ProjectionDisplayAvailable {
        get => this.get_ProjectionDisplayAvailable()
    }

    /**
     * 
     * @param {Integer} projectionViewId 
     * @param {Integer} anchorViewId 
     * @returns {IAsyncAction} 
     */
    StartProjectingAsync(projectionViewId, anchorViewId) {
        result := ComCall(6, this, "int", projectionViewId, "int", anchorViewId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {Integer} projectionViewId 
     * @param {Integer} anchorViewId 
     * @returns {IAsyncAction} 
     */
    SwapDisplaysForViewsAsync(projectionViewId, anchorViewId) {
        result := ComCall(7, this, "int", projectionViewId, "int", anchorViewId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {Integer} projectionViewId 
     * @param {Integer} anchorViewId 
     * @returns {IAsyncAction} 
     */
    StopProjectingAsync(projectionViewId, anchorViewId) {
        result := ComCall(8, this, "int", projectionViewId, "int", anchorViewId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ProjectionDisplayAvailable() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ProjectionDisplayAvailableChanged(handler) {
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
    remove_ProjectionDisplayAvailableChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(11, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

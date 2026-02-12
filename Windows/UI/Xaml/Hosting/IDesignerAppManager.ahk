#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\DesignerAppView.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Hosting
 * @version WindowsRuntime 1.4
 */
class IDesignerAppManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDesignerAppManager
     * @type {Guid}
     */
    static IID => Guid("{a6272caa-d5c6-40cb-abd9-27ba43831bb7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AppUserModelId", "add_DesignerAppExited", "remove_DesignerAppExited", "CreateNewViewAsync", "LoadObjectIntoAppAsync"]

    /**
     * @type {HSTRING} 
     */
    AppUserModelId {
        get => this.get_AppUserModelId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AppUserModelId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<DesignerAppManager, DesignerAppExitedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DesignerAppExited(handler) {
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
    remove_DesignerAppExited(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(8, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} initialViewState 
     * @param {SIZE} initialViewSize 
     * @returns {IAsyncOperation<DesignerAppView>} 
     */
    CreateNewViewAsync(initialViewState, initialViewSize) {
        result := ComCall(9, this, "int", initialViewState, "ptr", initialViewSize, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(DesignerAppView, operation)
    }

    /**
     * 
     * @param {HSTRING} dllName 
     * @param {Guid} classId 
     * @param {HSTRING} initializationData 
     * @returns {IAsyncAction} 
     */
    LoadObjectIntoAppAsync(dllName, classId, initializationData) {
        if(dllName is String) {
            pin := HSTRING.Create(dllName)
            dllName := pin.Value
        }
        dllName := dllName is Win32Handle ? NumGet(dllName, "ptr") : dllName
        if(initializationData is String) {
            pin := HSTRING.Create(initializationData)
            initializationData := pin.Value
        }
        initializationData := initializationData is Win32Handle ? NumGet(initializationData, "ptr") : initializationData

        result := ComCall(10, this, "ptr", dllName, "ptr", classId, "ptr", initializationData, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}

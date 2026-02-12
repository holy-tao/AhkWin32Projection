#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\Foundation\SIZE.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Hosting
 * @version WindowsRuntime 1.4
 */
class IDesignerAppView extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDesignerAppView
     * @type {Guid}
     */
    static IID => Guid("{5c777cea-dd71-4a84-a56f-dacb4b14706f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ApplicationViewId", "get_AppUserModelId", "get_ViewState", "get_ViewSize", "UpdateViewAsync"]

    /**
     * @type {Integer} 
     */
    ApplicationViewId {
        get => this.get_ApplicationViewId()
    }

    /**
     * @type {HSTRING} 
     */
    AppUserModelId {
        get => this.get_AppUserModelId()
    }

    /**
     * @type {Integer} 
     */
    ViewState {
        get => this.get_ViewState()
    }

    /**
     * @type {SIZE} 
     */
    ViewSize {
        get => this.get_ViewSize()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ApplicationViewId() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AppUserModelId() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ViewState() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_ViewSize() {
        value := SIZE()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} viewState 
     * @param {SIZE} viewSize 
     * @returns {IAsyncAction} 
     */
    UpdateViewAsync(viewState, viewSize) {
        result := ComCall(10, this, "int", viewState, "ptr", viewSize, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}

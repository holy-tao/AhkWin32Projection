#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\UIContentRoot.ahk
#Include ..\..\System\DispatcherQueue.ahk
#Include .\AppWindowFrame.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\AppWindowPresenter.ahk
#Include .\AppWindowTitleBar.ahk
#Include ..\UIContext.ahk
#Include .\WindowingEnvironment.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include .\AppWindowPlacement.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\DisplayRegion.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.WindowManagement
 * @version WindowsRuntime 1.4
 */
class IAppWindow extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppWindow
     * @type {Guid}
     */
    static IID => Guid("{663014a6-b75e-5dbd-995c-f0117fa3fb61}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Content", "get_DispatcherQueue", "get_Frame", "get_IsVisible", "get_PersistedStateId", "put_PersistedStateId", "get_Presenter", "get_Title", "put_Title", "get_TitleBar", "get_UIContext", "get_WindowingEnvironment", "CloseAsync", "GetPlacement", "GetDisplayRegions", "RequestMoveToDisplayRegion", "RequestMoveAdjacentToCurrentView", "RequestMoveAdjacentToWindow", "RequestMoveRelativeToWindowContent", "RequestMoveRelativeToCurrentViewContent", "RequestMoveRelativeToDisplayRegion", "RequestSize", "TryShowAsync", "add_Changed", "remove_Changed", "add_Closed", "remove_Closed", "add_CloseRequested", "remove_CloseRequested"]

    /**
     * @type {UIContentRoot} 
     */
    Content {
        get => this.get_Content()
    }

    /**
     * @type {DispatcherQueue} 
     */
    DispatcherQueue {
        get => this.get_DispatcherQueue()
    }

    /**
     * @type {AppWindowFrame} 
     */
    Frame {
        get => this.get_Frame()
    }

    /**
     * @type {Boolean} 
     */
    IsVisible {
        get => this.get_IsVisible()
    }

    /**
     * @type {HSTRING} 
     */
    PersistedStateId {
        get => this.get_PersistedStateId()
        set => this.put_PersistedStateId(value)
    }

    /**
     * @type {AppWindowPresenter} 
     */
    Presenter {
        get => this.get_Presenter()
    }

    /**
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
        set => this.put_Title(value)
    }

    /**
     * @type {AppWindowTitleBar} 
     */
    TitleBar {
        get => this.get_TitleBar()
    }

    /**
     * @type {UIContext} 
     */
    UIContext {
        get => this.get_UIContext()
    }

    /**
     * @type {WindowingEnvironment} 
     */
    WindowingEnvironment {
        get => this.get_WindowingEnvironment()
    }

    /**
     * 
     * @returns {UIContentRoot} 
     */
    get_Content() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UIContentRoot(value)
    }

    /**
     * 
     * @returns {DispatcherQueue} 
     */
    get_DispatcherQueue() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DispatcherQueue(value)
    }

    /**
     * 
     * @returns {AppWindowFrame} 
     */
    get_Frame() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppWindowFrame(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsVisible() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PersistedStateId() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PersistedStateId(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {AppWindowPresenter} 
     */
    get_Presenter() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppWindowPresenter(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        value := HSTRING()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Title(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {AppWindowTitleBar} 
     */
    get_TitleBar() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppWindowTitleBar(value)
    }

    /**
     * 
     * @returns {UIContext} 
     */
    get_UIContext() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UIContext(value)
    }

    /**
     * 
     * @returns {WindowingEnvironment} 
     */
    get_WindowingEnvironment() {
        result := ComCall(17, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WindowingEnvironment(value)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    CloseAsync() {
        result := ComCall(18, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @returns {AppWindowPlacement} 
     */
    GetPlacement() {
        result := ComCall(19, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppWindowPlacement(result_)
    }

    /**
     * 
     * @returns {IVectorView<DisplayRegion>} 
     */
    GetDisplayRegions() {
        result := ComCall(20, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(DisplayRegion, result_)
    }

    /**
     * 
     * @param {DisplayRegion} displayRegion_ 
     * @returns {HRESULT} 
     */
    RequestMoveToDisplayRegion(displayRegion_) {
        result := ComCall(21, this, "ptr", displayRegion_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RequestMoveAdjacentToCurrentView() {
        result := ComCall(22, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {AppWindow} anchorWindow 
     * @returns {HRESULT} 
     */
    RequestMoveAdjacentToWindow(anchorWindow) {
        result := ComCall(23, this, "ptr", anchorWindow, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {AppWindow} anchorWindow 
     * @param {POINT} contentOffset 
     * @returns {HRESULT} 
     */
    RequestMoveRelativeToWindowContent(anchorWindow, contentOffset) {
        result := ComCall(24, this, "ptr", anchorWindow, "ptr", contentOffset, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {POINT} contentOffset 
     * @returns {HRESULT} 
     */
    RequestMoveRelativeToCurrentViewContent(contentOffset) {
        result := ComCall(25, this, "ptr", contentOffset, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {DisplayRegion} displayRegion_ 
     * @param {POINT} displayRegionOffset 
     * @returns {HRESULT} 
     */
    RequestMoveRelativeToDisplayRegion(displayRegion_, displayRegionOffset) {
        result := ComCall(26, this, "ptr", displayRegion_, "ptr", displayRegionOffset, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {SIZE} frameSize 
     * @returns {HRESULT} 
     */
    RequestSize(frameSize) {
        result := ComCall(27, this, "ptr", frameSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryShowAsync() {
        result := ComCall(28, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {TypedEventHandler<AppWindow, AppWindowChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Changed(handler) {
        token := EventRegistrationToken()
        result := ComCall(29, this, "ptr", handler, "ptr", token, "int")
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
    remove_Changed(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(30, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<AppWindow, AppWindowClosedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Closed(handler) {
        token := EventRegistrationToken()
        result := ComCall(31, this, "ptr", handler, "ptr", token, "int")
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
    remove_Closed(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(32, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<AppWindow, AppWindowCloseRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CloseRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(33, this, "ptr", handler, "ptr", token, "int")
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
    remove_CloseRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(34, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

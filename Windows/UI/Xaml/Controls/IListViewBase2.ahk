#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\DataTemplate.ahk
#Include ..\Media\Animation\TransitionCollection.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IListViewBase2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IListViewBase2
     * @type {Guid}
     */
    static IID => Guid("{d1c2a4f7-78a3-4491-86e0-2ddebc007ac5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ShowsScrollingPlaceholders", "put_ShowsScrollingPlaceholders", "add_ContainerContentChanging", "remove_ContainerContentChanging", "SetDesiredContainerUpdateDuration", "get_Footer", "put_Footer", "get_FooterTemplate", "put_FooterTemplate", "get_FooterTransitions", "put_FooterTransitions"]

    /**
     * @type {Boolean} 
     */
    ShowsScrollingPlaceholders {
        get => this.get_ShowsScrollingPlaceholders()
        set => this.put_ShowsScrollingPlaceholders(value)
    }

    /**
     * @type {IInspectable} 
     */
    Footer {
        get => this.get_Footer()
        set => this.put_Footer(value)
    }

    /**
     * @type {DataTemplate} 
     */
    FooterTemplate {
        get => this.get_FooterTemplate()
        set => this.put_FooterTemplate(value)
    }

    /**
     * @type {TransitionCollection} 
     */
    FooterTransitions {
        get => this.get_FooterTransitions()
        set => this.put_FooterTransitions(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShowsScrollingPlaceholders() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ShowsScrollingPlaceholders(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<ListViewBase, ContainerContentChangingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ContainerContentChanging(handler) {
        token := EventRegistrationToken()
        result := ComCall(8, this, "ptr", handler, "ptr", token, "int")
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
    remove_ContainerContentChanging(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TimeSpan} duration_ 
     * @returns {HRESULT} 
     */
    SetDesiredContainerUpdateDuration(duration_) {
        result := ComCall(10, this, "ptr", duration_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Footer() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Footer(value) {
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_FooterTemplate() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DataTemplate(value)
    }

    /**
     * 
     * @param {DataTemplate} value 
     * @returns {HRESULT} 
     */
    put_FooterTemplate(value) {
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TransitionCollection} 
     */
    get_FooterTransitions() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TransitionCollection(value)
    }

    /**
     * 
     * @param {TransitionCollection} value 
     * @returns {HRESULT} 
     */
    put_FooterTransitions(value) {
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

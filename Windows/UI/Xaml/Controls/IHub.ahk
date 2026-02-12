#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DataTemplate.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include .\HubSection.ahk
#Include ..\..\..\Foundation\Collections\IObservableVector.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IHub extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHub
     * @type {Guid}
     */
    static IID => Guid("{ae692e82-7314-4f51-ab11-2af1ed4a19f8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Header", "put_Header", "get_HeaderTemplate", "put_HeaderTemplate", "get_Orientation", "put_Orientation", "get_DefaultSectionIndex", "put_DefaultSectionIndex", "get_Sections", "get_SectionsInView", "get_SectionHeaders", "add_SectionHeaderClick", "remove_SectionHeaderClick", "add_SectionsInViewChanged", "remove_SectionsInViewChanged", "ScrollToSection"]

    /**
     * @type {IInspectable} 
     */
    Header {
        get => this.get_Header()
        set => this.put_Header(value)
    }

    /**
     * @type {DataTemplate} 
     */
    HeaderTemplate {
        get => this.get_HeaderTemplate()
        set => this.put_HeaderTemplate(value)
    }

    /**
     * @type {Integer} 
     */
    Orientation {
        get => this.get_Orientation()
        set => this.put_Orientation(value)
    }

    /**
     * @type {Integer} 
     */
    DefaultSectionIndex {
        get => this.get_DefaultSectionIndex()
        set => this.put_DefaultSectionIndex(value)
    }

    /**
     * @type {IVector<HubSection>} 
     */
    Sections {
        get => this.get_Sections()
    }

    /**
     * @type {IVector<HubSection>} 
     */
    SectionsInView {
        get => this.get_SectionsInView()
    }

    /**
     * @type {IObservableVector<IInspectable>} 
     */
    SectionHeaders {
        get => this.get_SectionHeaders()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Header() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
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
    put_Header(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_HeaderTemplate() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
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
    put_HeaderTemplate(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Orientation() {
        result := ComCall(10, this, "int*", &value := 0, "int")
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
    put_Orientation(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DefaultSectionIndex() {
        result := ComCall(12, this, "int*", &value := 0, "int")
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
    put_DefaultSectionIndex(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<HubSection>} 
     */
    get_Sections() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(HubSection, value)
    }

    /**
     * 
     * @returns {IVector<HubSection>} 
     */
    get_SectionsInView() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(HubSection, value)
    }

    /**
     * 
     * @returns {IObservableVector<IInspectable>} 
     */
    get_SectionHeaders() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IObservableVector(IInspectable, value)
    }

    /**
     * 
     * @param {HubSectionHeaderClickEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SectionHeaderClick(handler) {
        token := EventRegistrationToken()
        result := ComCall(17, this, "ptr", handler, "ptr", token, "int")
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
    remove_SectionHeaderClick(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(18, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {SectionsInViewChangedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SectionsInViewChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(19, this, "ptr", handler, "ptr", token, "int")
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
    remove_SectionsInViewChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(20, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HubSection} section_ 
     * @returns {HRESULT} 
     */
    ScrollToSection(section_) {
        result := ComCall(21, this, "ptr", section_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

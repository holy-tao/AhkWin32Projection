#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DataTemplate.ahk
#Include ..\Media\Animation\TransitionCollection.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IItemsPresenter2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IItemsPresenter2
     * @type {Guid}
     */
    static IID => Guid("{5c04aa33-1df3-4731-a4c9-da818378d63d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Footer", "put_Footer", "get_FooterTemplate", "put_FooterTemplate", "get_FooterTransitions", "put_FooterTransitions"]

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
     * @returns {IInspectable} 
     */
    get_Footer() {
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
    put_Footer(value) {
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
    get_FooterTemplate() {
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
    put_FooterTemplate(value) {
        result := ComCall(9, this, "ptr", value, "int")
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
        result := ComCall(10, this, "ptr*", &value := 0, "int")
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
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

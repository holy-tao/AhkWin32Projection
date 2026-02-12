#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IContentPresenterOverrides extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContentPresenterOverrides
     * @type {Guid}
     */
    static IID => Guid("{a76339ed-32ff-438b-aad5-1d68fae93426}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnContentTemplateChanged", "OnContentTemplateSelectorChanged"]

    /**
     * 
     * @param {DataTemplate} oldContentTemplate 
     * @param {DataTemplate} newContentTemplate 
     * @returns {HRESULT} 
     */
    OnContentTemplateChanged(oldContentTemplate, newContentTemplate) {
        result := ComCall(6, this, "ptr", oldContentTemplate, "ptr", newContentTemplate, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {DataTemplateSelector} oldContentTemplateSelector 
     * @param {DataTemplateSelector} newContentTemplateSelector 
     * @returns {HRESULT} 
     */
    OnContentTemplateSelectorChanged(oldContentTemplateSelector, newContentTemplateSelector) {
        result := ComCall(7, this, "ptr", oldContentTemplateSelector, "ptr", newContentTemplateSelector, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

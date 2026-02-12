#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DataTemplate.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IDataTemplateSelectorOverrides extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataTemplateSelectorOverrides
     * @type {Guid}
     */
    static IID => Guid("{2d162925-5966-4bfa-8638-4d345689f6cf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SelectTemplateCore"]

    /**
     * 
     * @param {IInspectable} item 
     * @param {DependencyObject} container 
     * @returns {DataTemplate} 
     */
    SelectTemplateCore(item, container) {
        result := ComCall(6, this, "ptr", item, "ptr", container, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DataTemplate(result_)
    }
}

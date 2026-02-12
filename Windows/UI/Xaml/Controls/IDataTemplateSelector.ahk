#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DataTemplate.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IDataTemplateSelector extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataTemplateSelector
     * @type {Guid}
     */
    static IID => Guid("{a907d496-46a0-4cd7-8dbe-f9a581df60b1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SelectTemplate"]

    /**
     * 
     * @param {IInspectable} item 
     * @param {DependencyObject} container 
     * @returns {DataTemplate} 
     */
    SelectTemplate(item, container) {
        result := ComCall(6, this, "ptr", item, "ptr", container, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DataTemplate(result_)
    }
}

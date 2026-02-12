#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DataTemplate.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IDataTemplateSelectorOverrides2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataTemplateSelectorOverrides2
     * @type {Guid}
     */
    static IID => Guid("{6c3fb5fc-8e84-4c91-ac15-04a1d885500f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SelectTemplateForItemCore"]

    /**
     * 
     * @param {IInspectable} item 
     * @returns {DataTemplate} 
     */
    SelectTemplateForItemCore(item) {
        result := ComCall(6, this, "ptr", item, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DataTemplate(result_)
    }
}

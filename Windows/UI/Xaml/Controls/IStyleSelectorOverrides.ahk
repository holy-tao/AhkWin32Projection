#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Style.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IStyleSelectorOverrides extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStyleSelectorOverrides
     * @type {Guid}
     */
    static IID => Guid("{08add66d-0e2e-43a0-aeca-8faa94b9d017}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SelectStyleCore"]

    /**
     * 
     * @param {IInspectable} item 
     * @param {DependencyObject} container 
     * @returns {Style} 
     */
    SelectStyleCore(item, container) {
        result := ComCall(6, this, "ptr", item, "ptr", container, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Style(result_)
    }
}

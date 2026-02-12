#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyObject.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IItemsControl3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IItemsControl3
     * @type {Guid}
     */
    static IID => Guid("{502b7489-aee4-4de3-a2ab-195ac20c4212}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GroupHeaderContainerFromItemContainer"]

    /**
     * 
     * @param {DependencyObject} itemContainer 
     * @returns {DependencyObject} 
     */
    GroupHeaderContainerFromItemContainer(itemContainer) {
        result := ComCall(6, this, "ptr", itemContainer, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyObject(result_)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SelectionChangedEventArgs.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ISelectionChangedEventArgsFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISelectionChangedEventArgsFactory
     * @type {Guid}
     */
    static IID => Guid("{11a8b6b5-2830-4517-84cd-5524c8b88b45}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstanceWithRemovedItemsAndAddedItems"]

    /**
     * 
     * @param {IVector<IInspectable>} removedItems 
     * @param {IVector<IInspectable>} addedItems 
     * @param {IInspectable} baseInterface 
     * @param {Pointer<Object>} innerInterface 
     * @returns {SelectionChangedEventArgs} 
     */
    CreateInstanceWithRemovedItemsAndAddedItems(removedItems, addedItems, baseInterface, innerInterface) {
        result := ComCall(6, this, "ptr", removedItems, "ptr", addedItems, "ptr", baseInterface, "ptr", innerInterface, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SelectionChangedEventArgs(value)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IItemsPickedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IItemsPickedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{f95b9aac-a621-488e-9156-8ee31165be04}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AddedItems", "get_RemovedItems"]

    /**
     * @type {IVector<IInspectable>} 
     */
    AddedItems {
        get => this.get_AddedItems()
    }

    /**
     * @type {IVector<IInspectable>} 
     */
    RemovedItems {
        get => this.get_RemovedItems()
    }

    /**
     * 
     * @returns {IVector<IInspectable>} 
     */
    get_AddedItems() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(IInspectable, value)
    }

    /**
     * 
     * @returns {IVector<IInspectable>} 
     */
    get_RemovedItems() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(IInspectable, value)
    }
}

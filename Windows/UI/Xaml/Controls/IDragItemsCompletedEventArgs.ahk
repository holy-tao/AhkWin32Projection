#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IDragItemsCompletedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDragItemsCompletedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{af05f22f-9e78-4b21-9a8e-41c2d1367a2a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Items", "get_DropResult"]

    /**
     * @type {IVectorView<IInspectable>} 
     */
    Items {
        get => this.get_Items()
    }

    /**
     * @type {Integer} 
     */
    DropResult {
        get => this.get_DropResult()
    }

    /**
     * 
     * @returns {IVectorView<IInspectable>} 
     */
    get_Items() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(IInspectable, value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DropResult() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

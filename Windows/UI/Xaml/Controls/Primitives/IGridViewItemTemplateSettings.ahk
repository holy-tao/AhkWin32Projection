#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class IGridViewItemTemplateSettings extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGridViewItemTemplateSettings
     * @type {Guid}
     */
    static IID => Guid("{9e30baaf-165d-4267-a45e-1a43a75706ac}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DragItemsCount"]

    /**
     * @type {Integer} 
     */
    DragItemsCount {
        get => this.get_DragItemsCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DragItemsCount() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

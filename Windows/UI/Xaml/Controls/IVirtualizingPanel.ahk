#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ItemContainerGenerator.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IVirtualizingPanel extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVirtualizingPanel
     * @type {Guid}
     */
    static IID => Guid("{38aad50c-12cf-4d1e-a884-c9df85f07cd9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ItemContainerGenerator"]

    /**
     * @type {ItemContainerGenerator} 
     */
    ItemContainerGenerator {
        get => this.get_ItemContainerGenerator()
    }

    /**
     * 
     * @returns {ItemContainerGenerator} 
     */
    get_ItemContainerGenerator() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ItemContainerGenerator(value)
    }
}

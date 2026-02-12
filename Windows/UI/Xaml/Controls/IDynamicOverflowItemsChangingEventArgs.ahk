#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IDynamicOverflowItemsChangingEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDynamicOverflowItemsChangingEventArgs
     * @type {Guid}
     */
    static IID => Guid("{c93c736f-6f6e-4e43-90d9-9b46a0d88b9f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Action"]

    /**
     * @type {Integer} 
     */
    Action {
        get => this.get_Action()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Action() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

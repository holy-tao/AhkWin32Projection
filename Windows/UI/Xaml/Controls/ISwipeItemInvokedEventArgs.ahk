#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SwipeControl.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ISwipeItemInvokedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISwipeItemInvokedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{c5b025f5-cb32-4733-8011-5d0d37f4550a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SwipeControl"]

    /**
     * @type {SwipeControl} 
     */
    SwipeControl {
        get => this.get_SwipeControl()
    }

    /**
     * 
     * @returns {SwipeControl} 
     */
    get_SwipeControl() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SwipeControl(value)
    }
}

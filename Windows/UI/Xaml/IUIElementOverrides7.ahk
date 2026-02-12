#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IIterable.ahk
#Include .\DependencyObject.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IUIElementOverrides7 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIElementOverrides7
     * @type {Guid}
     */
    static IID => Guid("{b97f7f68-c29b-4c99-a1c3-952619d6e720}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetChildrenInTabFocusOrder", "OnProcessKeyboardAccelerators"]

    /**
     * 
     * @returns {IIterable<DependencyObject>} 
     */
    GetChildrenInTabFocusOrder() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IIterable(DependencyObject, result_)
    }

    /**
     * 
     * @param {ProcessKeyboardAcceleratorEventArgs} args 
     * @returns {HRESULT} 
     */
    OnProcessKeyboardAccelerators(args) {
        result := ComCall(7, this, "ptr", args, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

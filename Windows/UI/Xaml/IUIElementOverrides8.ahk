#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IUIElementOverrides8 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIElementOverrides8
     * @type {Guid}
     */
    static IID => Guid("{4a5a645c-548d-48cf-b998-7844d6e235a1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnKeyboardAcceleratorInvoked", "OnBringIntoViewRequested"]

    /**
     * 
     * @param {KeyboardAcceleratorInvokedEventArgs} args 
     * @returns {HRESULT} 
     */
    OnKeyboardAcceleratorInvoked(args) {
        result := ComCall(6, this, "ptr", args, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BringIntoViewRequestedEventArgs} e 
     * @returns {HRESULT} 
     */
    OnBringIntoViewRequested(e) {
        result := ComCall(7, this, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

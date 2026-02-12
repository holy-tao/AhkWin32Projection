#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\KeyboardAccelerator.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class IKeyboardAcceleratorInvokedEventArgs2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKeyboardAcceleratorInvokedEventArgs2
     * @type {Guid}
     */
    static IID => Guid("{befca4b8-5907-48ee-8e21-9c969078fa11}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_KeyboardAccelerator"]

    /**
     * @type {KeyboardAccelerator} 
     */
    KeyboardAccelerator {
        get => this.get_KeyboardAccelerator()
    }

    /**
     * 
     * @returns {KeyboardAccelerator} 
     */
    get_KeyboardAccelerator() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return KeyboardAccelerator(value)
    }
}

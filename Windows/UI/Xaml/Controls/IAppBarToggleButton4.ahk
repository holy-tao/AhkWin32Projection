#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IAppBarToggleButton4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppBarToggleButton4
     * @type {Guid}
     */
    static IID => Guid("{b86b736e-3eaf-4751-a897-00029f1f6aca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_KeyboardAcceleratorTextOverride", "put_KeyboardAcceleratorTextOverride"]

    /**
     * @type {HSTRING} 
     */
    KeyboardAcceleratorTextOverride {
        get => this.get_KeyboardAcceleratorTextOverride()
        set => this.put_KeyboardAcceleratorTextOverride(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_KeyboardAcceleratorTextOverride() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_KeyboardAcceleratorTextOverride(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Media\Brush.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IComboBox5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComboBox5
     * @type {Guid}
     */
    static IID => Guid("{ab79d646-800a-4a28-969b-34bb8fb458cf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PlaceholderForeground", "put_PlaceholderForeground"]

    /**
     * @type {Brush} 
     */
    PlaceholderForeground {
        get => this.get_PlaceholderForeground()
        set => this.put_PlaceholderForeground(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_PlaceholderForeground() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Brush(value)
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_PlaceholderForeground(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

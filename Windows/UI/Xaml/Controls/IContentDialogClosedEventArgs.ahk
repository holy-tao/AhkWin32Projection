#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IContentDialogClosedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContentDialogClosedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{905522ef-2cba-4af8-b666-cc36c22732fb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Result"]

    /**
     * @type {Integer} 
     */
    Result {
        get => this.get_Result()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Result() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

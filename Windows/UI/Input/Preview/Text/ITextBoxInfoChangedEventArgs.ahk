#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\TextBoxInfo.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Preview.Text
 * @version WindowsRuntime 1.4
 */
class ITextBoxInfoChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextBoxInfoChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{ac1275af-648c-5bac-b29f-d1ea17e9e6d6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TextBoxInfo"]

    /**
     * @type {TextBoxInfo} 
     */
    TextBoxInfo {
        get => this.get_TextBoxInfo()
    }

    /**
     * 
     * @returns {TextBoxInfo} 
     */
    get_TextBoxInfo() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TextBoxInfo(value)
    }
}

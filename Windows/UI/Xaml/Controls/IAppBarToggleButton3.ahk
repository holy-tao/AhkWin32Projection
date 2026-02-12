#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IAppBarToggleButton3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppBarToggleButton3
     * @type {Guid}
     */
    static IID => Guid("{ef9a85e5-16ff-4d72-b9e8-9b861eaf84a8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LabelPosition", "put_LabelPosition"]

    /**
     * @type {Integer} 
     */
    LabelPosition {
        get => this.get_LabelPosition()
        set => this.put_LabelPosition(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LabelPosition() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_LabelPosition(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

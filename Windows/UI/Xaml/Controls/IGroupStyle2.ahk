#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Style.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IGroupStyle2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGroupStyle2
     * @type {Guid}
     */
    static IID => Guid("{69f90679-3a11-4fe7-b4df-2a0139d4018b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HeaderContainerStyle", "put_HeaderContainerStyle"]

    /**
     * @type {Style} 
     */
    HeaderContainerStyle {
        get => this.get_HeaderContainerStyle()
        set => this.put_HeaderContainerStyle(value)
    }

    /**
     * 
     * @returns {Style} 
     */
    get_HeaderContainerStyle() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Style(value)
    }

    /**
     * 
     * @param {Style} value 
     * @returns {HRESULT} 
     */
    put_HeaderContainerStyle(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

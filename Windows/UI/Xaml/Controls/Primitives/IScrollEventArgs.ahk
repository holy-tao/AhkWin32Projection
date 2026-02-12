#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class IScrollEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IScrollEventArgs
     * @type {Guid}
     */
    static IID => Guid("{c57e5168-3afe-448d-b752-2f364c75d743}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_NewValue", "get_ScrollEventType"]

    /**
     * @type {Float} 
     */
    NewValue {
        get => this.get_NewValue()
    }

    /**
     * @type {Integer} 
     */
    ScrollEventType {
        get => this.get_ScrollEventType()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_NewValue() {
        result := ComCall(6, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ScrollEventType() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

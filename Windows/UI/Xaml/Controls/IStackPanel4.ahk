#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IStackPanel4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStackPanel4
     * @type {Guid}
     */
    static IID => Guid("{43ebf7f6-3196-412e-8a95-add002ff43f0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Spacing", "put_Spacing"]

    /**
     * @type {Float} 
     */
    Spacing {
        get => this.get_Spacing()
        set => this.put_Spacing(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Spacing() {
        result := ComCall(6, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Spacing(value) {
        result := ComCall(7, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

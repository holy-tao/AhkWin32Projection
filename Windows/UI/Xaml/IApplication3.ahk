#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IApplication3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IApplication3
     * @type {Guid}
     */
    static IID => Guid("{b775ad7c-18b8-45ca-a1b0-dc483e4b1028}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HighContrastAdjustment", "put_HighContrastAdjustment"]

    /**
     * @type {Integer} 
     */
    HighContrastAdjustment {
        get => this.get_HighContrastAdjustment()
        set => this.put_HighContrastAdjustment(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HighContrastAdjustment() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
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
    put_HighContrastAdjustment(value) {
        result := ComCall(7, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

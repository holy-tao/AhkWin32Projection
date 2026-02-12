#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class IExponentialEase extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IExponentialEase
     * @type {Guid}
     */
    static IID => Guid("{7cb9e41d-f0bb-4bca-9da5-9ba3a11734c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Exponent", "put_Exponent"]

    /**
     * @type {Float} 
     */
    Exponent {
        get => this.get_Exponent()
        set => this.put_Exponent(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Exponent() {
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
    put_Exponent(value) {
        result := ComCall(7, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

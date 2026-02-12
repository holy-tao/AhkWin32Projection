#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ISymbolIcon extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISymbolIcon
     * @type {Guid}
     */
    static IID => Guid("{7a4774c9-a6a3-4b30-8ff1-9081d70e9a5c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Symbol", "put_Symbol"]

    /**
     * @type {Integer} 
     */
    Symbol {
        get => this.get_Symbol()
        set => this.put_Symbol(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Symbol() {
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
    put_Symbol(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

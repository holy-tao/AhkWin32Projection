#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\Color.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionColorBrush extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionColorBrush
     * @type {Guid}
     */
    static IID => Guid("{2b264c5e-bf35-4831-8642-cf70c20fff2f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Color", "put_Color"]

    /**
     * @type {Color} 
     */
    Color {
        get => this.get_Color()
        set => this.put_Color(value)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Color() {
        value := Color()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_Color(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

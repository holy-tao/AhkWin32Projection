#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Color.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IXamlCompositionBrushBase extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXamlCompositionBrushBase
     * @type {Guid}
     */
    static IID => Guid("{03e432d9-b35c-4a79-811c-c5652004da0e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FallbackColor", "put_FallbackColor"]

    /**
     * @type {Color} 
     */
    FallbackColor {
        get => this.get_FallbackColor()
        set => this.put_FallbackColor(value)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_FallbackColor() {
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
    put_FallbackColor(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

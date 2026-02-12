#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Composition\CompositionBrush.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IXamlCompositionBrushBaseProtected extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXamlCompositionBrushBaseProtected
     * @type {Guid}
     */
    static IID => Guid("{1513f3d8-0457-4e1c-ad77-11c1d9879743}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CompositionBrush", "put_CompositionBrush"]

    /**
     * @type {CompositionBrush} 
     */
    CompositionBrush {
        get => this.get_CompositionBrush()
        set => this.put_CompositionBrush(value)
    }

    /**
     * 
     * @returns {CompositionBrush} 
     */
    get_CompositionBrush() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionBrush(value)
    }

    /**
     * 
     * @param {CompositionBrush} value 
     * @returns {HRESULT} 
     */
    put_CompositionBrush(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

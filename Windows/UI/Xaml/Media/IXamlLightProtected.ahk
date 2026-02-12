#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Composition\CompositionLight.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IXamlLightProtected extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXamlLightProtected
     * @type {Guid}
     */
    static IID => Guid("{5ecf220b-1252-43d0-9729-6ea692046838}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CompositionLight", "put_CompositionLight"]

    /**
     * @type {CompositionLight} 
     */
    CompositionLight {
        get => this.get_CompositionLight()
        set => this.put_CompositionLight(value)
    }

    /**
     * 
     * @returns {CompositionLight} 
     */
    get_CompositionLight() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionLight(value)
    }

    /**
     * 
     * @param {CompositionLight} value 
     * @returns {HRESULT} 
     */
    put_CompositionLight(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

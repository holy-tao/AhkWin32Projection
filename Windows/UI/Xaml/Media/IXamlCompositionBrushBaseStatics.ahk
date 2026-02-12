#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IXamlCompositionBrushBaseStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXamlCompositionBrushBaseStatics
     * @type {Guid}
     */
    static IID => Guid("{4fd49b06-061a-441f-b97a-adfbd41ae681}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FallbackColorProperty"]

    /**
     * @type {DependencyProperty} 
     */
    FallbackColorProperty {
        get => this.get_FallbackColorProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_FallbackColorProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

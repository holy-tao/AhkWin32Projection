#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ISymbolIconSourceStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISymbolIconSourceStatics
     * @type {Guid}
     */
    static IID => Guid("{8bc49738-d94e-4148-8d64-1adf0f23f25f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SymbolProperty"]

    /**
     * @type {DependencyProperty} 
     */
    SymbolProperty {
        get => this.get_SymbolProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_SymbolProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

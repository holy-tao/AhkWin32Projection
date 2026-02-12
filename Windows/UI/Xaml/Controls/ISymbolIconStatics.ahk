#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ISymbolIconStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISymbolIconStatics
     * @type {Guid}
     */
    static IID => Guid("{8624fbdf-952c-4f76-b03f-30833be99572}")

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

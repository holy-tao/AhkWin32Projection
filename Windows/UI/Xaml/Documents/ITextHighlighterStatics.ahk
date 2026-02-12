#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Documents
 * @version WindowsRuntime 1.4
 */
class ITextHighlighterStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextHighlighterStatics
     * @type {Guid}
     */
    static IID => Guid("{b3b009c4-3a7e-49cc-ab84-29c405488765}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ForegroundProperty", "get_BackgroundProperty"]

    /**
     * @type {DependencyProperty} 
     */
    ForegroundProperty {
        get => this.get_ForegroundProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    BackgroundProperty {
        get => this.get_BackgroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ForegroundProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_BackgroundProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

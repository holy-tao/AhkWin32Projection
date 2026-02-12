#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Documents
 * @version WindowsRuntime 1.4
 */
class IHyperlinkStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHyperlinkStatics2
     * @type {Guid}
     */
    static IID => Guid("{5028d8b7-7adf-43ee-a4ae-9c925f755716}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UnderlineStyleProperty"]

    /**
     * @type {DependencyProperty} 
     */
    UnderlineStyleProperty {
        get => this.get_UnderlineStyleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_UnderlineStyleProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

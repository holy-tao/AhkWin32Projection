#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Documents
 * @version WindowsRuntime 1.4
 */
class IParagraphStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IParagraphStatics
     * @type {Guid}
     */
    static IID => Guid("{ef08889a-535b-4e4c-8d84-283b33e98a37}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TextIndentProperty"]

    /**
     * @type {DependencyProperty} 
     */
    TextIndentProperty {
        get => this.get_TextIndentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_TextIndentProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

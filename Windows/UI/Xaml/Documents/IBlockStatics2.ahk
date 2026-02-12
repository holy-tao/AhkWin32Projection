#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Documents
 * @version WindowsRuntime 1.4
 */
class IBlockStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBlockStatics2
     * @type {Guid}
     */
    static IID => Guid("{af01a4d6-03e3-4cee-9b02-2bfc308b27a9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HorizontalTextAlignmentProperty"]

    /**
     * @type {DependencyProperty} 
     */
    HorizontalTextAlignmentProperty {
        get => this.get_HorizontalTextAlignmentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_HorizontalTextAlignmentProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

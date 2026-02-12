#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IRichEditBoxStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRichEditBoxStatics3
     * @type {Guid}
     */
    static IID => Guid("{6d17eec5-1fb3-4c8b-aa23-f5e15d6ab64e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DesiredCandidateWindowAlignmentProperty", "get_TextReadingOrderProperty"]

    /**
     * @type {DependencyProperty} 
     */
    DesiredCandidateWindowAlignmentProperty {
        get => this.get_DesiredCandidateWindowAlignmentProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TextReadingOrderProperty {
        get => this.get_TextReadingOrderProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_DesiredCandidateWindowAlignmentProperty() {
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
    get_TextReadingOrderProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

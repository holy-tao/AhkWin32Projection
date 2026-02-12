#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IContentPresenterStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContentPresenterStatics2
     * @type {Guid}
     */
    static IID => Guid("{c7d89dd9-06e6-46be-a8a0-9c117d3024a3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OpticalMarginAlignmentProperty", "get_TextLineBoundsProperty"]

    /**
     * @type {DependencyProperty} 
     */
    OpticalMarginAlignmentProperty {
        get => this.get_OpticalMarginAlignmentProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TextLineBoundsProperty {
        get => this.get_TextLineBoundsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_OpticalMarginAlignmentProperty() {
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
    get_TextLineBoundsProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

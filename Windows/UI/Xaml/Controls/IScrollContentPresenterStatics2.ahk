#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IScrollContentPresenterStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IScrollContentPresenterStatics2
     * @type {Guid}
     */
    static IID => Guid("{e172ff1a-c676-524b-8f20-96152149d05e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CanContentRenderOutsideBoundsProperty", "get_SizesContentToTemplatedParentProperty"]

    /**
     * @type {DependencyProperty} 
     */
    CanContentRenderOutsideBoundsProperty {
        get => this.get_CanContentRenderOutsideBoundsProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SizesContentToTemplatedParentProperty {
        get => this.get_SizesContentToTemplatedParentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CanContentRenderOutsideBoundsProperty() {
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
    get_SizesContentToTemplatedParentProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

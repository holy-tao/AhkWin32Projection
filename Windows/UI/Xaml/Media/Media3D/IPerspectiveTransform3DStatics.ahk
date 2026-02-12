#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Media3D
 * @version WindowsRuntime 1.4
 */
class IPerspectiveTransform3DStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPerspectiveTransform3DStatics
     * @type {Guid}
     */
    static IID => Guid("{8e6f6400-620c-48c7-844d-3f0984da5b17}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DepthProperty", "get_OffsetXProperty", "get_OffsetYProperty"]

    /**
     * @type {DependencyProperty} 
     */
    DepthProperty {
        get => this.get_DepthProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    OffsetXProperty {
        get => this.get_OffsetXProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    OffsetYProperty {
        get => this.get_OffsetYProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_DepthProperty() {
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
    get_OffsetXProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_OffsetYProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

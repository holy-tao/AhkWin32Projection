#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IPlaneProjectionStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlaneProjectionStatics
     * @type {Guid}
     */
    static IID => Guid("{ad919c67-3bdc-4855-8969-d1f9a3adc27d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LocalOffsetXProperty", "get_LocalOffsetYProperty", "get_LocalOffsetZProperty", "get_RotationXProperty", "get_RotationYProperty", "get_RotationZProperty", "get_CenterOfRotationXProperty", "get_CenterOfRotationYProperty", "get_CenterOfRotationZProperty", "get_GlobalOffsetXProperty", "get_GlobalOffsetYProperty", "get_GlobalOffsetZProperty", "get_ProjectionMatrixProperty"]

    /**
     * @type {DependencyProperty} 
     */
    LocalOffsetXProperty {
        get => this.get_LocalOffsetXProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    LocalOffsetYProperty {
        get => this.get_LocalOffsetYProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    LocalOffsetZProperty {
        get => this.get_LocalOffsetZProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    RotationXProperty {
        get => this.get_RotationXProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    RotationYProperty {
        get => this.get_RotationYProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    RotationZProperty {
        get => this.get_RotationZProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CenterOfRotationXProperty {
        get => this.get_CenterOfRotationXProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CenterOfRotationYProperty {
        get => this.get_CenterOfRotationYProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CenterOfRotationZProperty {
        get => this.get_CenterOfRotationZProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    GlobalOffsetXProperty {
        get => this.get_GlobalOffsetXProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    GlobalOffsetYProperty {
        get => this.get_GlobalOffsetYProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    GlobalOffsetZProperty {
        get => this.get_GlobalOffsetZProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ProjectionMatrixProperty {
        get => this.get_ProjectionMatrixProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_LocalOffsetXProperty() {
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
    get_LocalOffsetYProperty() {
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
    get_LocalOffsetZProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_RotationXProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_RotationYProperty() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_RotationZProperty() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CenterOfRotationXProperty() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CenterOfRotationYProperty() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CenterOfRotationZProperty() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_GlobalOffsetXProperty() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_GlobalOffsetYProperty() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_GlobalOffsetZProperty() {
        result := ComCall(17, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ProjectionMatrixProperty() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

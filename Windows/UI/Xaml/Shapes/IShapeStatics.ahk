#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Shapes
 * @version WindowsRuntime 1.4
 */
class IShapeStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShapeStatics
     * @type {Guid}
     */
    static IID => Guid("{1d7b4c55-9df3-48dc-9194-9d306faa6089}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FillProperty", "get_StrokeProperty", "get_StrokeMiterLimitProperty", "get_StrokeThicknessProperty", "get_StrokeStartLineCapProperty", "get_StrokeEndLineCapProperty", "get_StrokeLineJoinProperty", "get_StrokeDashOffsetProperty", "get_StrokeDashCapProperty", "get_StrokeDashArrayProperty", "get_StretchProperty"]

    /**
     * @type {DependencyProperty} 
     */
    FillProperty {
        get => this.get_FillProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    StrokeProperty {
        get => this.get_StrokeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    StrokeMiterLimitProperty {
        get => this.get_StrokeMiterLimitProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    StrokeThicknessProperty {
        get => this.get_StrokeThicknessProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    StrokeStartLineCapProperty {
        get => this.get_StrokeStartLineCapProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    StrokeEndLineCapProperty {
        get => this.get_StrokeEndLineCapProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    StrokeLineJoinProperty {
        get => this.get_StrokeLineJoinProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    StrokeDashOffsetProperty {
        get => this.get_StrokeDashOffsetProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    StrokeDashCapProperty {
        get => this.get_StrokeDashCapProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    StrokeDashArrayProperty {
        get => this.get_StrokeDashArrayProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    StretchProperty {
        get => this.get_StretchProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_FillProperty() {
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
    get_StrokeProperty() {
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
    get_StrokeMiterLimitProperty() {
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
    get_StrokeThicknessProperty() {
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
    get_StrokeStartLineCapProperty() {
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
    get_StrokeEndLineCapProperty() {
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
    get_StrokeLineJoinProperty() {
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
    get_StrokeDashOffsetProperty() {
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
    get_StrokeDashCapProperty() {
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
    get_StrokeDashArrayProperty() {
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
    get_StretchProperty() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

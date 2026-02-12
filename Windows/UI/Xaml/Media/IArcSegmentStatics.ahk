#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IArcSegmentStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IArcSegmentStatics
     * @type {Guid}
     */
    static IID => Guid("{82348f6e-8a69-4204-9c12-7207df317643}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PointProperty", "get_SizeProperty", "get_RotationAngleProperty", "get_IsLargeArcProperty", "get_SweepDirectionProperty"]

    /**
     * @type {DependencyProperty} 
     */
    PointProperty {
        get => this.get_PointProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SizeProperty {
        get => this.get_SizeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    RotationAngleProperty {
        get => this.get_RotationAngleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsLargeArcProperty {
        get => this.get_IsLargeArcProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SweepDirectionProperty {
        get => this.get_SweepDirectionProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_PointProperty() {
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
    get_SizeProperty() {
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
    get_RotationAngleProperty() {
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
    get_IsLargeArcProperty() {
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
    get_SweepDirectionProperty() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

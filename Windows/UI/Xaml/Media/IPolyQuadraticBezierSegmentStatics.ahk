#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IPolyQuadraticBezierSegmentStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPolyQuadraticBezierSegmentStatics
     * @type {Guid}
     */
    static IID => Guid("{fdf5eb75-7ad5-4c89-8169-8c9786abd9eb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PointsProperty"]

    /**
     * @type {DependencyProperty} 
     */
    PointsProperty {
        get => this.get_PointsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_PointsProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

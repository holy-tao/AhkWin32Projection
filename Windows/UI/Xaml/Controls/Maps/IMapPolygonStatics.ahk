#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IMapPolygonStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapPolygonStatics
     * @type {Guid}
     */
    static IID => Guid("{37f573be-097b-424c-87cc-2ee042fda6d2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PathProperty", "get_StrokeThicknessProperty", "get_StrokeDashedProperty"]

    /**
     * @type {DependencyProperty} 
     */
    PathProperty {
        get => this.get_PathProperty()
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
    StrokeDashedProperty {
        get => this.get_StrokeDashedProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_PathProperty() {
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
    get_StrokeThicknessProperty() {
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
    get_StrokeDashedProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

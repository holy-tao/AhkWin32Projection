#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IPolyLineSegmentStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPolyLineSegmentStatics
     * @type {Guid}
     */
    static IID => Guid("{d64a2c87-33f1-4e70-a47f-b4981ef648a2}")

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

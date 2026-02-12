#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IBezierSegmentStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBezierSegmentStatics
     * @type {Guid}
     */
    static IID => Guid("{c0287bac-1410-4530-8452-1c9d0ad1f341}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Point1Property", "get_Point2Property", "get_Point3Property"]

    /**
     * @type {DependencyProperty} 
     */
    Point1Property {
        get => this.get_Point1Property()
    }

    /**
     * @type {DependencyProperty} 
     */
    Point2Property {
        get => this.get_Point2Property()
    }

    /**
     * @type {DependencyProperty} 
     */
    Point3Property {
        get => this.get_Point3Property()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_Point1Property() {
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
    get_Point2Property() {
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
    get_Point3Property() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

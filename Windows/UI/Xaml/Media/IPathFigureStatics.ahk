#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IPathFigureStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPathFigureStatics
     * @type {Guid}
     */
    static IID => Guid("{b60591d9-2395-4317-9552-3a58526f8c7b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SegmentsProperty", "get_StartPointProperty", "get_IsClosedProperty", "get_IsFilledProperty"]

    /**
     * @type {DependencyProperty} 
     */
    SegmentsProperty {
        get => this.get_SegmentsProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    StartPointProperty {
        get => this.get_StartPointProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsClosedProperty {
        get => this.get_IsClosedProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsFilledProperty {
        get => this.get_IsFilledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_SegmentsProperty() {
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
    get_StartPointProperty() {
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
    get_IsClosedProperty() {
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
    get_IsFilledProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

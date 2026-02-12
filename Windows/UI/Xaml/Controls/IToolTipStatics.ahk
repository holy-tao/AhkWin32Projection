#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IToolTipStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IToolTipStatics
     * @type {Guid}
     */
    static IID => Guid("{f00285b8-4ba9-4f4f-86a7-86003813ceb3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HorizontalOffsetProperty", "get_IsOpenProperty", "get_PlacementProperty", "get_PlacementTargetProperty", "get_VerticalOffsetProperty"]

    /**
     * @type {DependencyProperty} 
     */
    HorizontalOffsetProperty {
        get => this.get_HorizontalOffsetProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsOpenProperty {
        get => this.get_IsOpenProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PlacementProperty {
        get => this.get_PlacementProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PlacementTargetProperty {
        get => this.get_PlacementTargetProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    VerticalOffsetProperty {
        get => this.get_VerticalOffsetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_HorizontalOffsetProperty() {
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
    get_IsOpenProperty() {
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
    get_PlacementProperty() {
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
    get_PlacementTargetProperty() {
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
    get_VerticalOffsetProperty() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

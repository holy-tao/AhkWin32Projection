#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class IDragOverThemeAnimationStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDragOverThemeAnimationStatics
     * @type {Guid}
     */
    static IID => Guid("{146ffe57-3c9d-41d9-a5ff-8d7239516810}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TargetNameProperty", "get_ToOffsetProperty", "get_DirectionProperty"]

    /**
     * @type {DependencyProperty} 
     */
    TargetNameProperty {
        get => this.get_TargetNameProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ToOffsetProperty {
        get => this.get_ToOffsetProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    DirectionProperty {
        get => this.get_DirectionProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_TargetNameProperty() {
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
    get_ToOffsetProperty() {
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
    get_DirectionProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

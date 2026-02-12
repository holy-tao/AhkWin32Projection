#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IHandwritingViewStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHandwritingViewStatics
     * @type {Guid}
     */
    static IID => Guid("{bb7ceed0-cc5f-4004-b8c8-142e195f0618}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PlacementTargetProperty", "get_PlacementAlignmentProperty", "get_IsOpenProperty", "get_AreCandidatesEnabledProperty"]

    /**
     * @type {DependencyProperty} 
     */
    PlacementTargetProperty {
        get => this.get_PlacementTargetProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PlacementAlignmentProperty {
        get => this.get_PlacementAlignmentProperty()
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
    AreCandidatesEnabledProperty {
        get => this.get_AreCandidatesEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_PlacementTargetProperty() {
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
    get_PlacementAlignmentProperty() {
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
    get_IsOpenProperty() {
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
    get_AreCandidatesEnabledProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

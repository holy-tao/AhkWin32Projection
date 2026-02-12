#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IMapTileSourceStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapTileSourceStatics2
     * @type {Guid}
     */
    static IID => Guid("{75cdd47e-669c-50fd-ad85-5ea5174cf59b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AnimationStateProperty", "get_AutoPlayProperty", "get_FrameCountProperty", "get_FrameDurationProperty"]

    /**
     * @type {DependencyProperty} 
     */
    AnimationStateProperty {
        get => this.get_AnimationStateProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    AutoPlayProperty {
        get => this.get_AutoPlayProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    FrameCountProperty {
        get => this.get_FrameCountProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    FrameDurationProperty {
        get => this.get_FrameDurationProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_AnimationStateProperty() {
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
    get_AutoPlayProperty() {
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
    get_FrameCountProperty() {
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
    get_FrameDurationProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

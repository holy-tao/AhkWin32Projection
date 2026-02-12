#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Imaging
 * @version WindowsRuntime 1.4
 */
class IBitmapImageStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBitmapImageStatics3
     * @type {Guid}
     */
    static IID => Guid("{2b44e30d-f6d5-4411-a8cd-bf7603c4faa0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsAnimatedBitmapProperty", "get_IsPlayingProperty", "get_AutoPlayProperty"]

    /**
     * @type {DependencyProperty} 
     */
    IsAnimatedBitmapProperty {
        get => this.get_IsAnimatedBitmapProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsPlayingProperty {
        get => this.get_IsPlayingProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    AutoPlayProperty {
        get => this.get_AutoPlayProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsAnimatedBitmapProperty() {
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
    get_IsPlayingProperty() {
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
    get_AutoPlayProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

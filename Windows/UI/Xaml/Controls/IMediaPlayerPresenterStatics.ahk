#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IMediaPlayerPresenterStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaPlayerPresenterStatics
     * @type {Guid}
     */
    static IID => Guid("{84d774fe-ead4-4957-b42b-223158ca0de7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MediaPlayerProperty", "get_StretchProperty", "get_IsFullWindowProperty"]

    /**
     * @type {DependencyProperty} 
     */
    MediaPlayerProperty {
        get => this.get_MediaPlayerProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    StretchProperty {
        get => this.get_StretchProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsFullWindowProperty {
        get => this.get_IsFullWindowProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_MediaPlayerProperty() {
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
    get_StretchProperty() {
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
    get_IsFullWindowProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

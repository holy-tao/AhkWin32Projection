#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IPageStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPageStatics
     * @type {Guid}
     */
    static IID => Guid("{376dde71-f725-46dd-8d80-eeeaf7da74e5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FrameProperty", "get_TopAppBarProperty", "get_BottomAppBarProperty"]

    /**
     * @type {DependencyProperty} 
     */
    FrameProperty {
        get => this.get_FrameProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TopAppBarProperty {
        get => this.get_TopAppBarProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    BottomAppBarProperty {
        get => this.get_BottomAppBarProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_FrameProperty() {
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
    get_TopAppBarProperty() {
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
    get_BottomAppBarProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

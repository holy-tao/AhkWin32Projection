#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IScrollViewerStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IScrollViewerStatics2
     * @type {Guid}
     */
    static IID => Guid("{33d129ad-8d7e-42a0-bf32-905cccd04d41}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TopLeftHeaderProperty", "get_LeftHeaderProperty", "get_TopHeaderProperty"]

    /**
     * @type {DependencyProperty} 
     */
    TopLeftHeaderProperty {
        get => this.get_TopLeftHeaderProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    LeftHeaderProperty {
        get => this.get_LeftHeaderProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TopHeaderProperty {
        get => this.get_TopHeaderProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_TopLeftHeaderProperty() {
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
    get_LeftHeaderProperty() {
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
    get_TopHeaderProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

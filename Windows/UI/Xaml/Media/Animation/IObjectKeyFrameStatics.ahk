#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class IObjectKeyFrameStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IObjectKeyFrameStatics
     * @type {Guid}
     */
    static IID => Guid("{2cd6ab00-5319-4286-8eed-4e755ea0cf9c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ValueProperty", "get_KeyTimeProperty"]

    /**
     * @type {DependencyProperty} 
     */
    ValueProperty {
        get => this.get_ValueProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    KeyTimeProperty {
        get => this.get_KeyTimeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ValueProperty() {
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
    get_KeyTimeProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

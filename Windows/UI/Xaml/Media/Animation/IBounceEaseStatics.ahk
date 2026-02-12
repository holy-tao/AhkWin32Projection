#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class IBounceEaseStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBounceEaseStatics
     * @type {Guid}
     */
    static IID => Guid("{c0701da2-4f73-41c9-b2cb-2ea3105107ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BouncesProperty", "get_BouncinessProperty"]

    /**
     * @type {DependencyProperty} 
     */
    BouncesProperty {
        get => this.get_BouncesProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    BouncinessProperty {
        get => this.get_BouncinessProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_BouncesProperty() {
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
    get_BouncinessProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

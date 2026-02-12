#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class ISplinePointKeyFrameStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISplinePointKeyFrameStatics
     * @type {Guid}
     */
    static IID => Guid("{e97a32c2-0a7a-4766-95cb-0d692611cb4c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_KeySplineProperty"]

    /**
     * @type {DependencyProperty} 
     */
    KeySplineProperty {
        get => this.get_KeySplineProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_KeySplineProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

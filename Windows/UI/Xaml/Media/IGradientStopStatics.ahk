#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IGradientStopStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGradientStopStatics
     * @type {Guid}
     */
    static IID => Guid("{602a6d75-6193-4fe5-8e82-c7c6f6febafd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ColorProperty", "get_OffsetProperty"]

    /**
     * @type {DependencyProperty} 
     */
    ColorProperty {
        get => this.get_ColorProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    OffsetProperty {
        get => this.get_OffsetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ColorProperty() {
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
    get_OffsetProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

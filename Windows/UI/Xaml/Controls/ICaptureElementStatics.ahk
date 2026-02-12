#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ICaptureElementStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICaptureElementStatics
     * @type {Guid}
     */
    static IID => Guid("{1e438ded-7da6-409e-806e-305ae4ad9b3f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SourceProperty", "get_StretchProperty"]

    /**
     * @type {DependencyProperty} 
     */
    SourceProperty {
        get => this.get_SourceProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    StretchProperty {
        get => this.get_StretchProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_SourceProperty() {
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
}

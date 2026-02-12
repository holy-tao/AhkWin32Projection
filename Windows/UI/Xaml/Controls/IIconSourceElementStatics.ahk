#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IIconSourceElementStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIconSourceElementStatics
     * @type {Guid}
     */
    static IID => Guid("{f37cfd45-f3d8-50ff-a1b8-0fba4ae61d79}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IconSourceProperty"]

    /**
     * @type {DependencyProperty} 
     */
    IconSourceProperty {
        get => this.get_IconSourceProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IconSourceProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

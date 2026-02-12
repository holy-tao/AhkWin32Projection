#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class IAppBarToggleButtonTemplateSettings extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppBarToggleButtonTemplateSettings
     * @type {Guid}
     */
    static IID => Guid("{aaf99c48-d8f4-40d9-9fa3-3a64f0fec5d8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_KeyboardAcceleratorTextMinWidth"]

    /**
     * @type {Float} 
     */
    KeyboardAcceleratorTextMinWidth {
        get => this.get_KeyboardAcceleratorTextMinWidth()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_KeyboardAcceleratorTextMinWidth() {
        result := ComCall(6, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

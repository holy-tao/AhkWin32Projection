#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class ICommandBarTemplateSettings2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICommandBarTemplateSettings2
     * @type {Guid}
     */
    static IID => Guid("{fbb24f93-c2e2-4177-a2b6-3cd705073cf6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OverflowContentMaxWidth"]

    /**
     * @type {Float} 
     */
    OverflowContentMaxWidth {
        get => this.get_OverflowContentMaxWidth()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OverflowContentMaxWidth() {
        result := ComCall(6, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\InkInputConfiguration.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class IInkPresenter3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkPresenter3
     * @type {Guid}
     */
    static IID => Guid("{51e1ce89-d37d-4a90-83fc-7f5e9dfbf217}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_InputConfiguration"]

    /**
     * @type {InkInputConfiguration} 
     */
    InputConfiguration {
        get => this.get_InputConfiguration()
    }

    /**
     * 
     * @returns {InkInputConfiguration} 
     */
    get_InputConfiguration() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InkInputConfiguration(value)
    }
}

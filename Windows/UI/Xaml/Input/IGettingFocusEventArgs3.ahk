#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class IGettingFocusEventArgs3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGettingFocusEventArgs3
     * @type {Guid}
     */
    static IID => Guid("{4e024891-db3f-5e78-b75a-62bfc3510735}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CorrelationId"]

    /**
     * @type {Guid} 
     */
    CorrelationId {
        get => this.get_CorrelationId()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_CorrelationId() {
        value := Guid()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\Foundation\RECT.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Hosting
 * @version WindowsRuntime 1.4
 */
class IXamlSourceFocusNavigationRequest extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXamlSourceFocusNavigationRequest
     * @type {Guid}
     */
    static IID => Guid("{fbb93bb5-1496-5a80-ac00-e757359755e6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Reason", "get_HintRect", "get_CorrelationId"]

    /**
     * @type {Integer} 
     */
    Reason {
        get => this.get_Reason()
    }

    /**
     * @type {RECT} 
     */
    HintRect {
        get => this.get_HintRect()
    }

    /**
     * @type {Guid} 
     */
    CorrelationId {
        get => this.get_CorrelationId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Reason() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_HintRect() {
        value := RECT()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_CorrelationId() {
        value := Guid()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

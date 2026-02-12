#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Text\Core\CoreTextRange.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Preview.Text
 * @version WindowsRuntime 1.4
 */
class IReconversionRequestedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IReconversionRequestedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{73852244-d202-55fe-9edf-beb7ec19f937}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Range"]

    /**
     * @type {CoreTextRange} 
     */
    Range {
        get => this.get_Range()
    }

    /**
     * 
     * @returns {CoreTextRange} 
     */
    get_Range() {
        value := CoreTextRange()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

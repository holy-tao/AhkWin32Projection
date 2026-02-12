#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\CoreTextRange.ahk
#Include ..\..\..\Foundation\Deferral.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Text.Core
 * @version WindowsRuntime 1.4
 */
class ICoreTextSelectionRequest extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreTextSelectionRequest
     * @type {Guid}
     */
    static IID => Guid("{f0a70403-208b-4301-883c-74ca7485fd8d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Selection", "put_Selection", "get_IsCanceled", "GetDeferral"]

    /**
     * @type {CoreTextRange} 
     */
    Selection {
        get => this.get_Selection()
        set => this.put_Selection(value)
    }

    /**
     * @type {Boolean} 
     */
    IsCanceled {
        get => this.get_IsCanceled()
    }

    /**
     * 
     * @returns {CoreTextRange} 
     */
    get_Selection() {
        value := CoreTextRange()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {CoreTextRange} value 
     * @returns {HRESULT} 
     */
    put_Selection(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCanceled() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Deferral} 
     */
    GetDeferral() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Deferral(value)
    }
}

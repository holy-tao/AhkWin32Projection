#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.Actions.Hosting
 * @version WindowsRuntime 1.4
 */
class IActionOverload extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActionOverload
     * @type {Guid}
     */
    static IID => Guid("{5d184610-d09d-5375-9849-505c359dca01}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DescriptionTemplate", "GetInputs", "InvokeAsync"]

    /**
     * @type {HSTRING} 
     */
    DescriptionTemplate {
        get => this.get_DescriptionTemplate()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DescriptionTemplate() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} 
     */
    GetInputs(result_) {
        result := ComCall(7, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {ActionInvocationContext} context_ 
     * @returns {IAsyncAction} 
     */
    InvokeAsync(context_) {
        result := ComCall(8, this, "ptr", context_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}

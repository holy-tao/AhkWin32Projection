#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Text
 * @version WindowsRuntime 1.4
 */
class ITextDocument4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextDocument4
     * @type {Guid}
     */
    static IID => Guid("{619c20f2-cb3b-4521-981f-2865b1b93f04}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetMath", "GetMath", "SetMathMode"]

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    SetMath(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<HSTRING>} value 
     * @returns {HRESULT} 
     */
    GetMath(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} mode_ 
     * @returns {HRESULT} 
     */
    SetMathMode(mode_) {
        result := ComCall(8, this, "int", mode_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

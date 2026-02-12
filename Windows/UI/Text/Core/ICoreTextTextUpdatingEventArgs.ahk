#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\CoreTextRange.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Globalization\Language.ahk
#Include ..\..\..\Foundation\Deferral.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Text.Core
 * @version WindowsRuntime 1.4
 */
class ICoreTextTextUpdatingEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreTextTextUpdatingEventArgs
     * @type {Guid}
     */
    static IID => Guid("{eea7918d-cc2b-4f03-8ff6-02fd217db450}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Range", "get_Text", "get_NewSelection", "get_InputLanguage", "get_Result", "put_Result", "get_IsCanceled", "GetDeferral"]

    /**
     * @type {CoreTextRange} 
     */
    Range {
        get => this.get_Range()
    }

    /**
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
    }

    /**
     * @type {CoreTextRange} 
     */
    NewSelection {
        get => this.get_NewSelection()
    }

    /**
     * @type {Language} 
     */
    InputLanguage {
        get => this.get_InputLanguage()
    }

    /**
     * @type {Integer} 
     */
    Result {
        get => this.get_Result()
        set => this.put_Result(value)
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
    get_Range() {
        value := CoreTextRange()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Text() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {CoreTextRange} 
     */
    get_NewSelection() {
        value := CoreTextRange()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Language} 
     */
    get_InputLanguage() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Language(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Result() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Result(value) {
        result := ComCall(11, this, "int", value, "int")
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
        result := ComCall(12, this, "int*", &value := 0, "int")
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
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Deferral(value)
    }
}

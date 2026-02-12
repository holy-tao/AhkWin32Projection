#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\CoreTextRange.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Foundation\Deferral.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Text.Core
 * @version WindowsRuntime 1.4
 */
class ICoreTextFormatUpdatingEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreTextFormatUpdatingEventArgs
     * @type {Guid}
     */
    static IID => Guid("{7310bd33-b4a8-43b1-b37b-0724d4aca7ab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Range", "get_TextColor", "get_BackgroundColor", "get_UnderlineColor", "get_UnderlineType", "get_Reason", "get_Result", "put_Result", "get_IsCanceled", "GetDeferral"]

    /**
     * @type {CoreTextRange} 
     */
    Range {
        get => this.get_Range()
    }

    /**
     * @type {IReference<Integer>} 
     */
    TextColor {
        get => this.get_TextColor()
    }

    /**
     * @type {IReference<Integer>} 
     */
    BackgroundColor {
        get => this.get_BackgroundColor()
    }

    /**
     * @type {IReference<Integer>} 
     */
    UnderlineColor {
        get => this.get_UnderlineColor()
    }

    /**
     * @type {IReference<Integer>} 
     */
    UnderlineType {
        get => this.get_UnderlineType()
    }

    /**
     * @type {Integer} 
     */
    Reason {
        get => this.get_Reason()
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
     * @returns {IReference<Integer>} 
     */
    get_TextColor() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_BackgroundColor() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_UnderlineColor() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_UnderlineType() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Reason() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Result() {
        result := ComCall(12, this, "int*", &value := 0, "int")
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
        result := ComCall(13, this, "int", value, "int")
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
        result := ComCall(14, this, "int*", &value := 0, "int")
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
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Deferral(value)
    }
}

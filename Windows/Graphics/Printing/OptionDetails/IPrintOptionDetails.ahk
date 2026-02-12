#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents the base class for the PrintTaskOptionXxx objects.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.iprintoptiondetails
 * @namespace Windows.Graphics.Printing.OptionDetails
 * @version WindowsRuntime 1.4
 */
class IPrintOptionDetails extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintOptionDetails
     * @type {Guid}
     */
    static IID => Guid("{390686cf-d682-495f-adfe-d7333f5c1808}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OptionId", "get_OptionType", "put_ErrorText", "get_ErrorText", "put_State", "get_State", "get_Value", "TrySetValue"]

    /**
     * Gets the ID for a print task option.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.iprintoptiondetails.optionid
     * @type {HSTRING} 
     */
    OptionId {
        get => this.get_OptionId()
    }

    /**
     * Gets the option type for a print task option.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.iprintoptiondetails.optiontype
     * @type {Integer} 
     */
    OptionType {
        get => this.get_OptionType()
    }

    /**
     * Gets or sets the string for an error condition.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.iprintoptiondetails.errortext
     * @type {HSTRING} 
     */
    ErrorText {
        get => this.get_ErrorText()
        set => this.put_ErrorText(value)
    }

    /**
     * Gets or sets the state of a print task option.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.iprintoptiondetails.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
        set => this.put_State(value)
    }

    /**
     * Gets the enumerated value of a print task option.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.iprintoptiondetails.value
     * @type {IInspectable} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_OptionId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OptionType() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ErrorText(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ErrorText() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
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
    put_State(value) {
        result := ComCall(10, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        result := ComCall(11, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Value() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * Sets the value for the print task option.
     * @param {IInspectable} value Value for the print task option.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.iprintoptiondetails.trysetvalue
     */
    TrySetValue(value) {
        result := ComCall(13, this, "ptr", value, "int*", &succeeded := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return succeeded
    }
}

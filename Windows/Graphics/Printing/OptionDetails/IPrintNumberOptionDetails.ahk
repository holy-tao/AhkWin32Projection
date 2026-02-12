#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents objects that define the enumerated values of the print task options.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.iprintnumberoptiondetails
 * @namespace Windows.Graphics.Printing.OptionDetails
 * @version WindowsRuntime 1.4
 */
class IPrintNumberOptionDetails extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintNumberOptionDetails
     * @type {Guid}
     */
    static IID => Guid("{4d01bbaf-645c-4de9-965f-6fc6bbc47cab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MinValue", "get_MaxValue"]

    /**
     * Gets the minimum enumerated value of the print task option.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.iprintnumberoptiondetails.minvalue
     * @type {Integer} 
     */
    MinValue {
        get => this.get_MinValue()
    }

    /**
     * Gets the maximum enumerated value of the print task option.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.iprintnumberoptiondetails.maxvalue
     * @type {Integer} 
     */
    MaxValue {
        get => this.get_MaxValue()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinValue() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxValue() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

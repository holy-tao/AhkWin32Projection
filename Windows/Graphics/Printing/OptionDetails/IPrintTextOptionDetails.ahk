#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents objects that describe the text of a print task option.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.iprinttextoptiondetails
 * @namespace Windows.Graphics.Printing.OptionDetails
 * @version WindowsRuntime 1.4
 */
class IPrintTextOptionDetails extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintTextOptionDetails
     * @type {Guid}
     */
    static IID => Guid("{ad75e563-5ce4-46bc-9918-ab9fad144c5b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MaxCharacters"]

    /**
     * Gets the maximum allowed number of characters for the text of a print task option.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.optiondetails.iprinttextoptiondetails.maxcharacters
     * @type {Integer} 
     */
    MaxCharacters {
        get => this.get_MaxCharacters()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxCharacters() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

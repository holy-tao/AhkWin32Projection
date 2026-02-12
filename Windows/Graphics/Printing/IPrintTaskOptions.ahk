#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Storage\Streams\IRandomAccessStream.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents the core functionality for a **PrintTaskOptions** object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.iprinttaskoptionscore
 * @namespace Windows.Graphics.Printing
 * @version WindowsRuntime 1.4
 */
class IPrintTaskOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintTaskOptions
     * @type {Guid}
     */
    static IID => Guid("{5a0a66bb-d289-41bb-96dd-57e28338ae3f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_Bordering", "get_Bordering", "GetPagePrintTicket"]

    /**
     * @type {Integer} 
     */
    Bordering {
        get => this.get_Bordering()
        set => this.put_Bordering(value)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Bordering(value) {
        result := ComCall(6, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Bordering() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {PrintPageInfo} printPageInfo_ 
     * @returns {IRandomAccessStream} 
     */
    GetPagePrintTicket(printPageInfo_) {
        result := ComCall(8, this, "ptr", printPageInfo_, "ptr*", &printTicket := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRandomAccessStream(printTicket)
    }
}

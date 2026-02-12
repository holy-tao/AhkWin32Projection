#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Printers
 * @version WindowsRuntime 1.4
 */
class IIppPrintDevice3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIppPrintDevice3
     * @type {Guid}
     */
    static IID => Guid("{b6258f6d-a46d-5e37-80ce-5f69d5544712}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsIppFaxOutPrinter"]

    /**
     * @type {Boolean} 
     */
    IsIppFaxOutPrinter {
        get => this.get_IsIppFaxOutPrinter()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsIppFaxOutPrinter() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

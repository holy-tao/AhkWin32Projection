#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing
 * @version WindowsRuntime 1.4
 */
class IStandardPrintTaskOptionsStatic3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStandardPrintTaskOptionsStatic3
     * @type {Guid}
     */
    static IID => Guid("{bbf68e86-3858-41b3-a799-55dd9888d475}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CustomPageRanges"]

    /**
     * @type {HSTRING} 
     */
    CustomPageRanges {
        get => this.get_CustomPageRanges()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CustomPageRanges() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\PrintPageRangeOptions.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\PrintPageRange.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing
 * @version WindowsRuntime 1.4
 */
class IPrintTaskOptions2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintTaskOptions2
     * @type {Guid}
     */
    static IID => Guid("{eb9b1606-9a36-4b59-8617-b217849262e1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PageRangeOptions", "get_CustomPageRanges"]

    /**
     * @type {PrintPageRangeOptions} 
     */
    PageRangeOptions {
        get => this.get_PageRangeOptions()
    }

    /**
     * @type {IVector<PrintPageRange>} 
     */
    CustomPageRanges {
        get => this.get_CustomPageRanges()
    }

    /**
     * 
     * @returns {PrintPageRangeOptions} 
     */
    get_PageRangeOptions() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintPageRangeOptions(value)
    }

    /**
     * 
     * @returns {IVector<PrintPageRange>} 
     */
    get_CustomPageRanges() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(PrintPageRange, value)
    }
}

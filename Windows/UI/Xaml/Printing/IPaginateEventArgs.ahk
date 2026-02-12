#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Graphics\Printing\PrintTaskOptions.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Printing
 * @version WindowsRuntime 1.4
 */
class IPaginateEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPaginateEventArgs
     * @type {Guid}
     */
    static IID => Guid("{ed945fd6-79ab-42b7-930a-3d6e09011d21}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PrintTaskOptions", "get_CurrentPreviewPageNumber"]

    /**
     * @type {PrintTaskOptions} 
     */
    PrintTaskOptions {
        get => this.get_PrintTaskOptions()
    }

    /**
     * @type {Integer} 
     */
    CurrentPreviewPageNumber {
        get => this.get_CurrentPreviewPageNumber()
    }

    /**
     * 
     * @returns {PrintTaskOptions} 
     */
    get_PrintTaskOptions() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintTaskOptions(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentPreviewPageNumber() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Printing
 * @version WindowsRuntime 1.4
 */
class IGetPreviewPageEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGetPreviewPageEventArgs
     * @type {Guid}
     */
    static IID => Guid("{a43d703d-dea9-4df6-a7ed-35049cd485c7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PageNumber"]

    /**
     * @type {Integer} 
     */
    PageNumber {
        get => this.get_PageNumber()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PageNumber() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Devices\Printers\IppPrintDevice.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing.PrintSupport
 * @version WindowsRuntime 1.4
 */
class IPrintSupportEnterpriseManagementUIEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintSupportEnterpriseManagementUIEventArgs
     * @type {Guid}
     */
    static IID => Guid("{6b1c2850-4bf7-5894-89fa-e89d9ea4eb2e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Printer"]

    /**
     * @type {IppPrintDevice} 
     */
    Printer {
        get => this.get_Printer()
    }

    /**
     * 
     * @returns {IppPrintDevice} 
     */
    get_Printer() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppPrintDevice(value)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\PrintWorkflowVirtualPrinterSession.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class IPrintWorkflowVirtualPrinterTriggerDetails extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintWorkflowVirtualPrinterTriggerDetails
     * @type {Guid}
     */
    static IID => Guid("{ff8f2297-727b-53ec-b9e0-f393f72d4e50}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_VirtualPrinterSession"]

    /**
     * @type {PrintWorkflowVirtualPrinterSession} 
     */
    VirtualPrinterSession {
        get => this.get_VirtualPrinterSession()
    }

    /**
     * 
     * @returns {PrintWorkflowVirtualPrinterSession} 
     */
    get_VirtualPrinterSession() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintWorkflowVirtualPrinterSession(value)
    }
}

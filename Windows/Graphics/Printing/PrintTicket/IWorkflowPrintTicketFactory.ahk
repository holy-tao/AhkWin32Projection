#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\WorkflowPrintTicket.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing.PrintTicket
 * @version WindowsRuntime 1.4
 */
class IWorkflowPrintTicketFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWorkflowPrintTicketFactory
     * @type {Guid}
     */
    static IID => Guid("{966d1166-d9c7-569e-b7d8-f2b341c8f976}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstance"]

    /**
     * The CWbemGlueFactory class is part of the WMI Provider Framework. The Provider Framework implements methods of this interface internally to create new instances of classes for the provider.
     * @remarks
     * The destructor for the class is <b>CWbemGlueFactory::~CWbemGlueFactory.</b>
     * @param {HSTRING} printerName 
     * @param {IInputStream} printTicketStream 
     * @returns {WorkflowPrintTicket} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(printerName, printTicketStream) {
        if(printerName is String) {
            pin := HSTRING.Create(printerName)
            printerName := pin.Value
        }
        printerName := printerName is Win32Handle ? NumGet(printerName, "ptr") : printerName

        result := ComCall(6, this, "ptr", printerName, "ptr", printTicketStream, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WorkflowPrintTicket(value)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISegment.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISegmentListIterator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISegmentListIterator
     * @type {Guid}
     */
    static IID => Guid("{3050f692-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Current", "First", "IsDone", "Advance"]

    /**
     * The CurrentAngle property sets or retrieves the current angle in an angle block.
     * @remarks
     * This property is read/write with no default value.
     * @returns {ISegment} 
     * @see https://learn.microsoft.com/windows/win32/DirectShow/currentangle-property
     */
    Current() {
        result := ComCall(3, this, "ptr*", &ppISegment := 0, "HRESULT")
        return ISegment(ppISegment)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    First() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsDone() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The AdvancedDocumentProperties function displays a printer-configuration dialog box for the specified printer, allowing the user to configure that printer.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * This function can only display the printer-configuration dialog box so a user can configure it. For more control, use [**DocumentProperties**](documentproperties.md). The input parameters for this function are passed directly to **DocumentProperties** and the *fMode* value is set to DM\_IN\_BUFFER \| DM\_IN\_PROMPT \| DM\_OUT\_BUFFER. Unlike **DocumentProperties**, this function only returns 1 or 0. Thus, you cannot determine the required size of [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) by setting *pDevMode* to zero.
     * 
     * An application can obtain the name pointed to by the *pDeviceName* parameter by calling the [**GetPrinter**](getprinter.md) function and then examining the **pPrinterName** member of the [**PRINTER\_INFO\_2**](printer-info-2.md) structure.
     * @returns {HRESULT} If the [**DocumentProperties**](documentproperties.md) function with these parameters is successful, the return value of **AdvancedDocumentProperties** is 1. Otherwise, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/advanceddocumentproperties
     */
    Advance() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}

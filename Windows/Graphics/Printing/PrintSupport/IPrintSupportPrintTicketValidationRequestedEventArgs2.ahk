#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing.PrintSupport
 * @version WindowsRuntime 1.4
 */
class IPrintSupportPrintTicketValidationRequestedEventArgs2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintSupportPrintTicketValidationRequestedEventArgs2
     * @type {Guid}
     */
    static IID => Guid("{39749075-d02d-5fd1-9c4b-46bb8db7316b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetPrintJobShowsUI"]

    /**
     * 
     * @param {Boolean} showsUI 
     * @returns {HRESULT} 
     */
    SetPrintJobShowsUI(showsUI) {
        result := ComCall(6, this, "int", showsUI, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

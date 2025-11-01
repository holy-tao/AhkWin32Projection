#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IPrintWorkflowXpsReceiver.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Printing
 * @version v4.0.30319
 */
class IPrintWorkflowXpsReceiver2 extends IPrintWorkflowXpsReceiver{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintWorkflowXpsReceiver2
     * @type {Guid}
     */
    static IID => Guid("{023bcc0c-dfab-4a61-b074-490c6995580d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Failed"]

    /**
     * 
     * @param {HRESULT} XpsError 
     * @returns {HRESULT} 
     */
    Failed(XpsError) {
        result := ComCall(8, this, "int", XpsError, "HRESULT")
        return result
    }
}

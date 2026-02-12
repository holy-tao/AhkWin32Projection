#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class IPrintWorkflowConfiguration2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintWorkflowConfiguration2
     * @type {Guid}
     */
    static IID => Guid("{de350a50-a6d4-5be2-8b9a-09d3d39ea780}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AbortPrintFlow"]

    /**
     * 
     * @param {Integer} reason 
     * @returns {HRESULT} 
     */
    AbortPrintFlow(reason) {
        result := ComCall(6, this, "int", reason, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

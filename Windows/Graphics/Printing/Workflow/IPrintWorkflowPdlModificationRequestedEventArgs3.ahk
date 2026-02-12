#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing.Workflow
 * @version WindowsRuntime 1.4
 */
class IPrintWorkflowPdlModificationRequestedEventArgs3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintWorkflowPdlModificationRequestedEventArgs3
     * @type {Guid}
     */
    static IID => Guid("{1f50a7d4-db49-5d3e-ba27-b366cb25cd7e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DisableIppCompressionForJob"]

    /**
     * 
     * @returns {HRESULT} 
     */
    DisableIppCompressionForJob() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

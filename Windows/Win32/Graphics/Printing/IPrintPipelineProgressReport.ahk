#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintPipelineProgressReport extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintPipelineProgressReport
     * @type {Guid}
     */
    static IID => Guid("{edc12c7c-ed40-4ea5-96a6-5e4397497a61}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReportProgress"]

    /**
     * 
     * @param {Integer} update 
     * @returns {HRESULT} 
     */
    ReportProgress(update) {
        result := ComCall(3, this, "int", update, "HRESULT")
        return result
    }
}

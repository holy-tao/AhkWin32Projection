#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintPipelineFilter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintPipelineFilter
     * @type {Guid}
     */
    static IID => Guid("{cdb62fc0-8bed-434e-86fb-a2cae55f19ea}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeFilter", "ShutdownOperation", "StartOperation"]

    /**
     * 
     * @param {IInterFilterCommunicator} pINegotiation 
     * @param {IPrintPipelinePropertyBag} pIPropertyBag 
     * @param {IPrintPipelineManagerControl} pIPipelineControl 
     * @returns {HRESULT} 
     */
    InitializeFilter(pINegotiation, pIPropertyBag, pIPipelineControl) {
        result := ComCall(3, this, "ptr", pINegotiation, "ptr", pIPropertyBag, "ptr", pIPipelineControl, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ShutdownOperation() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StartOperation() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}

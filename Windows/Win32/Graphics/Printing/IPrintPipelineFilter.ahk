#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintPipelineFilter extends IUnknown{
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
     * 
     * @param {Pointer<IInterFilterCommunicator>} pINegotiation 
     * @param {Pointer<IPrintPipelinePropertyBag>} pIPropertyBag 
     * @param {Pointer<IPrintPipelineManagerControl>} pIPipelineControl 
     * @returns {HRESULT} 
     */
    InitializeFilter(pINegotiation, pIPropertyBag, pIPipelineControl) {
        result := ComCall(3, this, "ptr", pINegotiation, "ptr", pIPropertyBag, "ptr", pIPipelineControl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ShutdownOperation() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StartOperation() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

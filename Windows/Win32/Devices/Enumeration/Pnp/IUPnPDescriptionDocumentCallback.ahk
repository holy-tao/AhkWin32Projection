#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IUPnPDescriptionDocumentCallback interface allows the UPnP framework to communicate the results of an asynchronous load operation to an application.
 * @see https://docs.microsoft.com/windows/win32/api//upnp/nn-upnp-iupnpdescriptiondocumentcallback
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 * @version v4.0.30319
 */
class IUPnPDescriptionDocumentCallback extends IUnknown{
    /**
     * The interface identifier for IUPnPDescriptionDocumentCallback
     * @type {Guid}
     */
    static IID => Guid("{77394c69-5486-40d6-9bc3-4991983e02da}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {HRESULT} hrLoadResult 
     * @returns {HRESULT} 
     */
    LoadComplete(hrLoadResult) {
        result := ComCall(3, this, "int", hrLoadResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

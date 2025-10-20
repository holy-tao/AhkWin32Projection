#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IUPnPAsyncResult interface is used to notify the UPnP control point of a completed asynchronous I/O operation.
 * @see https://docs.microsoft.com/windows/win32/api//upnp/nn-upnp-iupnpasyncresult
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 * @version v4.0.30319
 */
class IUPnPAsyncResult extends IUnknown{
    /**
     * The interface identifier for IUPnPAsyncResult
     * @type {Guid}
     */
    static IID => Guid("{4d65fd08-d13e-4274-9c8b-dd8d028c8644}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} ullRequestID 
     * @returns {HRESULT} 
     */
    AsyncOperationComplete(ullRequestID) {
        result := ComCall(3, this, "uint", ullRequestID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

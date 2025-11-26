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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AsyncOperationComplete"]

    /**
     * AsyncOperationComplete callback method provides notification of the completion of an asynchronous I/O operation.
     * @param {Integer} ullRequestID The handle identifier corresponding to the completed asynchronous I/O operation.
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, the method returns one of the COM error codes defined in WinError.h
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpasyncresult-asyncoperationcomplete
     */
    AsyncOperationComplete(ullRequestID) {
        result := ComCall(3, this, "uint", ullRequestID, "HRESULT")
        return result
    }
}

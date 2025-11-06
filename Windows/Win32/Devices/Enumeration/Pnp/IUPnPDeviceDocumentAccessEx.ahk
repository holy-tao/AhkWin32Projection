#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides a method to obtain the entire XML device description document for a specific device.
 * @remarks
 * 
  * This interface is obtained by calling QueryInterface on the same object that provides an implementation of <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nn-upnp-iupnpdevice">IUPnPDevice</a>, after which <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nf-upnp-iupnpdevicedocumentaccessex-getdocument">GetDocument</a> can be called on it.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//upnp/nn-upnp-iupnpdevicedocumentaccessex
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 * @version v4.0.30319
 */
class IUPnPDeviceDocumentAccessEx extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUPnPDeviceDocumentAccessEx
     * @type {Guid}
     */
    static IID => Guid("{c4bc4050-6178-4bd1-a4b8-6398321f3247}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDocument"]

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevicedocumentaccessex-getdocument
     */
    GetDocument() {
        pbstrDocument := BSTR()
        result := ComCall(3, this, "ptr", pbstrDocument, "HRESULT")
        return pbstrDocument
    }
}

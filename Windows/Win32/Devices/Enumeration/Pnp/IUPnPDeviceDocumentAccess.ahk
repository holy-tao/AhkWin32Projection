#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IUPnPDeviceDocumentAccess interface enables an application to obtain the URL of the device description document.
 * @see https://docs.microsoft.com/windows/win32/api//upnp/nn-upnp-iupnpdevicedocumentaccess
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 * @version v4.0.30319
 */
class IUPnPDeviceDocumentAccess extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUPnPDeviceDocumentAccess
     * @type {Guid}
     */
    static IID => Guid("{e7772804-3287-418e-9072-cf2b47238981}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDocumentURL"]

    /**
     * The GetDocumentURL method returns the URL from which the device description document can be loaded.
     * @returns {BSTR} Receives the URL from which the device description document can be downloaded.
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpdevicedocumentaccess-getdocumenturl
     */
    GetDocumentURL() {
        pbstrDocument := BSTR()
        result := ComCall(3, this, "ptr", pbstrDocument, "HRESULT")
        return pbstrDocument
    }
}

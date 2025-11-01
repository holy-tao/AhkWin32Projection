#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxInboundRouting interface defines a configuration object used by a fax client application to access the inbound routing extensions registered with the fax service, represented by FaxInboundRoutingExtensions objects, and the routing methods the extensions expose, represented by FaxInboundRoutingMethods objects.
 * @remarks
 * 
  * A default implementation of <b>IFaxInboundRouting</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxinboundrouting">FaxInboundRouting</a> object.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxinboundrouting
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxInboundRouting extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxInboundRouting
     * @type {Guid}
     */
    static IID => Guid("{8148c20f-9d52-45b1-bf96-38fc12713527}")

    /**
     * The class identifier for FaxInboundRouting
     * @type {Guid}
     */
    static CLSID => Guid("{e80248ed-ad65-4218-8108-991924d4e7ed}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetExtensions", "GetMethods"]

    /**
     * 
     * @param {Pointer<IFaxInboundRoutingExtensions>} pFaxInboundRoutingExtensions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundrouting-getextensions
     */
    GetExtensions(pFaxInboundRoutingExtensions) {
        result := ComCall(7, this, "ptr*", pFaxInboundRoutingExtensions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IFaxInboundRoutingMethods>} pFaxInboundRoutingMethods 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundrouting-getmethods
     */
    GetMethods(pFaxInboundRoutingMethods) {
        result := ComCall(8, this, "ptr*", pFaxInboundRoutingMethods, "HRESULT")
        return result
    }
}

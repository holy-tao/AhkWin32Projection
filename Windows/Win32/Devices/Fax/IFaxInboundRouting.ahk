#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFaxInboundRoutingExtensions.ahk
#Include .\IFaxInboundRoutingMethods.ahk
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
     * The GetExtensions method retrieves the collection of inbound routing extensions registered with the fax service.
     * @returns {IFaxInboundRoutingExtensions} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxinboundroutingextensions">IFaxInboundRoutingExtensions</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxinboundroutingextensions">IFaxInboundRoutingExtensions</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxinboundrouting-getextensions
     */
    GetExtensions() {
        result := ComCall(7, this, "ptr*", &pFaxInboundRoutingExtensions := 0, "HRESULT")
        return IFaxInboundRoutingExtensions(pFaxInboundRoutingExtensions)
    }

    /**
     * The IFaxInboundRouting::GetMethods method retrieves the ordered collection of all the inbound routing methods exposed by all the inbound routing extensions currently registered with the fax service.
     * @returns {IFaxInboundRoutingMethods} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxinboundroutingmethods">IFaxInboundRoutingMethods</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxinboundroutingmethods">IFaxInboundRoutingMethods</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxinboundrouting-getmethods
     */
    GetMethods() {
        result := ComCall(8, this, "ptr*", &pFaxInboundRoutingMethods := 0, "HRESULT")
        return IFaxInboundRoutingMethods(pFaxInboundRoutingMethods)
    }
}

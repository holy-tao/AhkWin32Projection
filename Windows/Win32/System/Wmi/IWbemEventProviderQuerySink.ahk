#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IWbemEventProviderQuerySink interface is optionally implemented by event providers who want to know what kinds of event query filters are currently active to optimize performance.
 * @remarks
 * 
 * Although WMI calls the methods of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wbemprov/nn-wbemprov-iwbemeventprovider">IWbemEventProvider</a> only one time after an event provider becomes active, WMI calls the methods of 
 * <b>IWbemEventProviderQuerySink</b> continuously, as appropriate. The provider can ignore all calls to 
 * <b>IWbemEventProviderQuerySink</b> methods as needed. This point is very important; supporting 
 * <b>IWbemEventProviderQuerySink</b> indicates that a provider will supply at least the events requested by queries.
 * 
 * A provider can also generate more events than requested, which WMI filters as appropriate. This functionality means you can implement 
 * <b>IWbemEventProviderQuerySink</b> and optimize processing without addressing all parts of the WMI Query Language (WQL). For instance, if a provider does not specifically handle a particular query, the provider can generate all possible events for the query.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wbemprov/nn-wbemprov-iwbemeventproviderquerysink
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemEventProviderQuerySink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWbemEventProviderQuerySink
     * @type {Guid}
     */
    static IID => Guid("{580acaf8-fa1c-11d0-ad72-00c04fd8fdff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["NewQuery", "CancelQuery"]

    /**
     * Call the IWbemEventProviderQuerySink::NewQuery method when a logical event consumer registers a relevant event query filter with Windows Management.
     * @param {Integer} dwId Windows Management-generated identifier for the query. The provider can track this so that during a later call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemprov/nf-wbemprov-iwbemeventproviderquerysink-cancelquery">CancelQuery</a> so that the provider will know which query was canceled.
     * @param {Pointer<Integer>} wszQueryLanguage Language of the following query filter. For this version of WMI, it will always be "WQL".
     * @param {Pointer<Integer>} wszQuery Text of the event query filter, which was registered by a logical consumer. The event provider can examine the text of the query filter through the <i>wszQuery</i> parameter and the language of the query filter in the <i>wszQueryLanguage</i> parameter to discover which event notifications the consumer is requesting.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists return codes returned by 
     * <b>NewQuery</b>. Additionally, a third-party event provider could return any valid WMI or COM return code which could be passed through 
     * <b>NewQuery</b> as a return value.
     * @see https://docs.microsoft.com/windows/win32/api//wbemprov/nf-wbemprov-iwbemeventproviderquerysink-newquery
     */
    NewQuery(dwId, wszQueryLanguage, wszQuery) {
        wszQueryLanguageMarshal := wszQueryLanguage is VarRef ? "ushort*" : "ptr"
        wszQueryMarshal := wszQuery is VarRef ? "ushort*" : "ptr"

        result := ComCall(3, this, "uint", dwId, wszQueryLanguageMarshal, wszQueryLanguage, wszQueryMarshal, wszQuery, "HRESULT")
        return result
    }

    /**
     * Call the IWbemEventProviderQuerySink::CancelQuery method whenever a logical event consumer cancels a relevant event query filter with Windows Management.
     * @param {Integer} dwId Identifier of the query which was canceled. This identifier was originally delivered to the provider by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemprov/nf-wbemprov-iwbemeventproviderquerysink-newquery">NewQuery</a> method of this interface.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained withinan <b>HRESULT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wbemprov/nf-wbemprov-iwbemeventproviderquerysink-cancelquery
     */
    CancelQuery(dwId) {
        result := ComCall(4, this, "uint", dwId, "HRESULT")
        return result
    }
}

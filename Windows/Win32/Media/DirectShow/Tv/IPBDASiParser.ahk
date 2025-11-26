#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IPBDA_EIT.ahk
#Include .\IPBDA_Services.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that retrieve program and system information protocol (PSIP) and service information (SI) tables from a Protected Broadcast Driver Architecture (PBDA) transport stream.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-ipbdasiparser
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IPBDASiParser extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPBDASiParser
     * @type {Guid}
     */
    static IID => Guid("{9de49a74-aba2-4a18-93e1-21f17f95c3c3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetEIT", "GetServices"]

    /**
     * Initializes a program and system information protocol (PSIP) parser for a Protected Broadcast Driver Architecture (PBDA) transport stream.
     * @param {IUnknown} punk Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface for the new object.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-ipbdasiparser-initialize
     */
    Initialize(punk) {
        result := ComCall(3, this, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * Gets the event information table (EIT) from the program and system information protocol (PSIP) tables in a Protected Broadcast Device Architecture (PBDA) transport stream.
     * @param {Integer} dwSize Reserved. Set to zero.
     * @param {Pointer<Integer>} pBuffer Reserved. Set to <b>NULL</b>.
     * @returns {IPBDA_EIT} Receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nn-dvbsiparser-ipbda_eit">IPBDA_EIT</a> interface.  The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-ipbdasiparser-geteit
     */
    GetEIT(dwSize, pBuffer) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "uint", dwSize, pBufferMarshal, pBuffer, "ptr*", &ppEIT := 0, "HRESULT")
        return IPBDA_EIT(ppEIT)
    }

    /**
     * Retrieves a list of services from the program and system information protocol (PSIP) tables in a Protected Broadcast Device Architecture (PBDA) transport stream.
     * @param {Integer} dwSize Size of the buffer that receives the service list, in bytes.
     * @param {Pointer<Integer>} pBuffer Receives the buffer for services.
     * @returns {IPBDA_Services} Receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nn-dvbsiparser-ipbda_services">IPBDA_Services</a> interface pointer.  The caller must release this interface.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-ipbdasiparser-getservices
     */
    GetServices(dwSize, pBuffer) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, "uint", dwSize, pBufferMarshal, pBuffer, "ptr*", &ppServices := 0, "HRESULT")
        return IPBDA_Services(ppServices)
    }
}

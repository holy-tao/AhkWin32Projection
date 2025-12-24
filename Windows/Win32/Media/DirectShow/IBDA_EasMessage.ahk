#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IBDA_EasMessage interface represents an ATSC emergency alert system (EAS) message table.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_EasMessage)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nn-bdaiface-ibda_easmessage
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBDA_EasMessage extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBDA_EasMessage
     * @type {Guid}
     */
    static IID => Guid("{d806973d-3ebe-46de-8fbb-6358fe784208}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EasMessage"]

    /**
     * The get_EasMessage method retrieves an EAS message.
     * @param {Integer} ulEventID Specifies the event ID of the EAS message.
     * @param {Pointer<IUnknown>} ppEASObject Pointer to a pointer variable that receives a pointer to the <b>IUnknown</b> interface of the EAS object. The caller can query this object for its <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nn-atscpsipparser-iscte_eas">ISCTE_EAS</a> interface.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_easmessage-get_easmessage
     */
    get_EasMessage(ulEventID, ppEASObject) {
        result := ComCall(3, this, "uint", ulEventID, "ptr*", ppEASObject, "HRESULT")
        return result
    }
}

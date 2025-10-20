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
     * 
     * @param {Integer} ulEventID 
     * @param {Pointer<IUnknown>} ppEASObject 
     * @returns {HRESULT} 
     */
    get_EasMessage(ulEventID, ppEASObject) {
        result := ComCall(3, this, "uint", ulEventID, "ptr", ppEASObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

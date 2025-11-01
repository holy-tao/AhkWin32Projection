#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implements a generic event interface that can deliver and encapsulate events that are raised by devices that work with the Protected Broadcast Driver Interface (PBDA).
 * @remarks
 * 
  * 
  * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IESEvent)</c>.
  * 
  * 
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-iesevent
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IESEvent extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IESEvent
     * @type {Guid}
     */
    static IID => Guid("{1f0e5357-af43-44e6-8547-654c645145d2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetEventId", "GetEventType", "SetCompletionStatus", "GetData", "GetStringData"]

    /**
     * 
     * @param {Pointer<Integer>} pdwEventId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesevent-geteventid
     */
    GetEventId(pdwEventId) {
        result := ComCall(3, this, "uint*", pdwEventId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidEventType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesevent-geteventtype
     */
    GetEventType(pguidEventType) {
        result := ComCall(4, this, "ptr", pguidEventType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesevent-setcompletionstatus
     */
    SetCompletionStatus(dwResult) {
        result := ComCall(5, this, "uint", dwResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} pbData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesevent-getdata
     */
    GetData(pbData) {
        result := ComCall(6, this, "ptr*", pbData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesevent-getstringdata
     */
    GetStringData(pbstrData) {
        result := ComCall(7, this, "ptr", pbstrData, "HRESULT")
        return result
    }
}

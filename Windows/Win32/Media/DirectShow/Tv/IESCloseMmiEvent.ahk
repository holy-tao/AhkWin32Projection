#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IESEvent.ahk

/**
 * Receives CloseMMI events from a Media Sink Device (MSD) device under the Protected Broadcast Driver Architecture (PBDA).
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IESCloseMmiEvent)</c>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-iesclosemmievent
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IESCloseMmiEvent extends IESEvent{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IESCloseMmiEvent
     * @type {Guid}
     */
    static IID => Guid("{6b80e96f-55e2-45aa-b754-0c23c8e7d5c1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDialogNumber"]

    /**
     * 
     * @param {Pointer<Integer>} pDialogNumber 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesclosemmievent-getdialognumber
     */
    GetDialogNumber(pDialogNumber) {
        pDialogNumberMarshal := pDialogNumber is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pDialogNumberMarshal, pDialogNumber, "HRESULT")
        return result
    }
}

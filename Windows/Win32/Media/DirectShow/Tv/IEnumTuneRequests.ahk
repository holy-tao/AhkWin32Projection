#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IEnumTuneRequests interface provides access to a collection of tune requests returned from a call to IGuideData::GetServices. This collection of tune requests represents all the services available in the tuning space.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IEnumTuneRequests)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//bdatif/nn-bdatif-ienumtunerequests
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IEnumTuneRequests extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumTuneRequests
     * @type {Guid}
     */
    static IID => Guid("{1993299c-ced6-4788-87a3-420067dce0c7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone"]

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<ITuneRequest>} ppprop 
     * @param {Pointer<Integer>} pcelt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-ienumtunerequests-next
     */
    Next(celt, ppprop, pcelt) {
        result := ComCall(3, this, "uint", celt, "ptr*", ppprop, "uint*", pcelt, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-ienumtunerequests-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-ienumtunerequests-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumTuneRequests>} ppenum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-ienumtunerequests-clone
     */
    Clone(ppenum) {
        result := ComCall(6, this, "ptr*", ppenum, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IEnumTuningSpaces.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IEnumTuningSpaces interface is implemented on a standard COM collection of tuning space objects and is obtained through various ITuningSpaceContainer.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IEnumTuningSpaces)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-ienumtuningspaces
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IEnumTuningSpaces extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumTuningSpaces
     * @type {Guid}
     */
    static IID => Guid("{8b8eb248-fc2b-11d2-9d8c-00c04f72d980}")

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
     * The Next method retrieves the next n elements in the collection.
     * @param {Integer} celt The number of elements to retrieve.
     * @param {Pointer<ITuningSpace>} rgelt Address of an array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ituningspace">ITuningSpace</a> interface pointers that will receive the retrieved Tuning Space objects.
     * @param {Pointer<Integer>} pceltFetched Receives the number of elements actually retrieved.
     * @returns {HRESULT} Returns S_OK if successful. This method will succeed even if <i>celt</i> is zero. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ienumtuningspaces-next
     */
    Next(celt, rgelt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr*", rgelt, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * The Skip method skips the specified element in the collection.
     * @param {Integer} celt The index of the element to skip.
     * @returns {HRESULT} Returns S_OK if successful. This method will succeed even if <i>celt</i> is zero. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ienumtuningspaces-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * The Reset method moves the iterator to the beginning of the collection.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ienumtuningspaces-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The Clone method creates a new copy of the collection and all its sub-objects.
     * @returns {IEnumTuningSpaces} Address of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ienumtuningspaces">IEnumTuningSpaces</a> interface pointer that will receive the returned interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ienumtuningspaces-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTuningSpaces(ppEnum)
    }
}

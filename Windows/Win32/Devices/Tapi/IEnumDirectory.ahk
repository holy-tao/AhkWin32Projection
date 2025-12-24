#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITDirectory.ahk
#Include .\IEnumDirectory.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IEnumDirectory interface provides COM-standard enumeration methods for the ITDirectory interface. The ITRendezvous::EnumerateDefaultDirectories method returns a pointer to IEnumDirectory.
 * @see https://docs.microsoft.com/windows/win32/api//rend/nn-rend-ienumdirectory
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class IEnumDirectory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumDirectory
     * @type {Guid}
     */
    static IID => Guid("{34621d6d-6cff-11d1-aff7-00c04fc31fee}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Reset", "Skip", "Clone"]

    /**
     * The Next method gets the next specified number of elements in the enumeration sequence.
     * @param {Integer} celt Number of elements requested.
     * @param {Pointer<Integer>} pcFetched Pointer to the number of elements actually supplied. May be <b>NULL</b> if <i>celt</i> is one.
     * @returns {ITDirectory} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/nn-rend-itdirectory">ITDirectory</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//rend/nf-rend-ienumdirectory-next
     */
    Next(celt, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr*", &ppElements := 0, pcFetchedMarshal, pcFetched, "HRESULT")
        return ITDirectory(ppElements)
    }

    /**
     * The Reset method resets to the beginning of the enumeration sequence.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rend/nf-rend-ienumdirectory-reset
     */
    Reset() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * The Skip method skips over the next specified number of elements in the enumeration sequence.
     * @param {Integer} celt Number of elements to skip.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Number of elements skipped was <i>celt</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Number of elements skipped was not <i>celt</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rend/nf-rend-ienumdirectory-skip
     */
    Skip(celt) {
        result := ComCall(5, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * The Clone method creates another enumerator that contains the same enumeration state as the current one.
     * @returns {IEnumDirectory} Pointer to the new 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/nn-rend-ienumdirectory">IEnumDirectory</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//rend/nf-rend-ienumdirectory-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumDirectory(ppEnum)
    }
}

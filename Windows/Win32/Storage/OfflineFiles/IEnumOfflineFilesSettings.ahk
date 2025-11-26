#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumOfflineFilesSettings.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enumerates setting objects associated with the Offline Files service.
 * @see https://docs.microsoft.com/windows/win32/api//cscobj/nn-cscobj-ienumofflinefilessettings
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class IEnumOfflineFilesSettings extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumOfflineFilesSettings
     * @type {Guid}
     */
    static IID => Guid("{729680c4-1a38-47bc-9e5c-02c51562ac30}")

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
     * Retrieves the next item in the enumeration and advances the enumerator.
     * @param {Integer} celt Number of elements requested.
     * @param {Pointer<IOfflineFilesSetting>} rgelt Array of elements returned.
     * @param {Pointer<Integer>} pceltFetched Number of elements returned.
     * @returns {HRESULT} Returns <b>S_OK</b> if the number of elements returned is <i>celt</i>; S_FALSE if a number less than <i>celt</i> is returned; or an error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-ienumofflinefilessettings-next
     */
    Next(celt, rgelt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr*", rgelt, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * Skips over the next specified number of elements in the enumeration.
     * @param {Integer} celt Number of elements to be skipped.
     * @returns {HRESULT} Returns <b>S_OK</b> if the number of elements skipped is <i>celt</i>; S_FALSE if a number less than <i>celt</i> is skipped; or an error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-ienumofflinefilessettings-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * Resets the enumeration to the beginning.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-ienumofflinefilessettings-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Creates a new instance of the enumerator with the same enumeration state as the current one.
     * @returns {IEnumOfflineFilesSettings} Address of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nn-cscobj-ienumofflinefilessettings">IEnumOfflineFilesSettings</a> pointer variable that receives the interface pointer of the new enumeration object.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-ienumofflinefilessettings-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumOfflineFilesSettings(ppenum)
    }
}

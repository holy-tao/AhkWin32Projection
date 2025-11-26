#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumObjects.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods to enumerate unknown objects.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ienumobjects
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IEnumObjects extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumObjects
     * @type {Guid}
     */
    static IID => Guid("{2c1c7e2e-2d0e-4059-831e-1e6f82335c2e}")

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
     * Gets the next specified number and type of objects.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * The number of objects to retrieve.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Reference to the desired interface ID.
     * @param {Pointer<Pointer<Void>>} rgelt Type: <b>void**</b>
     * 
     * When this method returns, contains the interface pointer requested in <i>riid</i>.
     * @param {Pointer<Integer>} pceltFetched Type: <b>ULONG*</b>
     * 
     * Pointer to a <b>ULONG</b> value that, when this method returns, states the actual number of objects retrieved. This value can be <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if the method successfully retrieved the requested objects. This method only returns S_OK if the full count of requested items are successfully retrieved.
     *                     
     *                     
     * 
     * S_FALSE indicates that more items were requested than remained in the enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ienumobjects-next
     */
    Next(celt, riid, rgelt, pceltFetched) {
        rgeltMarshal := rgelt is VarRef ? "ptr*" : "ptr"
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr", riid, rgeltMarshal, rgelt, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * Skips a specified number of objects.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * The number of objects to skip.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ienumobjects-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * Resets the enumeration index to 0.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ienumobjects-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Not implemented.Not implemented.
     * @returns {IEnumObjects} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ienumobjects">IEnumObjects</a>**</b>
     * 
     * Not used.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ienumobjects-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumObjects(ppenum)
    }
}

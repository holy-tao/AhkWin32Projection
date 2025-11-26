#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ICoreFragment.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enumerates the ICoreFragment objects that are contained in a knowledge object.
 * @remarks
 * 
 * An <b>ICoreFragmentInspector</b> object can be obtained by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-isyncknowledge2-getinspector">ISyncKnowledge2::GetInspector</a> on a knowledge object.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-icorefragmentinspector
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ICoreFragmentInspector extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreFragmentInspector
     * @type {Guid}
     */
    static IID => Guid("{f7fcc5fd-ae26-4679-ba16-96aac583c134}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["NextCoreFragments", "Reset"]

    /**
     * Returns the next ICoreFragment objects in the knowledge, if they are available.
     * @param {Integer} requestedCount The number of <b>ICoreFragment</b> objects to retrieve.
     * @param {Pointer<Integer>} pFetchedCount Receives the number of <b>ICoreFragment</b> objects that were retrieved in the <i>ppiCoreFragments</i> parameter. This value can be <b>NULL</b> only if <i> requestedCount</i> is 1.
     * @returns {ICoreFragment} Receives a pointer to the next <i>pFetchedCount</i> <b>ICoreFragment</b> objects. The size of the array is the value specified in the <i>requestedCount</i> parameter. The length is <c>*(pFetchedCount)</c>. The caller must release the interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-icorefragmentinspector-nextcorefragments
     */
    NextCoreFragments(requestedCount, pFetchedCount) {
        pFetchedCountMarshal := pFetchedCount is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", requestedCount, "ptr*", &ppiCoreFragments := 0, pFetchedCountMarshal, pFetchedCount, "HRESULT")
        return ICoreFragment(ppiCoreFragments)
    }

    /**
     * Resets the enumerator to the beginning of the knowledge.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SYNC_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The knowledge object that is associated with this object has changed since this object was created.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-icorefragmentinspector-reset
     */
    Reset() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}

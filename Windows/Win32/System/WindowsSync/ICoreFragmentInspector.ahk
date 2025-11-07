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
     * 
     * @param {Integer} requestedCount 
     * @param {Pointer<Integer>} pFetchedCount 
     * @returns {ICoreFragment} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-icorefragmentinspector-nextcorefragments
     */
    NextCoreFragments(requestedCount, pFetchedCount) {
        pFetchedCountMarshal := pFetchedCount is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", requestedCount, "ptr*", &ppiCoreFragments := 0, pFetchedCountMarshal, pFetchedCount, "HRESULT")
        return ICoreFragment(ppiCoreFragments)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-icorefragmentinspector-reset
     */
    Reset() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}

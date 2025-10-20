#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Integer} requestedCount 
     * @param {Pointer<ICoreFragment>} ppiCoreFragments 
     * @param {Pointer<UInt32>} pFetchedCount 
     * @returns {HRESULT} 
     */
    NextCoreFragments(requestedCount, ppiCoreFragments, pFetchedCount) {
        result := ComCall(3, this, "uint", requestedCount, "ptr", ppiCoreFragments, "uint*", pFetchedCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

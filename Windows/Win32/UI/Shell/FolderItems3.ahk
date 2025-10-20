#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\FolderItems2.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class FolderItems3 extends FolderItems2{
    /**
     * The interface identifier for FolderItems3
     * @type {Guid}
     */
    static IID => Guid("{eaa7c309-bbec-49d5-821d-64d966cb667f}")

    /**
     * The class identifier for FolderItems3
     * @type {Guid}
     */
    static CLSID => Guid("{eaa7c309-bbec-49d5-821d-64d966cb667f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * 
     * @param {Integer} grfFlags 
     * @param {BSTR} bstrFileSpec 
     * @returns {HRESULT} 
     */
    Filter(grfFlags, bstrFileSpec) {
        bstrFileSpec := bstrFileSpec is String ? BSTR.Alloc(bstrFileSpec).Value : bstrFileSpec

        result := ComCall(13, this, "int", grfFlags, "ptr", bstrFileSpec, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<FolderItemVerbs>} ppfic 
     * @returns {HRESULT} 
     */
    get_Verbs(ppfic) {
        result := ComCall(14, this, "ptr", ppfic, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

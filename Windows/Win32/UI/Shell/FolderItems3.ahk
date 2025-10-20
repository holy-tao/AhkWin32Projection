#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\FolderItems2.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/shell/folderitems3-object
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class FolderItems3 extends FolderItems2{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Filter", "get_Verbs"]

    /**
     * 
     * @param {Integer} grfFlags 
     * @param {BSTR} bstrFileSpec 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/folderitems3-filter
     */
    Filter(grfFlags, bstrFileSpec) {
        bstrFileSpec := bstrFileSpec is String ? BSTR.Alloc(bstrFileSpec).Value : bstrFileSpec

        result := ComCall(13, this, "int", grfFlags, "ptr", bstrFileSpec, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<FolderItemVerbs>} ppfic 
     * @returns {HRESULT} 
     */
    get_Verbs(ppfic) {
        result := ComCall(14, this, "ptr*", ppfic, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\FolderItemVerbs.ahk
#Include .\FolderItems2.ahk

/**
 * Extends the FolderItems2 object. This object supports an additional method and property.
 * @see https://learn.microsoft.com/windows/win32/ktop-src/shell/folderitems3-object
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
     * @type {FolderItemVerbs} 
     */
    Verbs {
        get => this.get_Verbs()
    }

    /**
     * Sets a wildcard filter to apply to the items returned.
     * @param {Integer} grfFlags Type: **Integer**
     * 
     * This parameter can be one of the flags listed in [**SHCONTF**](/windows/win32/api/shobjidl_core/ne-shobjidl_core-_shcontf).
     * @param {BSTR} bstrFileSpec 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/shell/folderitems3-filter
     */
    Filter(grfFlags, bstrFileSpec) {
        if(bstrFileSpec is String) {
            pin := BSTR.Alloc(bstrFileSpec)
            bstrFileSpec := pin.Value
        }

        result := ComCall(13, this, "int", grfFlags, "ptr", bstrFileSpec, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {FolderItemVerbs} 
     */
    get_Verbs() {
        result := ComCall(14, this, "ptr*", &ppfic := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FolderItemVerbs(ppfic)
    }
}

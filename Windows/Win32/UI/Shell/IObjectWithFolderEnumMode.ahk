#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that get and set enumeration modes of a parsed item.
 * @remarks
 * 
  * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
  * This interface is implemented as part of a Shell namespace extension, specifically the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> interface.
  * 
  * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
  * This interface is used by the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-parsedisplayname">IShellFolder::ParseDisplayName</a> method to retrieve the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-folder_enum_mode">FOLDER_ENUM_MODE</a> value which controls the enumeration mode of the parsed item.
  * 
  * Items with different enumeration modes compare canonically different (SHCIDS_CANONICALONLY) because they enumerate different sets of items.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iobjectwithfolderenummode
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IObjectWithFolderEnumMode extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IObjectWithFolderEnumMode
     * @type {Guid}
     */
    static IID => Guid("{6a9d9026-0e6e-464c-b000-42ecc07de673}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetMode", "GetMode"]

    /**
     * 
     * @param {Integer} feMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iobjectwithfolderenummode-setmode
     */
    SetMode(feMode) {
        result := ComCall(3, this, "int", feMode, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iobjectwithfolderenummode-getmode
     */
    GetMode() {
        result := ComCall(4, this, "int*", &pfeMode := 0, "HRESULT")
        return pfeMode
    }
}

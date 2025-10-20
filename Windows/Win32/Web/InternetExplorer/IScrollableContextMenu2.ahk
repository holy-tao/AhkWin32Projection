#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IScrollableContextMenu.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IScrollableContextMenu2 extends IScrollableContextMenu{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IScrollableContextMenu2
     * @type {Guid}
     */
    static IID => Guid("{f77e9056-8674-4936-924c-0e4a06fa634a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddSeparator", "SetPlacement"]

    /**
     * 
     * @returns {HRESULT} 
     */
    AddSeparator() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} scmp 
     * @returns {HRESULT} 
     */
    SetPlacement(scmp) {
        result := ComCall(6, this, "int", scmp, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLSelectElementEx extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLSelectElementEx
     * @type {Guid}
     */
    static IID => Guid("{3050f2d1-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ShowDropdown", "SetSelectExFlags", "GetSelectExFlags", "GetDropdownOpen"]

    /**
     * 
     * @param {BOOL} fShow 
     * @returns {HRESULT} 
     */
    ShowDropdown(fShow) {
        result := ComCall(3, this, "int", fShow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @returns {HRESULT} 
     */
    SetSelectExFlags(lFlags) {
        result := ComCall(4, this, "uint", lFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     */
    GetSelectExFlags(pFlags) {
        pFlagsMarshal := pFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pFlagsMarshal, pFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfOpen 
     * @returns {HRESULT} 
     */
    GetDropdownOpen(pfOpen) {
        result := ComCall(6, this, "ptr", pfOpen, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLSelectElementEx extends IUnknown{
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
     * 
     * @param {BOOL} fShow 
     * @returns {HRESULT} 
     */
    ShowDropdown(fShow) {
        result := ComCall(3, this, "int", fShow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @returns {HRESULT} 
     */
    SetSelectExFlags(lFlags) {
        result := ComCall(4, this, "uint", lFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pFlags 
     * @returns {HRESULT} 
     */
    GetSelectExFlags(pFlags) {
        result := ComCall(5, this, "uint*", pFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfOpen 
     * @returns {HRESULT} 
     */
    GetDropdownOpen(pfOpen) {
        result := ComCall(6, this, "ptr", pfOpen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IConnectionPoint.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class CIE4ConnectionPoint extends IConnectionPoint{

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * 
     * @param {Pointer<BOOL>} pf 
     * @param {Pointer<Void>} ppv 
     * @param {Integer} dispid 
     * @param {Pointer<DISPPARAMS>} pdispparams 
     * @returns {HRESULT} 
     */
    DoInvokeIE4(pf, ppv, dispid, pdispparams) {
        result := ComCall(8, this, "ptr", pf, "ptr", ppv, "int", dispid, "ptr", pdispparams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dispid 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @param {BOOL} fCanCancel 
     * @returns {HRESULT} 
     */
    DoInvokePIDLIE4(dispid, pidl, fCanCancel) {
        result := ComCall(9, this, "int", dispid, "ptr", pidl, "int", fCanCancel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

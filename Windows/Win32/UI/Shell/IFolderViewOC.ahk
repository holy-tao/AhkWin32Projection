#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IFolderViewOC extends IDispatch{
    /**
     * The interface identifier for IFolderViewOC
     * @type {Guid}
     */
    static IID => Guid("{9ba05970-f6a8-11cf-a442-00a0c90a8f39}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IDispatch>} pdisp 
     * @returns {HRESULT} 
     */
    SetFolderView(pdisp) {
        result := ComCall(7, this, "ptr", pdisp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The base class for all FSRM action interfaces.
 * @remarks
 * 
  * The FSRM server starts the action in response to quota or file screen event (for example, a directory size 
  *     exceeds a directory quota threshold or detection of a restricted file).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//fsrm/nn-fsrm-ifsrmaction
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmAction extends IDispatch{
    /**
     * The interface identifier for IFsrmAction
     * @type {Guid}
     */
    static IID => Guid("{6cd6408a-ae60-463b-9ef1-e117534d69dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Guid>} id 
     * @returns {HRESULT} 
     */
    get_Id(id) {
        result := ComCall(7, this, "ptr", id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} actionType 
     * @returns {HRESULT} 
     */
    get_ActionType(actionType) {
        result := ComCall(8, this, "int*", actionType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} minutes 
     * @returns {HRESULT} 
     */
    get_RunLimitInterval(minutes) {
        result := ComCall(9, this, "int*", minutes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} minutes 
     * @returns {HRESULT} 
     */
    put_RunLimitInterval(minutes) {
        result := ComCall(10, this, "int", minutes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Delete() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

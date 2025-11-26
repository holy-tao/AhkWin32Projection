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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "get_ActionType", "get_RunLimitInterval", "put_RunLimitInterval", "Delete"]

    /**
     * @type {Guid} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {Integer} 
     */
    ActionType {
        get => this.get_ActionType()
    }

    /**
     * @type {Integer} 
     */
    RunLimitInterval {
        get => this.get_RunLimitInterval()
        set => this.put_RunLimitInterval(value)
    }

    /**
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmaction-get_id
     */
    get_Id() {
        id := Guid()
        result := ComCall(7, this, "ptr", id, "HRESULT")
        return id
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmaction-get_actiontype
     */
    get_ActionType() {
        result := ComCall(8, this, "int*", &actionType := 0, "HRESULT")
        return actionType
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmaction-get_runlimitinterval
     */
    get_RunLimitInterval() {
        result := ComCall(9, this, "int*", &minutes := 0, "HRESULT")
        return minutes
    }

    /**
     * 
     * @param {Integer} minutes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmaction-put_runlimitinterval
     */
    put_RunLimitInterval(minutes) {
        result := ComCall(10, this, "int", minutes, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmaction-delete
     */
    Delete() {
        result := ComCall(11, this, "HRESULT")
        return result
    }
}

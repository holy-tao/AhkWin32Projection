#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMAPIProp.ahk

/**
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class IMAPIStatus extends IMAPIProp{

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * 
     * @param {Pointer} ulUIParam 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     */
    ValidateState(ulUIParam, ulFlags) {
        result := ComCall(14, this, "ptr", ulUIParam, "uint", ulFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} ulUIParam 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     */
    SettingsDialog(ulUIParam, ulFlags) {
        result := ComCall(15, this, "ptr", ulUIParam, "uint", ulFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SByte>} lpOldPass 
     * @param {Pointer<SByte>} lpNewPass 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     */
    ChangePassword(lpOldPass, lpNewPass, ulFlags) {
        result := ComCall(16, this, "char*", lpOldPass, "char*", lpNewPass, "uint", ulFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} ulUIParam 
     * @param {Integer} cbTargetTransport 
     * @param {Pointer<ENTRYID>} lpTargetTransport 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     */
    FlushQueues(ulUIParam, cbTargetTransport, lpTargetTransport, ulFlags) {
        result := ComCall(17, this, "ptr", ulUIParam, "uint", cbTargetTransport, "ptr", lpTargetTransport, "uint", ulFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

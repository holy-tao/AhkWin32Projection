#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IWinInetFileStream extends IUnknown{
    /**
     * The interface identifier for IWinInetFileStream
     * @type {Guid}
     */
    static IID => Guid("{f134c4b7-b1f8-4e75-b886-74b90943becb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer} hWinInetLockHandle 
     * @param {Pointer} dwReserved 
     * @returns {HRESULT} 
     */
    SetHandleForUnlock(hWinInetLockHandle, dwReserved) {
        result := ComCall(3, this, "ptr", hWinInetLockHandle, "ptr", dwReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} dwReserved 
     * @returns {HRESULT} 
     */
    SetDeleteFile(dwReserved) {
        result := ComCall(4, this, "ptr", dwReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

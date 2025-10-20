#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class IActiveIMMRegistrar extends IUnknown{
    /**
     * The interface identifier for IActiveIMMRegistrar
     * @type {Guid}
     */
    static IID => Guid("{b3458082-bd00-11d1-939b-0060b067b86e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Integer} lgid 
     * @param {PWSTR} pszIconFile 
     * @param {PWSTR} pszDesc 
     * @returns {HRESULT} 
     */
    RegisterIME(rclsid, lgid, pszIconFile, pszDesc) {
        pszIconFile := pszIconFile is String ? StrPtr(pszIconFile) : pszIconFile
        pszDesc := pszDesc is String ? StrPtr(pszDesc) : pszDesc

        result := ComCall(3, this, "ptr", rclsid, "ushort", lgid, "ptr", pszIconFile, "ptr", pszDesc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @returns {HRESULT} 
     */
    UnregisterIME(rclsid) {
        result := ComCall(4, this, "ptr", rclsid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

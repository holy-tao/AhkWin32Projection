#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class ISAXErrorHandler extends IUnknown{
    /**
     * The interface identifier for ISAXErrorHandler
     * @type {Guid}
     */
    static IID => Guid("{a60511c4-ccf5-479e-98a3-dc8dc545b7d0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ISAXLocator>} pLocator 
     * @param {PWSTR} pwchErrorMessage 
     * @param {HRESULT} hrErrorCode 
     * @returns {HRESULT} 
     */
    error(pLocator, pwchErrorMessage, hrErrorCode) {
        pwchErrorMessage := pwchErrorMessage is String ? StrPtr(pwchErrorMessage) : pwchErrorMessage

        result := ComCall(3, this, "ptr", pLocator, "ptr", pwchErrorMessage, "int", hrErrorCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISAXLocator>} pLocator 
     * @param {PWSTR} pwchErrorMessage 
     * @param {HRESULT} hrErrorCode 
     * @returns {HRESULT} 
     */
    fatalError(pLocator, pwchErrorMessage, hrErrorCode) {
        pwchErrorMessage := pwchErrorMessage is String ? StrPtr(pwchErrorMessage) : pwchErrorMessage

        result := ComCall(4, this, "ptr", pLocator, "ptr", pwchErrorMessage, "int", hrErrorCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISAXLocator>} pLocator 
     * @param {PWSTR} pwchErrorMessage 
     * @param {HRESULT} hrErrorCode 
     * @returns {HRESULT} 
     */
    ignorableWarning(pLocator, pwchErrorMessage, hrErrorCode) {
        pwchErrorMessage := pwchErrorMessage is String ? StrPtr(pwchErrorMessage) : pwchErrorMessage

        result := ComCall(5, this, "ptr", pLocator, "ptr", pwchErrorMessage, "int", hrErrorCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

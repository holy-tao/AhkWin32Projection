#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Returns error information.
 * @see https://docs.microsoft.com/windows/win32/api//oaidl/nn-oaidl-icreateerrorinfo
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class ICreateErrorInfo extends IUnknown{
    /**
     * The interface identifier for ICreateErrorInfo
     * @type {Guid}
     */
    static IID => Guid("{22f03340-547d-101b-8e65-08002b2bd119}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} rguid 
     * @returns {HRESULT} 
     */
    SetGUID(rguid) {
        result := ComCall(3, this, "ptr", rguid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} szSource 
     * @returns {HRESULT} 
     */
    SetSource(szSource) {
        szSource := szSource is String ? StrPtr(szSource) : szSource

        result := ComCall(4, this, "ptr", szSource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} szDescription 
     * @returns {HRESULT} 
     */
    SetDescription(szDescription) {
        szDescription := szDescription is String ? StrPtr(szDescription) : szDescription

        result := ComCall(5, this, "ptr", szDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} szHelpFile 
     * @returns {HRESULT} 
     */
    SetHelpFile(szHelpFile) {
        szHelpFile := szHelpFile is String ? StrPtr(szHelpFile) : szHelpFile

        result := ComCall(6, this, "ptr", szHelpFile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwHelpContext 
     * @returns {HRESULT} 
     */
    SetHelpContext(dwHelpContext) {
        result := ComCall(7, this, "uint", dwHelpContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

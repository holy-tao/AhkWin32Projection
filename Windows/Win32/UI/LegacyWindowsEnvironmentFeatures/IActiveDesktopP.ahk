#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that manage the Windows Desktop.
 * @see https://docs.microsoft.com/windows/win32/api//shlobj/nn-shlobj-iactivedesktopp
 * @namespace Windows.Win32.UI.LegacyWindowsEnvironmentFeatures
 * @version v4.0.30319
 */
class IActiveDesktopP extends IUnknown{
    /**
     * The interface identifier for IActiveDesktopP
     * @type {Guid}
     */
    static IID => Guid("{52502ee0-ec80-11d0-89ab-00c04fc2972d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SetSafeMode(dwFlags) {
        result := ComCall(3, this, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EnsureUpdateHTML() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszSchemeName 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SetScheme(pwszSchemeName, dwFlags) {
        pwszSchemeName := pwszSchemeName is String ? StrPtr(pwszSchemeName) : pwszSchemeName

        result := ComCall(5, this, "ptr", pwszSchemeName, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszSchemeName 
     * @param {Pointer<UInt32>} pdwcchBuffer 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    GetScheme(pwszSchemeName, pdwcchBuffer, dwFlags) {
        pwszSchemeName := pwszSchemeName is String ? StrPtr(pwszSchemeName) : pwszSchemeName

        result := ComCall(6, this, "ptr", pwszSchemeName, "uint*", pdwcchBuffer, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

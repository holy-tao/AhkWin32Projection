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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetSafeMode", "EnsureUpdateHTML", "SetScheme", "GetScheme"]

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-iactivedesktopp-setsafemode
     */
    SetSafeMode(dwFlags) {
        result := ComCall(3, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EnsureUpdateHTML() {
        result := ComCall(4, this, "HRESULT")
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

        result := ComCall(5, this, "ptr", pwszSchemeName, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszSchemeName 
     * @param {Pointer<Integer>} pdwcchBuffer 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    GetScheme(pwszSchemeName, pdwcchBuffer, dwFlags) {
        pwszSchemeName := pwszSchemeName is String ? StrPtr(pwszSchemeName) : pwszSchemeName

        pdwcchBufferMarshal := pdwcchBuffer is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", pwszSchemeName, pdwcchBufferMarshal, pdwcchBuffer, "uint", dwFlags, "HRESULT")
        return result
    }
}

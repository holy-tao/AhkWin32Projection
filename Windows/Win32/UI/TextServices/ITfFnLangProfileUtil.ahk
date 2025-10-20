#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfFunction.ahk

/**
 * The ITfFnLangProfileUtil interface is implemented by the speech text service and used to provide utility methods for the speech text service.
 * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nn-ctffunc-itffnlangprofileutil
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfFnLangProfileUtil extends ITfFunction{
    /**
     * The interface identifier for ITfFnLangProfileUtil
     * @type {Guid}
     */
    static IID => Guid("{a87a8574-a6c1-4e15-99f0-3d3965f548eb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * 
     * @returns {HRESULT} 
     */
    RegisterActiveProfiles() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} langid 
     * @param {Pointer<BOOL>} pfAvailable 
     * @returns {HRESULT} 
     */
    IsProfileAvailableForLang(langid, pfAvailable) {
        result := ComCall(5, this, "ushort", langid, "ptr", pfAvailable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

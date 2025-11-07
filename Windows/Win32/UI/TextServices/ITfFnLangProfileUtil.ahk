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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterActiveProfiles", "IsProfileAvailableForLang"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itffnlangprofileutil-registeractiveprofiles
     */
    RegisterActiveProfiles() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} langid 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itffnlangprofileutil-isprofileavailableforlang
     */
    IsProfileAvailableForLang(langid) {
        result := ComCall(5, this, "ushort", langid, "int*", &pfAvailable := 0, "HRESULT")
        return pfAvailable
    }
}

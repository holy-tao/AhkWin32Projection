#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Specifies the security settings for a wireless ad hoc network.
 * @see https://docs.microsoft.com/windows/win32/api//adhoc/nn-adhoc-idot11adhocsecuritysettings
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class IDot11AdHocSecuritySettings extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDot11AdHocSecuritySettings
     * @type {Guid}
     */
    static IID => Guid("{8f10cc2e-cf0d-42a0-acbe-e2de7007384d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDot11AuthAlgorithm", "GetDot11CipherAlgorithm"]

    /**
     * 
     * @param {Pointer<Integer>} pAuth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-idot11adhocsecuritysettings-getdot11authalgorithm
     */
    GetDot11AuthAlgorithm(pAuth) {
        result := ComCall(3, this, "int*", pAuth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCipher 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-idot11adhocsecuritysettings-getdot11cipheralgorithm
     */
    GetDot11CipherAlgorithm(pCipher) {
        result := ComCall(4, this, "int*", pCipher, "HRESULT")
        return result
    }
}

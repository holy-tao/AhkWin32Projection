#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWSManEx2.ahk

/**
 * Extends the methods and properties of the IWSManEx interface to include a method that returns a session flag value related to authentication using the Credential Security Support Provider (CredSSP).
 * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nn-wsmandisp-iwsmanex3
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class IWSManEx3 extends IWSManEx2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSManEx3
     * @type {Guid}
     */
    static IID => Guid("{6400e966-011d-4eac-8474-049e0848afad}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 32

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SessionFlagUTF16", "SessionFlagUseCredSsp", "EnumerationFlagAssociationInstance", "EnumerationFlagAssociatedInstance", "SessionFlagSkipRevocationCheck", "SessionFlagAllowNegotiateImplicitCredentials", "SessionFlagUseSsl"]

    /**
     * 
     * @returns {Integer} 
     */
    SessionFlagUTF16() {
        result := ComCall(32, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanex3-sessionflagusecredssp
     */
    SessionFlagUseCredSsp() {
        result := ComCall(33, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * 
     * @returns {Integer} 
     */
    EnumerationFlagAssociationInstance() {
        result := ComCall(34, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * 
     * @returns {Integer} 
     */
    EnumerationFlagAssociatedInstance() {
        result := ComCall(35, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * 
     * @returns {Integer} 
     */
    SessionFlagSkipRevocationCheck() {
        result := ComCall(36, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * 
     * @returns {Integer} 
     */
    SessionFlagAllowNegotiateImplicitCredentials() {
        result := ComCall(37, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * 
     * @returns {Integer} 
     */
    SessionFlagUseSsl() {
        result := ComCall(38, this, "int*", &flags := 0, "HRESULT")
        return flags
    }
}

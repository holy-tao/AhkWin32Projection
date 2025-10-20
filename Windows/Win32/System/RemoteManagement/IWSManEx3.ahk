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
     * 
     * @param {Pointer<Int32>} flags 
     * @returns {HRESULT} 
     */
    SessionFlagUTF16(flags) {
        result := ComCall(32, this, "int*", flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} flags 
     * @returns {HRESULT} 
     */
    SessionFlagUseCredSsp(flags) {
        result := ComCall(33, this, "int*", flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} flags 
     * @returns {HRESULT} 
     */
    EnumerationFlagAssociationInstance(flags) {
        result := ComCall(34, this, "int*", flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} flags 
     * @returns {HRESULT} 
     */
    EnumerationFlagAssociatedInstance(flags) {
        result := ComCall(35, this, "int*", flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} flags 
     * @returns {HRESULT} 
     */
    SessionFlagSkipRevocationCheck(flags) {
        result := ComCall(36, this, "int*", flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} flags 
     * @returns {HRESULT} 
     */
    SessionFlagAllowNegotiateImplicitCredentials(flags) {
        result := ComCall(37, this, "int*", flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} flags 
     * @returns {HRESULT} 
     */
    SessionFlagUseSsl(flags) {
        result := ComCall(38, this, "int*", flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWSMan.ahk

/**
 * Extends the methods and properties of the IWSMan interface to include creating IWSManResourceLocator objects, methods that return enumeration and session flag values, and a method to get extended error information.
 * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nn-wsmandisp-iwsmanex
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class IWSManEx extends IWSMan{
    /**
     * The interface identifier for IWSManEx
     * @type {Guid}
     */
    static IID => Guid("{2d53bdaa-798e-49e6-a1aa-74d01256f411}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * 
     * @param {BSTR} strResourceLocator 
     * @param {Pointer<IDispatch>} newResourceLocator 
     * @returns {HRESULT} 
     */
    CreateResourceLocator(strResourceLocator, newResourceLocator) {
        strResourceLocator := strResourceLocator is String ? BSTR.Alloc(strResourceLocator).Value : strResourceLocator

        result := ComCall(11, this, "ptr", strResourceLocator, "ptr", newResourceLocator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} flags 
     * @returns {HRESULT} 
     */
    SessionFlagUTF8(flags) {
        result := ComCall(12, this, "int*", flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} flags 
     * @returns {HRESULT} 
     */
    SessionFlagCredUsernamePassword(flags) {
        result := ComCall(13, this, "int*", flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} flags 
     * @returns {HRESULT} 
     */
    SessionFlagSkipCACheck(flags) {
        result := ComCall(14, this, "int*", flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} flags 
     * @returns {HRESULT} 
     */
    SessionFlagSkipCNCheck(flags) {
        result := ComCall(15, this, "int*", flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} flags 
     * @returns {HRESULT} 
     */
    SessionFlagUseDigest(flags) {
        result := ComCall(16, this, "int*", flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} flags 
     * @returns {HRESULT} 
     */
    SessionFlagUseNegotiate(flags) {
        result := ComCall(17, this, "int*", flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} flags 
     * @returns {HRESULT} 
     */
    SessionFlagUseBasic(flags) {
        result := ComCall(18, this, "int*", flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} flags 
     * @returns {HRESULT} 
     */
    SessionFlagUseKerberos(flags) {
        result := ComCall(19, this, "int*", flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} flags 
     * @returns {HRESULT} 
     */
    SessionFlagNoEncryption(flags) {
        result := ComCall(20, this, "int*", flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} flags 
     * @returns {HRESULT} 
     */
    SessionFlagEnableSPNServerPort(flags) {
        result := ComCall(21, this, "int*", flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} flags 
     * @returns {HRESULT} 
     */
    SessionFlagUseNoAuthentication(flags) {
        result := ComCall(22, this, "int*", flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} flags 
     * @returns {HRESULT} 
     */
    EnumerationFlagNonXmlText(flags) {
        result := ComCall(23, this, "int*", flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} flags 
     * @returns {HRESULT} 
     */
    EnumerationFlagReturnEPR(flags) {
        result := ComCall(24, this, "int*", flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} flags 
     * @returns {HRESULT} 
     */
    EnumerationFlagReturnObjectAndEPR(flags) {
        result := ComCall(25, this, "int*", flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} errorNumber 
     * @param {Pointer<BSTR>} errorMessage 
     * @returns {HRESULT} 
     */
    GetErrorMessage(errorNumber, errorMessage) {
        result := ComCall(26, this, "uint", errorNumber, "ptr", errorMessage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} flags 
     * @returns {HRESULT} 
     */
    EnumerationFlagHierarchyDeep(flags) {
        result := ComCall(27, this, "int*", flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} flags 
     * @returns {HRESULT} 
     */
    EnumerationFlagHierarchyShallow(flags) {
        result := ComCall(28, this, "int*", flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} flags 
     * @returns {HRESULT} 
     */
    EnumerationFlagHierarchyDeepBasePropsOnly(flags) {
        result := ComCall(29, this, "int*", flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} flags 
     * @returns {HRESULT} 
     */
    EnumerationFlagReturnObject(flags) {
        result := ComCall(30, this, "int*", flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

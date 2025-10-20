#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemClientConnectionTransport extends IUnknown{
    /**
     * The interface identifier for IWbemClientConnectionTransport
     * @type {Guid}
     */
    static IID => Guid("{a889c72a-fcc1-4a9e-af61-ed071333fb5b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {BSTR} strAddressType 
     * @param {Integer} dwBinaryAddressLength 
     * @param {Pointer<Byte>} abBinaryAddress 
     * @param {BSTR} strObject 
     * @param {BSTR} strUser 
     * @param {BSTR} strPassword 
     * @param {BSTR} strLocale 
     * @param {Integer} lFlags 
     * @param {Pointer<IWbemContext>} pCtx 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} pInterface 
     * @param {Pointer<IWbemCallResult>} pCallRes 
     * @returns {HRESULT} 
     */
    Open(strAddressType, dwBinaryAddressLength, abBinaryAddress, strObject, strUser, strPassword, strLocale, lFlags, pCtx, riid, pInterface, pCallRes) {
        strAddressType := strAddressType is String ? BSTR.Alloc(strAddressType).Value : strAddressType
        strObject := strObject is String ? BSTR.Alloc(strObject).Value : strObject
        strUser := strUser is String ? BSTR.Alloc(strUser).Value : strUser
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword
        strLocale := strLocale is String ? BSTR.Alloc(strLocale).Value : strLocale

        result := ComCall(3, this, "ptr", strAddressType, "uint", dwBinaryAddressLength, "char*", abBinaryAddress, "ptr", strObject, "ptr", strUser, "ptr", strPassword, "ptr", strLocale, "int", lFlags, "ptr", pCtx, "ptr", riid, "ptr", pInterface, "ptr", pCallRes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strAddressType 
     * @param {Integer} dwBinaryAddressLength 
     * @param {Pointer<Byte>} abBinaryAddress 
     * @param {BSTR} strObject 
     * @param {BSTR} strUser 
     * @param {BSTR} strPassword 
     * @param {BSTR} strLocale 
     * @param {Integer} lFlags 
     * @param {Pointer<IWbemContext>} pCtx 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IWbemObjectSink>} pResponseHandler 
     * @returns {HRESULT} 
     */
    OpenAsync(strAddressType, dwBinaryAddressLength, abBinaryAddress, strObject, strUser, strPassword, strLocale, lFlags, pCtx, riid, pResponseHandler) {
        strAddressType := strAddressType is String ? BSTR.Alloc(strAddressType).Value : strAddressType
        strObject := strObject is String ? BSTR.Alloc(strObject).Value : strObject
        strUser := strUser is String ? BSTR.Alloc(strUser).Value : strUser
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword
        strLocale := strLocale is String ? BSTR.Alloc(strLocale).Value : strLocale

        result := ComCall(4, this, "ptr", strAddressType, "uint", dwBinaryAddressLength, "char*", abBinaryAddress, "ptr", strObject, "ptr", strUser, "ptr", strPassword, "ptr", strLocale, "int", lFlags, "ptr", pCtx, "ptr", riid, "ptr", pResponseHandler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<IWbemObjectSink>} pHandler 
     * @returns {HRESULT} 
     */
    Cancel(lFlags, pHandler) {
        result := ComCall(5, this, "int", lFlags, "ptr", pHandler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

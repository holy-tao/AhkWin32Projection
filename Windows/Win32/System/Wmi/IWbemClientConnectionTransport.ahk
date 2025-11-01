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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Open", "OpenAsync", "Cancel"]

    /**
     * 
     * @param {BSTR} strAddressType 
     * @param {Integer} dwBinaryAddressLength 
     * @param {Pointer<Integer>} abBinaryAddress 
     * @param {BSTR} strObject 
     * @param {BSTR} strUser 
     * @param {BSTR} strPassword 
     * @param {BSTR} strLocale 
     * @param {Integer} lFlags 
     * @param {IWbemContext} pCtx 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} pInterface 
     * @param {Pointer<IWbemCallResult>} pCallRes 
     * @returns {HRESULT} 
     */
    Open(strAddressType, dwBinaryAddressLength, abBinaryAddress, strObject, strUser, strPassword, strLocale, lFlags, pCtx, riid, pInterface, pCallRes) {
        strAddressType := strAddressType is String ? BSTR.Alloc(strAddressType).Value : strAddressType
        strObject := strObject is String ? BSTR.Alloc(strObject).Value : strObject
        strUser := strUser is String ? BSTR.Alloc(strUser).Value : strUser
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword
        strLocale := strLocale is String ? BSTR.Alloc(strLocale).Value : strLocale

        result := ComCall(3, this, "ptr", strAddressType, "uint", dwBinaryAddressLength, "char*", abBinaryAddress, "ptr", strObject, "ptr", strUser, "ptr", strPassword, "ptr", strLocale, "int", lFlags, "ptr", pCtx, "ptr", riid, "ptr*", pInterface, "ptr*", pCallRes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strAddressType 
     * @param {Integer} dwBinaryAddressLength 
     * @param {Pointer<Integer>} abBinaryAddress 
     * @param {BSTR} strObject 
     * @param {BSTR} strUser 
     * @param {BSTR} strPassword 
     * @param {BSTR} strLocale 
     * @param {Integer} lFlags 
     * @param {IWbemContext} pCtx 
     * @param {Pointer<Guid>} riid 
     * @param {IWbemObjectSink} pResponseHandler 
     * @returns {HRESULT} 
     */
    OpenAsync(strAddressType, dwBinaryAddressLength, abBinaryAddress, strObject, strUser, strPassword, strLocale, lFlags, pCtx, riid, pResponseHandler) {
        strAddressType := strAddressType is String ? BSTR.Alloc(strAddressType).Value : strAddressType
        strObject := strObject is String ? BSTR.Alloc(strObject).Value : strObject
        strUser := strUser is String ? BSTR.Alloc(strUser).Value : strUser
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword
        strLocale := strLocale is String ? BSTR.Alloc(strLocale).Value : strLocale

        result := ComCall(4, this, "ptr", strAddressType, "uint", dwBinaryAddressLength, "char*", abBinaryAddress, "ptr", strObject, "ptr", strUser, "ptr", strPassword, "ptr", strLocale, "int", lFlags, "ptr", pCtx, "ptr", riid, "ptr", pResponseHandler, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {IWbemObjectSink} pHandler 
     * @returns {HRESULT} 
     */
    Cancel(lFlags, pHandler) {
        result := ComCall(5, this, "int", lFlags, "ptr", pHandler, "HRESULT")
        return result
    }
}

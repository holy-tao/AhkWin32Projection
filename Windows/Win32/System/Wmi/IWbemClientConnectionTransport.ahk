#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IWbemCallResult.ahk" { IWbemCallResult }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWbemContext.ahk" { IWbemContext }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IWbemObjectSink.ahk" { IWbemObjectSink }

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct IWbemClientConnectionTransport extends IUnknown {
    /**
     * The interface identifier for IWbemClientConnectionTransport
     * @type {Guid}
     */
    static IID := Guid("{a889c72a-fcc1-4a9e-af61-ed071333fb5b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWbemClientConnectionTransport interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Open      : IntPtr
        OpenAsync : IntPtr
        Cancel    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWbemClientConnectionTransport.Vtbl()
        }
        super.__New(implObj, flags)
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

        abBinaryAddressMarshal := abBinaryAddress is VarRef ? "char*" : "ptr"
        pInterfaceMarshal := pInterface is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, BSTR, strAddressType, "uint", dwBinaryAddressLength, abBinaryAddressMarshal, abBinaryAddress, BSTR, strObject, BSTR, strUser, BSTR, strPassword, BSTR, strLocale, "int", lFlags, "ptr", pCtx, Guid.Ptr, riid, pInterfaceMarshal, pInterface, IWbemCallResult.Ptr, pCallRes, "HRESULT")
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

        abBinaryAddressMarshal := abBinaryAddress is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, BSTR, strAddressType, "uint", dwBinaryAddressLength, abBinaryAddressMarshal, abBinaryAddress, BSTR, strObject, BSTR, strUser, BSTR, strPassword, BSTR, strLocale, "int", lFlags, "ptr", pCtx, Guid.Ptr, riid, "ptr", pResponseHandler, "HRESULT")
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

    Query(iid) {
        if (IWbemClientConnectionTransport.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Open := CallbackCreate(GetMethod(implObj, "Open"), flags, 13)
        this.vtbl.OpenAsync := CallbackCreate(GetMethod(implObj, "OpenAsync"), flags, 12)
        this.vtbl.Cancel := CallbackCreate(GetMethod(implObj, "Cancel"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Open)
        CallbackFree(this.vtbl.OpenAsync)
        CallbackFree(this.vtbl.Cancel)
    }
}

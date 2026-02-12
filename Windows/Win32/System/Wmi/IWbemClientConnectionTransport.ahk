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
     * Open Method (ADO MD)
     * @remarks
     * The **Open** method generates an error if either of its parameters is omitted and its corresponding property value has not been set prior to attempting to open the **Cellset**.
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
     * @param {Pointer<Pointer<Pointer<Void>>>} pInterface 
     * @param {Pointer<IWbemCallResult>} pCallRes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-md-api/open-method-ado-md
     */
    Open(strAddressType, dwBinaryAddressLength, abBinaryAddress, strObject, strUser, strPassword, strLocale, lFlags, pCtx, riid, pInterface, pCallRes) {
        if(strAddressType is String) {
            pin := BSTR.Alloc(strAddressType)
            strAddressType := pin.Value
        }
        if(strObject is String) {
            pin := BSTR.Alloc(strObject)
            strObject := pin.Value
        }
        if(strUser is String) {
            pin := BSTR.Alloc(strUser)
            strUser := pin.Value
        }
        if(strPassword is String) {
            pin := BSTR.Alloc(strPassword)
            strPassword := pin.Value
        }
        if(strLocale is String) {
            pin := BSTR.Alloc(strLocale)
            strLocale := pin.Value
        }

        abBinaryAddressMarshal := abBinaryAddress is VarRef ? "char*" : "ptr"
        pInterfaceMarshal := pInterface is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", strAddressType, "uint", dwBinaryAddressLength, abBinaryAddressMarshal, abBinaryAddress, "ptr", strObject, "ptr", strUser, "ptr", strPassword, "ptr", strLocale, "int", lFlags, "ptr", pCtx, "ptr", riid, pInterfaceMarshal, pInterface, "ptr*", pCallRes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(strAddressType is String) {
            pin := BSTR.Alloc(strAddressType)
            strAddressType := pin.Value
        }
        if(strObject is String) {
            pin := BSTR.Alloc(strObject)
            strObject := pin.Value
        }
        if(strUser is String) {
            pin := BSTR.Alloc(strUser)
            strUser := pin.Value
        }
        if(strPassword is String) {
            pin := BSTR.Alloc(strPassword)
            strPassword := pin.Value
        }
        if(strLocale is String) {
            pin := BSTR.Alloc(strLocale)
            strLocale := pin.Value
        }

        abBinaryAddressMarshal := abBinaryAddress is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "ptr", strAddressType, "uint", dwBinaryAddressLength, abBinaryAddressMarshal, abBinaryAddress, "ptr", strObject, "ptr", strUser, "ptr", strPassword, "ptr", strLocale, "int", lFlags, "ptr", pCtx, "ptr", riid, "ptr", pResponseHandler, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Cancel Method (RDS)
     * @remarks
     * When you call **Cancel**, [ReadyState](./readystate-property-rds.md) is automatically set to **adcReadyStateLoaded**, and the [Recordset](../ado-api/recordset-object-ado.md) will be empty.
     * @param {Integer} lFlags 
     * @param {IWbemObjectSink} pHandler 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/rds-api/cancel-method-rds
     */
    Cancel(lFlags, pHandler) {
        result := ComCall(5, this, "int", lFlags, "ptr", pHandler, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

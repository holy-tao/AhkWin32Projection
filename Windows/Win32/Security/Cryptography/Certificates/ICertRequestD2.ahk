#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICertRequestD.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertRequestD2 extends ICertRequestD{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertRequestD2
     * @type {Guid}
     */
    static IID => Guid("{5422fd3a-d4b8-4cef-a12e-e87d4ca22e90}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Request2", "GetCAProperty", "GetCAPropertyInfo", "Ping2"]

    /**
     * 
     * @param {PWSTR} pwszAuthority 
     * @param {Integer} dwFlags 
     * @param {PWSTR} pwszSerialNumber 
     * @param {Pointer<Integer>} pdwRequestId 
     * @param {Pointer<Integer>} pdwDisposition 
     * @param {PWSTR} pwszAttributes 
     * @param {Pointer<CERTTRANSBLOB>} pctbRequest 
     * @param {Pointer<CERTTRANSBLOB>} pctbFullResponse 
     * @param {Pointer<CERTTRANSBLOB>} pctbEncodedCert 
     * @param {Pointer<CERTTRANSBLOB>} pctbDispositionMessage 
     * @returns {HRESULT} 
     */
    Request2(pwszAuthority, dwFlags, pwszSerialNumber, pdwRequestId, pdwDisposition, pwszAttributes, pctbRequest, pctbFullResponse, pctbEncodedCert, pctbDispositionMessage) {
        pwszAuthority := pwszAuthority is String ? StrPtr(pwszAuthority) : pwszAuthority
        pwszSerialNumber := pwszSerialNumber is String ? StrPtr(pwszSerialNumber) : pwszSerialNumber
        pwszAttributes := pwszAttributes is String ? StrPtr(pwszAttributes) : pwszAttributes

        result := ComCall(6, this, "ptr", pwszAuthority, "uint", dwFlags, "ptr", pwszSerialNumber, "uint*", pdwRequestId, "uint*", pdwDisposition, "ptr", pwszAttributes, "ptr", pctbRequest, "ptr", pctbFullResponse, "ptr", pctbEncodedCert, "ptr", pctbDispositionMessage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszAuthority 
     * @param {Integer} PropId 
     * @param {Integer} PropIndex 
     * @param {Integer} PropType 
     * @param {Pointer<CERTTRANSBLOB>} pctbPropertyValue 
     * @returns {HRESULT} 
     */
    GetCAProperty(pwszAuthority, PropId, PropIndex, PropType, pctbPropertyValue) {
        pwszAuthority := pwszAuthority is String ? StrPtr(pwszAuthority) : pwszAuthority

        result := ComCall(7, this, "ptr", pwszAuthority, "int", PropId, "int", PropIndex, "int", PropType, "ptr", pctbPropertyValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszAuthority 
     * @param {Pointer<Integer>} pcProperty 
     * @param {Pointer<CERTTRANSBLOB>} pctbPropInfo 
     * @returns {HRESULT} 
     */
    GetCAPropertyInfo(pwszAuthority, pcProperty, pctbPropInfo) {
        pwszAuthority := pwszAuthority is String ? StrPtr(pwszAuthority) : pwszAuthority

        result := ComCall(8, this, "ptr", pwszAuthority, "int*", pcProperty, "ptr", pctbPropInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszAuthority 
     * @returns {HRESULT} 
     */
    Ping2(pwszAuthority) {
        pwszAuthority := pwszAuthority is String ? StrPtr(pwszAuthority) : pwszAuthority

        result := ComCall(9, this, "ptr", pwszAuthority, "HRESULT")
        return result
    }
}

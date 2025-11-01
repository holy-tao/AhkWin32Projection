#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IVssComponentEx.ahk

/**
 * Defines additional methods for reporting and retrieving component-level writer errors.
 * @see https://docs.microsoft.com/windows/win32/api//vswriter/nl-vswriter-ivsscomponentex2
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class IVssComponentEx2 extends IVssComponentEx{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVssComponentEx2
     * @type {Guid}
     */
    static IID => Guid("{3b5be0f2-07a9-4e4b-bdd3-cfdc8e2c0d2d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 48

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetFailure", "GetFailure"]

    /**
     * 
     * @param {HRESULT} hr 
     * @param {HRESULT} hrApplication 
     * @param {PWSTR} wszApplicationMessage 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponentex2-setfailure
     */
    SetFailure(hr, hrApplication, wszApplicationMessage, dwReserved) {
        wszApplicationMessage := wszApplicationMessage is String ? StrPtr(wszApplicationMessage) : wszApplicationMessage

        result := ComCall(48, this, "int", hr, "int", hrApplication, "ptr", wszApplicationMessage, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HRESULT>} phr 
     * @param {Pointer<HRESULT>} phrApplication 
     * @param {Pointer<BSTR>} pbstrApplicationMessage 
     * @param {Pointer<Integer>} pdwReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponentex2-getfailure
     */
    GetFailure(phr, phrApplication, pbstrApplicationMessage, pdwReserved) {
        pdwReservedMarshal := pdwReserved is VarRef ? "uint*" : "ptr"

        result := ComCall(49, this, "ptr", phr, "ptr", phrApplication, "ptr", pbstrApplicationMessage, pdwReservedMarshal, pdwReserved, "HRESULT")
        return result
    }
}

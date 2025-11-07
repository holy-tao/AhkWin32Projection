#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that supply version information for accessible elements.
 * @see https://docs.microsoft.com/windows/win32/api//msaatext/nn-msaatext-iversioninfo
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class IVersionInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVersionInfo
     * @type {Guid}
     */
    static IID => Guid("{401518ec-db00-4611-9b29-2a0e4b9afa85}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSubcomponentCount", "GetImplementationID", "GetBuildVersion", "GetComponentDescription", "GetInstanceDescription"]

    /**
     * 
     * @param {Integer} ulSub 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msaatext/nf-msaatext-iversioninfo-getsubcomponentcount
     */
    GetSubcomponentCount(ulSub) {
        result := ComCall(3, this, "uint", ulSub, "uint*", &ulCount := 0, "HRESULT")
        return ulCount
    }

    /**
     * 
     * @param {Integer} ulSub 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/msaatext/nf-msaatext-iversioninfo-getimplementationid
     */
    GetImplementationID(ulSub) {
        implid := Guid()
        result := ComCall(4, this, "uint", ulSub, "ptr", implid, "HRESULT")
        return implid
    }

    /**
     * 
     * @param {Integer} ulSub 
     * @param {Pointer<Integer>} pdwMajor 
     * @param {Pointer<Integer>} pdwMinor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msaatext/nf-msaatext-iversioninfo-getbuildversion
     */
    GetBuildVersion(ulSub, pdwMajor, pdwMinor) {
        pdwMajorMarshal := pdwMajor is VarRef ? "uint*" : "ptr"
        pdwMinorMarshal := pdwMinor is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", ulSub, pdwMajorMarshal, pdwMajor, pdwMinorMarshal, pdwMinor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulSub 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/msaatext/nf-msaatext-iversioninfo-getcomponentdescription
     */
    GetComponentDescription(ulSub) {
        pImplStr := BSTR()
        result := ComCall(6, this, "uint", ulSub, "ptr", pImplStr, "HRESULT")
        return pImplStr
    }

    /**
     * 
     * @param {Integer} ulSub 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/msaatext/nf-msaatext-iversioninfo-getinstancedescription
     */
    GetInstanceDescription(ulSub) {
        pImplStr := BSTR()
        result := ComCall(7, this, "uint", ulSub, "ptr", pImplStr, "HRESULT")
        return pImplStr
    }
}

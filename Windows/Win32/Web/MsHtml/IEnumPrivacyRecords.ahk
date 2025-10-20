#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IEnumPrivacyRecords extends IUnknown{
    /**
     * The interface identifier for IEnumPrivacyRecords
     * @type {Guid}
     */
    static IID => Guid("{3050f844-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pSize 
     * @returns {HRESULT} 
     */
    GetSize(pSize) {
        result := ComCall(4, this, "uint*", pSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pState 
     * @returns {HRESULT} 
     */
    GetPrivacyImpacted(pState) {
        result := ComCall(5, this, "ptr", pState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrUrl 
     * @param {Pointer<BSTR>} pbstrPolicyRef 
     * @param {Pointer<Int32>} pdwReserved 
     * @param {Pointer<UInt32>} pdwPrivacyFlags 
     * @returns {HRESULT} 
     */
    Next(pbstrUrl, pbstrPolicyRef, pdwReserved, pdwPrivacyFlags) {
        result := ComCall(6, this, "ptr", pbstrUrl, "ptr", pbstrPolicyRef, "int*", pdwReserved, "uint*", pdwPrivacyFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

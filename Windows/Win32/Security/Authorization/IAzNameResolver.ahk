#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Translates security identifiers (SIDs) into principal display names.
 * @see https://docs.microsoft.com/windows/win32/api//azroles/nn-azroles-iaznameresolver
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class IAzNameResolver extends IDispatch{
    /**
     * The interface identifier for IAzNameResolver
     * @type {Guid}
     */
    static IID => Guid("{504d0f15-73e2-43df-a870-a64f40714f53}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {BSTR} bstrSid 
     * @param {Pointer<Int32>} pSidType 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    NameFromSid(bstrSid, pSidType, pbstrName) {
        bstrSid := bstrSid is String ? BSTR.Alloc(bstrSid).Value : bstrSid

        result := ComCall(7, this, "ptr", bstrSid, "int*", pSidType, "ptr", pbstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} vSids 
     * @param {Pointer<VARIANT>} pvSidTypes 
     * @param {Pointer<VARIANT>} pvNames 
     * @returns {HRESULT} 
     */
    NamesFromSids(vSids, pvSidTypes, pvNames) {
        result := ComCall(8, this, "ptr", vSids, "ptr", pvSidTypes, "ptr", pvNames, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that supply version information for accessible elements.
 * @see https://docs.microsoft.com/windows/win32/api//msaatext/nn-msaatext-iversioninfo
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class IVersionInfo extends IUnknown{
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
     * 
     * @param {Integer} ulSub 
     * @param {Pointer<UInt32>} ulCount 
     * @returns {HRESULT} 
     */
    GetSubcomponentCount(ulSub, ulCount) {
        result := ComCall(3, this, "uint", ulSub, "uint*", ulCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulSub 
     * @param {Pointer<Guid>} implid 
     * @returns {HRESULT} 
     */
    GetImplementationID(ulSub, implid) {
        result := ComCall(4, this, "uint", ulSub, "ptr", implid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulSub 
     * @param {Pointer<UInt32>} pdwMajor 
     * @param {Pointer<UInt32>} pdwMinor 
     * @returns {HRESULT} 
     */
    GetBuildVersion(ulSub, pdwMajor, pdwMinor) {
        result := ComCall(5, this, "uint", ulSub, "uint*", pdwMajor, "uint*", pdwMinor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulSub 
     * @param {Pointer<BSTR>} pImplStr 
     * @returns {HRESULT} 
     */
    GetComponentDescription(ulSub, pImplStr) {
        result := ComCall(6, this, "uint", ulSub, "ptr", pImplStr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulSub 
     * @param {Pointer<BSTR>} pImplStr 
     * @returns {HRESULT} 
     */
    GetInstanceDescription(ulSub, pImplStr) {
        result := ComCall(7, this, "uint", ulSub, "ptr", pImplStr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

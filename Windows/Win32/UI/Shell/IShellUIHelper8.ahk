#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IShellUIHelper7.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellUIHelper8 extends IShellUIHelper7{
    /**
     * The interface identifier for IShellUIHelper8
     * @type {Guid}
     */
    static IID => Guid("{66debcf2-05b0-4f07-b49b-b96241a65db2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 97

    /**
     * 
     * @param {Pointer<BSTR>} pbstrResult 
     * @returns {HRESULT} 
     */
    GetCVListData(pbstrResult) {
        result := ComCall(97, this, "ptr", pbstrResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrResult 
     * @returns {HRESULT} 
     */
    GetCVListLocalData(pbstrResult) {
        result := ComCall(98, this, "ptr", pbstrResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrResult 
     * @returns {HRESULT} 
     */
    GetEMIEListData(pbstrResult) {
        result := ComCall(99, this, "ptr", pbstrResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrResult 
     * @returns {HRESULT} 
     */
    GetEMIEListLocalData(pbstrResult) {
        result := ComCall(100, this, "ptr", pbstrResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OpenFavoritesPane() {
        result := ComCall(101, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OpenFavoritesSettings() {
        result := ComCall(102, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrUrl 
     * @returns {HRESULT} 
     */
    LaunchInHVSI(bstrUrl) {
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl

        result := ComCall(103, this, "ptr", bstrUrl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

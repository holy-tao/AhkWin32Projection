#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IEnumTfDisplayAttributeInfo interface is implemented by the TSF manager to provide an enumeration of display attribute information objects.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-ienumtfdisplayattributeinfo
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class IEnumTfDisplayAttributeInfo extends IUnknown{
    /**
     * The interface identifier for IEnumTfDisplayAttributeInfo
     * @type {Guid}
     */
    static IID => Guid("{7cef04d7-cb75-4e80-a7ab-5f5bc7d332de}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IEnumTfDisplayAttributeInfo>} ppEnum 
     * @returns {HRESULT} 
     */
    Clone(ppEnum) {
        result := ComCall(3, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulCount 
     * @param {Pointer<ITfDisplayAttributeInfo>} rgInfo 
     * @param {Pointer<UInt32>} pcFetched 
     * @returns {HRESULT} 
     */
    Next(ulCount, rgInfo, pcFetched) {
        result := ComCall(4, this, "uint", ulCount, "ptr", rgInfo, "uint*", pcFetched, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulCount 
     * @returns {HRESULT} 
     */
    Skip(ulCount) {
        result := ComCall(6, this, "uint", ulCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

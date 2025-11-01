#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IEnumTfProperties interface is implemented by the TSF manager to provide an enumeration of property objects.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-ienumtfproperties
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class IEnumTfProperties extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumTfProperties
     * @type {Guid}
     */
    static IID => Guid("{19188cb0-aca9-11d2-afc5-00105a2799b5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Clone", "Next", "Reset", "Skip"]

    /**
     * 
     * @param {Pointer<IEnumTfProperties>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-ienumtfproperties-clone
     */
    Clone(ppEnum) {
        result := ComCall(3, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulCount 
     * @param {Pointer<ITfProperty>} ppProp 
     * @param {Pointer<Integer>} pcFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-ienumtfproperties-next
     */
    Next(ulCount, ppProp, pcFetched) {
        result := ComCall(4, this, "uint", ulCount, "ptr*", ppProp, "uint*", pcFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-ienumtfproperties-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-ienumtfproperties-skip
     */
    Skip(ulCount) {
        result := ComCall(6, this, "uint", ulCount, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumTfContexts.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IEnumTfContexts interface is implemented by the TSF manager to provide an enumeration of context objects.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-ienumtfcontexts
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class IEnumTfContexts extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumTfContexts
     * @type {Guid}
     */
    static IID => Guid("{8f1a7ea6-1654-4502-a86e-b2902344d507}")

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
     * @returns {IEnumTfContexts} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-ienumtfcontexts-clone
     */
    Clone() {
        result := ComCall(3, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTfContexts(ppEnum)
    }

    /**
     * 
     * @param {Integer} ulCount 
     * @param {Pointer<ITfContext>} rgContext 
     * @param {Pointer<Integer>} pcFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-ienumtfcontexts-next
     */
    Next(ulCount, rgContext, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", ulCount, "ptr*", rgContext, pcFetchedMarshal, pcFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-ienumtfcontexts-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-ienumtfcontexts-skip
     */
    Skip(ulCount) {
        result := ComCall(6, this, "uint", ulCount, "HRESULT")
        return result
    }
}

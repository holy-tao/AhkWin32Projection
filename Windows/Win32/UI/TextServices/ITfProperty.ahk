#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfRange.ahk
#Include .\ITfReadOnlyProperty.ahk

/**
 * The ITfProperty interface is implemented by the TSF manager and used by a client (application or text service) to modify a property value.
 * @remarks
 * 
  * An instance of this interface is obtained in various ways, such as <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfcontext-getproperty">ITfContext::GetProperty</a> or <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-ienumtfproperties-next">IEnumTfProperties::Next</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfproperty
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfProperty extends ITfReadOnlyProperty{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfProperty
     * @type {Guid}
     */
    static IID => Guid("{e2449660-9542-11d2-bf46-00105a2799b5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindRange", "SetValueStore", "SetValue", "Clear"]

    /**
     * 
     * @param {Integer} ec 
     * @param {ITfRange} pRange 
     * @param {Integer} aPos 
     * @returns {ITfRange} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfproperty-findrange
     */
    FindRange(ec, pRange, aPos) {
        result := ComCall(7, this, "uint", ec, "ptr", pRange, "ptr*", &ppRange := 0, "int", aPos, "HRESULT")
        return ITfRange(ppRange)
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {ITfRange} pRange 
     * @param {ITfPropertyStore} pPropStore 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfproperty-setvaluestore
     */
    SetValueStore(ec, pRange, pPropStore) {
        result := ComCall(8, this, "uint", ec, "ptr", pRange, "ptr", pPropStore, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {ITfRange} pRange 
     * @param {Pointer<VARIANT>} pvarValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfproperty-setvalue
     */
    SetValue(ec, pRange, pvarValue) {
        result := ComCall(9, this, "uint", ec, "ptr", pRange, "ptr", pvarValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {ITfRange} pRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfproperty-clear
     */
    Clear(ec, pRange) {
        result := ComCall(10, this, "uint", ec, "ptr", pRange, "HRESULT")
        return result
    }
}

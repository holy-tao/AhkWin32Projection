#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumTfRanges.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\ITfContext.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfReadOnlyProperty interface is implemented by the TSF manager and used by an application or text service to obtain property data.
 * @remarks
 * 
  * An instance of this interface is obtained by using <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfcontext-getappproperty">ITfContext::GetAppProperty</a> or <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfcontext-trackproperties">ITfContext::TrackProperties</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfreadonlyproperty
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfReadOnlyProperty extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfReadOnlyProperty
     * @type {Guid}
     */
    static IID => Guid("{17d49a3d-f8b8-4b2f-b254-52319dd64c53}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetType", "EnumRanges", "GetValue", "GetContext"]

    /**
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfreadonlyproperty-gettype
     */
    GetType() {
        pguid := Guid()
        result := ComCall(3, this, "ptr", pguid, "HRESULT")
        return pguid
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {ITfRange} pTargetRange 
     * @returns {IEnumTfRanges} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfreadonlyproperty-enumranges
     */
    EnumRanges(ec, pTargetRange) {
        result := ComCall(4, this, "uint", ec, "ptr*", &ppEnum := 0, "ptr", pTargetRange, "HRESULT")
        return IEnumTfRanges(ppEnum)
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {ITfRange} pRange 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfreadonlyproperty-getvalue
     */
    GetValue(ec, pRange) {
        pvarValue := VARIANT()
        result := ComCall(5, this, "uint", ec, "ptr", pRange, "ptr", pvarValue, "HRESULT")
        return pvarValue
    }

    /**
     * 
     * @returns {ITfContext} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfreadonlyproperty-getcontext
     */
    GetContext() {
        result := ComCall(6, this, "ptr*", &ppContext := 0, "HRESULT")
        return ITfContext(ppContext)
    }
}

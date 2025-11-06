#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumTfRanges.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfEditRecord interface is implemented by the TSF manager and is used by a text edit sink to determine what was changed during an edit session.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfeditrecord
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfEditRecord extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfEditRecord
     * @type {Guid}
     */
    static IID => Guid("{42d4d099-7c1a-4a89-b836-6c6f22160df0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSelectionStatus", "GetTextAndPropertyUpdates"]

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfeditrecord-getselectionstatus
     */
    GetSelectionStatus() {
        result := ComCall(3, this, "int*", &pfChanged := 0, "HRESULT")
        return pfChanged
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<Pointer<Guid>>} prgProperties 
     * @param {Integer} cProperties 
     * @returns {IEnumTfRanges} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfeditrecord-gettextandpropertyupdates
     */
    GetTextAndPropertyUpdates(dwFlags, prgProperties, cProperties) {
        prgPropertiesMarshal := prgProperties is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "uint", dwFlags, prgPropertiesMarshal, prgProperties, "uint", cProperties, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTfRanges(ppEnum)
    }
}

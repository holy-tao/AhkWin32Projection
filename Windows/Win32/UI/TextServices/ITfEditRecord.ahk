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
     * ITfEditRecord::GetSelectionStatus method
     * @returns {BOOL} Pointer to a <b>BOOL</b> value that receives a value that indicates if the selection changed due to an edit session. Receives a nonzero value if the selection changed or zero otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfeditrecord-getselectionstatus
     */
    GetSelectionStatus() {
        result := ComCall(3, this, "int*", &pfChanged := 0, "HRESULT")
        return pfChanged
    }

    /**
     * ITfEditRecord::GetTextAndPropertyUpdates method
     * @param {Integer} dwFlags 
     * @param {Pointer<Pointer<Guid>>} prgProperties Pointer to an array of <b>GUID</b> values that identify the properties to search for changes for. This method searches the properties that changed during the edit session and, if the property is contained in this array, a range object that covers the property that changed is added to <i>ppEnum</i>.
     * 
     * This array must be at least <i>cProperties</i> elements in size.
     * 
     * This parameter is ignored if <i>dwFlags</i> contains TF_GTP_INCL_TEXT and <i>cProperties</i> is zero.
     * @param {Integer} cProperties Specifies the number of elements in the <i>prgProperties</i> array.
     * 
     * This parameter can be zero if <i>dwFlags</i> contains TF_GTP_INCL_TEXT. This indicates that no property changes are obtained.
     * @returns {IEnumTfRanges} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-ienumtfranges">IEnumTfRanges</a> interface pointer that receives the enumerator object.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfeditrecord-gettextandpropertyupdates
     */
    GetTextAndPropertyUpdates(dwFlags, prgProperties, cProperties) {
        prgPropertiesMarshal := prgProperties is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "uint", dwFlags, prgPropertiesMarshal, prgProperties, "uint", cProperties, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTfRanges(ppEnum)
    }
}

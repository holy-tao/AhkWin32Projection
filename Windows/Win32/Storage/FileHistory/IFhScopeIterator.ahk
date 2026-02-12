#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IFhScopeIterator interface allows client applications to enumerate individual items in an inclusion or exclusion list. To retrieve inclusion and exclusion lists, call the IFhConfigMgr::GetIncludeExcludeRules method.
 * @see https://learn.microsoft.com/windows/win32/api//content/fhcfg/nn-fhcfg-ifhscopeiterator
 * @namespace Windows.Win32.Storage.FileHistory
 * @version v4.0.30319
 */
class IFhScopeIterator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFhScopeIterator
     * @type {Guid}
     */
    static IID => Guid("{3197abce-532a-44c6-8615-f3666566a720}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["MoveToNextItem", "GetItem"]

    /**
     * Moves to the next item in the inclusion or exclusion list.
     * @remarks
     * If the current item is the last item in the list, or if the list is empty, this method returns <c>HRESULT_FROM_WIN32(ERROR_NOT_FOUND)</c>.
     * @returns {HRESULT} <b>S_OK</b> on success, or an unsuccessful <b>HRESULT</b> on failure. Possible unsuccessful <b>HRESULT</b> values include values defined in the FhErrors.h header file.
     * @see https://learn.microsoft.com/windows/win32/api//content/fhcfg/nf-fhcfg-ifhscopeiterator-movetonextitem
     */
    MoveToNextItem() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the current item in an inclusion or exclusion list.
     * @remarks
     * To move to the next item in the inclusion or exclusion list, call the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/nf-fhcfg-ifhscopeiterator-movetonextitem">IFhScopeIterator::MoveToNextItem</a> method.
     * @returns {BSTR} This parameter must be <b>NULL</b> on input. On output, it receives a pointer to a string that contains the current element of the list. This element is a library name or a folder name, depending on the parameters that were passed to the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/nf-fhcfg-ifhconfigmgr-getincludeexcluderules">IFhConfigMgr::GetIncludeExcludeRules</a> method. The string is allocated by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a>. You must call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the string when it is no longer needed.
     * @see https://learn.microsoft.com/windows/win32/api//content/fhcfg/nf-fhcfg-ifhscopeiterator-getitem
     */
    GetItem() {
        Item := BSTR()
        result := ComCall(4, this, "ptr", Item, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Item
    }
}

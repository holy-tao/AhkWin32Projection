#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * Represents the description of a spell checker option.
 * @see https://docs.microsoft.com/windows/win32/api//spellcheck/nn-spellcheck-ioptiondescription
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class IOptionDescription extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOptionDescription
     * @type {Guid}
     */
    static IID => Guid("{432e5f85-35cf-4606-a801-6f70277e1d7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "get_Heading", "get_Description", "get_Labels"]

    /**
     * 
     * @param {Pointer<PWSTR>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheck/nf-spellcheck-ioptiondescription-get_id
     */
    get_Id(value) {
        result := ComCall(3, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheck/nf-spellcheck-ioptiondescription-get_heading
     */
    get_Heading(value) {
        result := ComCall(4, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheck/nf-spellcheck-ioptiondescription-get_description
     */
    get_Description(value) {
        result := ComCall(5, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumString>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spellcheck/nf-spellcheck-ioptiondescription-get_labels
     */
    get_Labels(value) {
        result := ComCall(6, this, "ptr*", value, "HRESULT")
        return result
    }
}

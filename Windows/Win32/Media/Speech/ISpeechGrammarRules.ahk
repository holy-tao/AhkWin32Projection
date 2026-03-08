#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISpeechGrammarRule.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechGrammarRules extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechGrammarRules
     * @type {Guid}
     */
    static IID => Guid("{6ffa3b44-fc2d-40d1-8afc-32911c7f1ad1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "FindRule", "Item", "get__NewEnum", "get_Dynamic", "Add", "Commit", "CommitAndSave"]

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Dynamic {
        get => this.get_Dynamic()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(7, this, "int*", &Count := 0, "HRESULT")
        return Count
    }

    /**
     * 
     * @param {VARIANT} RuleNameOrId 
     * @returns {ISpeechGrammarRule} 
     */
    FindRule(RuleNameOrId) {
        result := ComCall(8, this, "ptr", RuleNameOrId, "ptr*", &Rule := 0, "HRESULT")
        return ISpeechGrammarRule(Rule)
    }

    /**
     * Windows Image Acquisition (WIA) hardware devices are represented as hierarchical trees of Item objects. The root item in this tree represents the device itself, while child items represent images, folders, or scanning beds.
     * @remarks
     * The **Item** object has these types of members:
     * 
     * -   [Methods](#methods)
     * -   [Properties](#properties)
     * @param {Integer} Index 
     * @returns {ISpeechGrammarRule} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-item
     */
    Item(Index) {
        result := ComCall(9, this, "int", Index, "ptr*", &Rule := 0, "HRESULT")
        return ISpeechGrammarRule(Rule)
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(10, this, "ptr*", &EnumVARIANT := 0, "HRESULT")
        return IUnknown(EnumVARIANT)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_Dynamic() {
        result := ComCall(11, this, "short*", &Dynamic := 0, "HRESULT")
        return Dynamic
    }

    /**
     * Adds an access-allowed access control entry (ACE) to an access control list (ACL). The access is granted to a specified security identifier (SID).
     * @remarks
     * The addition of an access-allowed ACE to an ACL is the most common form of ACL modification.
     * 
     * The <b>AddAccessAllowedAce</b> and <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-addaccessdeniedace">AddAccessDeniedAce</a> functions add a new ACE to the end of the list of ACEs for the ACL. These functions do not automatically place the new ACE in the proper canonical order. It is the caller's responsibility to ensure that the ACL is in canonical order by adding ACEs in the proper sequence.
     * 
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-ace_header">ACE_HEADER</a> structure placed in the ACE by the <b>AddAccessAllowedAce</b> function specifies a type and size, but provides no inheritance and no ACE flags.
     * @param {BSTR} RuleName 
     * @param {Integer} Attributes 
     * @param {Integer} RuleId 
     * @returns {ISpeechGrammarRule} 
     * @see https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-addaccessallowedace
     */
    Add(RuleName, Attributes, RuleId) {
        RuleName := RuleName is String ? BSTR.Alloc(RuleName).Value : RuleName

        result := ComCall(12, this, "ptr", RuleName, "int", Attributes, "int", RuleId, "ptr*", &Rule := 0, "HRESULT")
        return ISpeechGrammarRule(Rule)
    }

    /**
     * Indicates that a resource manager (RM) has finished committing a transaction that was requested by the transaction manager (TM).
     * @returns {HRESULT} If the function succeeds, the return value is nonzero. 
     * 
     * 
     *   
     * 
     * If the function fails, the return value is zero (0). To get extended error information, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     *  The following list identifies the possible error codes:
     * @see https://learn.microsoft.com/windows/win32/api/ktmw32/nf-ktmw32-commitcomplete
     */
    Commit() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ErrorText 
     * @param {Pointer<VARIANT>} SaveStream 
     * @returns {HRESULT} 
     */
    CommitAndSave(ErrorText, SaveStream) {
        result := ComCall(14, this, "ptr", ErrorText, "ptr", SaveStream, "HRESULT")
        return result
    }
}

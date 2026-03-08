#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Ole\IEnumVARIANT.ahk
#Include .\IEnumComponents.ahk
#Include .\IComponent.ahk
#Include ..\..\..\System\Variant\VARIANT.ahk
#Include .\IComponents.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IComponentsOld extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComponentsOld
     * @type {Guid}
     */
    static IID => Guid("{fcd01846-0e19-11d3-9d8e-00c04f72d980}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get__NewEnum", "EnumComponents", "get_Item", "Add", "Remove", "Clone"]

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IEnumVARIANT} 
     */
    _NewEnum {
        get => this.get__NewEnum()
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
     * @returns {IEnumVARIANT} 
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &ppNewEnum := 0, "HRESULT")
        return IEnumVARIANT(ppNewEnum)
    }

    /**
     * 
     * @returns {IEnumComponents} 
     */
    EnumComponents() {
        result := ComCall(9, this, "ptr*", &ppNewEnum := 0, "HRESULT")
        return IEnumComponents(ppNewEnum)
    }

    /**
     * 
     * @param {VARIANT} Index 
     * @returns {IComponent} 
     */
    get_Item(Index) {
        result := ComCall(10, this, "ptr", Index, "ptr*", &ppComponent := 0, "HRESULT")
        return IComponent(ppComponent)
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
     * @param {IComponent} Component 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-addaccessallowedace
     */
    Add(Component) {
        NewIndex := VARIANT()
        result := ComCall(11, this, "ptr", Component, "ptr", NewIndex, "HRESULT")
        return NewIndex
    }

    /**
     * Removes a TPM command from the local list of commands blocked from running on the computer.
     * @remarks
     * Managed Object Format (MOF) files contain the definitions for Windows Management Instrumentation (WMI) classes. MOF files are not installed as part of the Windows SDK. They are installed on the server when you add the associated role by using the Server Manager. For more information about MOF files, see [Managed Object Format (MOF)](../wmisdk/managed-object-format--mof-.md).
     * @param {VARIANT} Index 
     * @returns {HRESULT} Type: **uint32**
     * 
     * All TPM errors as well as errors specific to TPM Base Services can be returned.
     * 
     * Common return codes are listed below.
     * 
     * 
     * 
     * | Return code/value                                                                                                                                 | Description                           |
     * |---------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> <dt>0 (0x0)</dt> </dl> | The method was successful.<br/> |
     * @see https://learn.microsoft.com/windows/win32/SecProv/removeblockedcommand-win32-tpm
     */
    Remove(Index) {
        result := ComCall(12, this, "ptr", Index, "HRESULT")
        return result
    }

    /**
     * Creates a recognizer context that contains the same settings as the original. The new recognizer context does not include the ink or recognition results of the original.
     * @remarks
     * The settings  for this context include the recognition guide, character Autocomplete mode, and any factoids that improve the recognition results. An example of a factoid may include whether the ink is a phone number, a name, or a URL. The TextContext and Wordlists are preserved in the new context.
     * @returns {IComponents} 
     * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-clonecontext
     */
    Clone() {
        result := ComCall(13, this, "ptr*", &NewList := 0, "HRESULT")
        return IComponents(NewList)
    }
}

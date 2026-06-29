#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\TYPEKIND.ahk" { TYPEKIND }
#Import ".\ICreateTypeInfo.ahk" { ICreateTypeInfo }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides the methods for creating and managing the component or file that contains type information. (ICreateTypeLib)
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/nn-oaidl-icreatetypelib
 * @namespace Windows.Win32.System.Ole
 */
export default struct ICreateTypeLib extends IUnknown {
    /**
     * The interface identifier for ICreateTypeLib
     * @type {Guid}
     */
    static IID := Guid("{00020406-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICreateTypeLib interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateTypeInfo  : IntPtr
        SetName         : IntPtr
        SetVersion      : IntPtr
        SetGuid         : IntPtr
        SetDocString    : IntPtr
        SetHelpFileName : IntPtr
        SetHelpContext  : IntPtr
        SetLcid         : IntPtr
        SetLibFlags     : IntPtr
        SaveAllChanges  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICreateTypeLib.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a new type description instance within the type library.
     * @remarks
     * Use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-icreatetypelib">ICreateTypeLib</a> to create a new type description instance within the library. An error is returned if the specified name already appears in the library. Valid <i>tkind</i> values are described in TYPEKIND. To get the type information of the type description that is being created, call <c>IUnknown::QueryInterface(IID_ITypeInfo, ...)</c> on the returned <b>ICreateTypeLib</b>. This type information can be used by other type descriptions that reference it by using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nf-oaidl-icreatetypeinfo-addreftypeinfo">ICreateTypeInfo::AddRefTypeInfo</a>.
     * @param {PWSTR} szName The name of the new type.
     * @param {TYPEKIND} tkind TYPEKIND of the type description to be created.
     * @returns {ICreateTypeInfo} The type description.
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypelib-createtypeinfo
     */
    CreateTypeInfo(szName, tkind) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(3, this, "ptr", szName, TYPEKIND, tkind, "ptr*", &ppCTInfo := 0, "HRESULT")
        return ICreateTypeInfo(ppCTInfo)
    }

    /**
     * Sets the name of the type library.
     * @param {PWSTR} szName The name to be assigned to the library.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E_INSUFFICIENTMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_INVALIDSTATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The state of the type library is not valid for this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypelib-setname
     */
    SetName(szName) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(4, this, "ptr", szName, "HRESULT")
        return result
    }

    /**
     * Sets the major and minor version numbers of the type library.
     * @param {Integer} wMajorVerNum The major version number for the library.
     * @param {Integer} wMinorVerNum The minor version number for the library.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_INVALIDSTATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The state of the type library is not valid for this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypelib-setversion
     */
    SetVersion(wMajorVerNum, wMinorVerNum) {
        result := ComCall(5, this, "ushort", wMajorVerNum, "ushort", wMinorVerNum, "HRESULT")
        return result
    }

    /**
     * Sets the universal unique identifier (UUID) associated with the type library.
     * @param {Pointer<Guid>} guid The globally unique identifier to be assigned to the library.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E_INSUFFICIENTMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_INVALIDSTATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The state of the type library is not valid for this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypelib-setguid
     */
    SetGuid(guid) {
        result := ComCall(6, this, Guid.Ptr, guid, "HRESULT")
        return result
    }

    /**
     * Sets the documentation string associated with the library.
     * @remarks
     * The documentation string is a brief description of the library intended for use by type information browsing tools.
     * @param {PWSTR} szDoc A brief description of the type library.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E_INSUFFICIENTMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypelib-setdocstring
     */
    SetDocString(szDoc) {
        szDoc := szDoc is String ? StrPtr(szDoc) : szDoc

        result := ComCall(7, this, "ptr", szDoc, "HRESULT")
        return result
    }

    /**
     * Sets the name of the Help file.
     * @remarks
     * Each type library can reference a single Help file.
     * 
     * 
     * 
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nf-oaidl-itypelib-getdocumentation">GetDocumentation</a> method of the created <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-itypelib">ITypeLib</a> returns a fully qualified path for the Help file, which is formed by appending the name passed into <i>szHelpFileName</i> to the registered Help directory for the type library. The Help directory is registered under:
     * 
     * 
     * 
     * \TYPELIB\&lt;guid of library&gt;\&lt;Major.Minor version &gt;\HELPDIR
     * @param {PWSTR} szHelpFileName The name of the Help file for the library.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E_INSUFFICIENTMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_INVALIDSTATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The state of the type library is not valid for this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypelib-sethelpfilename
     */
    SetHelpFileName(szHelpFileName) {
        szHelpFileName := szHelpFileName is String ? StrPtr(szHelpFileName) : szHelpFileName

        result := ComCall(8, this, "ptr", szHelpFileName, "HRESULT")
        return result
    }

    /**
     * Sets the Help context ID for retrieving general Help information for the type library.
     * @remarks
     * Calling <b>SetHelpContext</b> with a Help context of zero is equivalent to not calling it at all, because zero indicates a null Help context.
     * @param {Integer} dwHelpContext The Help context ID.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E_INSUFFICIENTMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_INVALIDSTATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The state of the type library is not valid for this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypelib-sethelpcontext
     */
    SetHelpContext(dwHelpContext) {
        result := ComCall(9, this, "uint", dwHelpContext, "HRESULT")
        return result
    }

    /**
     * Sets the binary Microsoft national language ID associated with the library.
     * @remarks
     * For more information on national language IDs, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/supporting-multiple-national-languages">Supporting Multiple National Languages</a> and the National Language Support (NLS) API.
     * @param {Integer} lcid The locale ID for the type library.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E_INSUFFICIENTMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_INVALIDSTATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The state of the type library is not valid for this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypelib-setlcid
     */
    SetLcid(lcid) {
        result := ComCall(10, this, "uint", lcid, "HRESULT")
        return result
    }

    /**
     * Sets library flags.
     * @remarks
     * Valid <i>uLibFlags</i> values are listed in <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ne-oaidl-libflags">LIBFLAGS</a>.
     * @param {Integer} uLibFlags The flags to set.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E_INSUFFICIENTMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_INVALIDSTATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The state of the type library is not valid for this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypelib-setlibflags
     */
    SetLibFlags(uLibFlags) {
        result := ComCall(11, this, "uint", uLibFlags, "HRESULT")
        return result
    }

    /**
     * Saves the ICreateTypeLib instance following the layout of type information.
     * @remarks
     * You should not call any other <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-icreatetypelib">ICreateTypeLib</a> methods after calling <b>SaveAllChanges</b>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E_INSUFFICIENTMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_IOERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function cannot write to the file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_INVALIDSTATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The state of the type library is not valid for this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypelib-saveallchanges
     */
    SaveAllChanges() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICreateTypeLib.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateTypeInfo := CallbackCreate(GetMethod(implObj, "CreateTypeInfo"), flags, 4)
        this.vtbl.SetName := CallbackCreate(GetMethod(implObj, "SetName"), flags, 2)
        this.vtbl.SetVersion := CallbackCreate(GetMethod(implObj, "SetVersion"), flags, 3)
        this.vtbl.SetGuid := CallbackCreate(GetMethod(implObj, "SetGuid"), flags, 2)
        this.vtbl.SetDocString := CallbackCreate(GetMethod(implObj, "SetDocString"), flags, 2)
        this.vtbl.SetHelpFileName := CallbackCreate(GetMethod(implObj, "SetHelpFileName"), flags, 2)
        this.vtbl.SetHelpContext := CallbackCreate(GetMethod(implObj, "SetHelpContext"), flags, 2)
        this.vtbl.SetLcid := CallbackCreate(GetMethod(implObj, "SetLcid"), flags, 2)
        this.vtbl.SetLibFlags := CallbackCreate(GetMethod(implObj, "SetLibFlags"), flags, 2)
        this.vtbl.SaveAllChanges := CallbackCreate(GetMethod(implObj, "SaveAllChanges"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateTypeInfo)
        CallbackFree(this.vtbl.SetName)
        CallbackFree(this.vtbl.SetVersion)
        CallbackFree(this.vtbl.SetGuid)
        CallbackFree(this.vtbl.SetDocString)
        CallbackFree(this.vtbl.SetHelpFileName)
        CallbackFree(this.vtbl.SetHelpContext)
        CallbackFree(this.vtbl.SetLcid)
        CallbackFree(this.vtbl.SetLibFlags)
        CallbackFree(this.vtbl.SaveAllChanges)
    }
}

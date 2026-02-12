#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides the tools for creating and administering the type information defined through the type description. (ICreateTypeInfo)
 * @see https://learn.microsoft.com/windows/win32/api//content/oaidl/nn-oaidl-icreatetypeinfo
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class ICreateTypeInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICreateTypeInfo
     * @type {Guid}
     */
    static IID => Guid("{00020405-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetGuid", "SetTypeFlags", "SetDocString", "SetHelpContext", "SetVersion", "AddRefTypeInfo", "AddFuncDesc", "AddImplType", "SetImplTypeFlags", "SetAlignment", "SetSchema", "AddVarDesc", "SetFuncAndParamNames", "SetVarName", "SetTypeDescAlias", "DefineFuncAsDllEntry", "SetFuncDocString", "SetVarDocString", "SetFuncHelpContext", "SetVarHelpContext", "SetMops", "SetTypeIdldesc", "LayOut"]

    /**
     * Sets the globally unique identifier (GUID) associated with the type description.
     * @remarks
     * For an interface, this is an interface ID (IID); for a coclass, it is a class ID (CLSID). For information on GUIDs, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/type-libraries-and-the-object-description-language">Type Libraries and the Object Description Language</a>.
     * @param {Pointer<Guid>} guid The globally unique ID to be associated with the type description.
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
     * <dt><b>S_OK
     * </b></dt>
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
     * <dt><b>E_OUTOFMEMORY
     * </b></dt>
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
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot write to the destination.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E_INSUFFICIENTMEMORY
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/oaidl/nf-oaidl-icreatetypeinfo-setguid
     */
    SetGuid(guid) {
        result := ComCall(3, this, "ptr", guid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets type flags of the type description being created.
     * @param {Integer} uTypeFlags The settings for the type flags. For details, see TYPEFLAGS.
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
     * <dt><b>S_OK
     * </b></dt>
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
     * <dt><b>E_INVALIDARG
     * </b></dt>
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
     * <dt><b>E_OUTOFMEMORY
     * </b></dt>
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
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot write to the destination.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E_INSUFFICIENTMEMORY
     * </b></dt>
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
     * <dt><b>TYPE_E_WRONGTYPEKIND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Type mismatch.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/oaidl/nf-oaidl-icreatetypeinfo-settypeflags
     */
    SetTypeFlags(uTypeFlags) {
        result := ComCall(4, this, "uint", uTypeFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the documentation string displayed by type browsers.
     * @param {PWSTR} pStrDoc A brief description of the type description.
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
     * <dt><b>S_OK
     * </b></dt>
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
     * <dt><b>E_OUTOFMEMORY
     * </b></dt>
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
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot write to the destination.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E_INSUFFICIENTMEMORY
     * </b></dt>
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
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/oaidl/nf-oaidl-icreatetypeinfo-setdocstring
     */
    SetDocString(pStrDoc) {
        pStrDoc := pStrDoc is String ? StrPtr(pStrDoc) : pStrDoc

        result := ComCall(5, this, "ptr", pStrDoc, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the Help context ID of the type information.
     * @param {Integer} dwHelpContext A handle to the Help context.
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
     * <dt><b>S_OK
     * </b></dt>
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
     * <dt><b>E_INVALIDARG
     * </b></dt>
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
     * <dt><b>E_OUTOFMEMORY
     * </b></dt>
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
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot write to the destination.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E_INSUFFICIENTMEMORY
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/oaidl/nf-oaidl-icreatetypeinfo-sethelpcontext
     */
    SetHelpContext(dwHelpContext) {
        result := ComCall(6, this, "uint", dwHelpContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the major and minor version number of the type information.
     * @param {Integer} wMajorVerNum The major version number.
     * @param {Integer} wMinorVerNum The minor version number.
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
     * <dt><b>S_OK
     * </b></dt>
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
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot write to the destination.
     * 
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
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/oaidl/nf-oaidl-icreatetypeinfo-setversion
     */
    SetVersion(wMajorVerNum, wMinorVerNum) {
        result := ComCall(7, this, "ushort", wMajorVerNum, "ushort", wMinorVerNum, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds a type description to those referenced by the type description being created.
     * @remarks
     * The second parameter returns a pointer to the handle of the added type information. If <b>AddRefTypeInfo</b> has been called previously for the same type information, the index that was returned by the previous call is returned in <i>phRefType</i>. If the referenced type description is in the type library being created, its type information can be obtained by calling IUnknown::QueryInterface(IID_ITypeInfo, ...) on the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-icreatetypeinfo">ICreateTypeInfo</a> interface of that type description.
     * @param {ITypeInfo} pTInfo The type description to be referenced.
     * @param {Pointer<Integer>} phRefType The handle that this type description associates with the referenced type information.
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
     * <dt><b>S_OK
     * </b></dt>
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
     * <dt><b>E_INVALIDARG
     * </b></dt>
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
     * <dt><b>E_OUTOFMEMORY
     * </b></dt>
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
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot write to the destination.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E_INSUFFICIENTMEMORY
     * </b></dt>
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
     * <dt><b>TYPE_E_WRONGTYPEKIND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Type mismatch.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/oaidl/nf-oaidl-icreatetypeinfo-addreftypeinfo
     */
    AddRefTypeInfo(pTInfo, phRefType) {
        phRefTypeMarshal := phRefType is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "ptr", pTInfo, phRefTypeMarshal, phRefType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds a function description to the type description.
     * @remarks
     * The index specifies the order of the functions within the type information. The first function has an index of zero. If an index is specified that exceeds one less than the number of functions in the type information, an error is returned. Calling this function does not pass ownership of the FUNCDESC structure to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-icreatetypeinfo">ICreateTypeInfo</a>. Therefore, the caller must still de-allocate the FUNCDESC structure.
     * 
     * 
     * 
     * The passed-in virtual function table (VTBL) field (oVft) of the FUNCDESC is ignored if the TYPEKIND is TKIND_MODULE or if oVft is -1 or 0. This attribute is set when <a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/out">ICreateTypeInfo::LayOut</a> is called. The oVft value is used if the TYPEKIND is TKIND_DISPATCH and a dual interface or if the TYPEKIND is TKIND_INTERFACE. If the oVft is used, it must be a multiple of the sizeof(VOID *) on the machine, otherwise the function fails and E_INVALIDARG is returned as the HRESULT.
     * 
     * 
     * 
     * The function <b>AddFuncDesc</b> uses the passed-in member identifier (<i>memid</i>) fields within each FUNCDESC for classes with TYPEKIND = TKIND_DISPATCH or TKIND_INTERFACE. If the member IDs are set to MEMBERID_NIL, <b>AddFuncDesc</b> assigns member IDs to the functions. Otherwise, the member ID fields within each FUNCDESC are ignored.
     * 
     * 
     * 
     * Any HREFTYPE fields in the FUNCDESC structure must have been produced by the same instance of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-itypeinfo">ITypeInfo</a> for which <b>AddFuncDesc</b> is called.
     * 
     * 
     * 
     * The get and put accessor functions for the same property must have the same dispatch identifier (DISPID).
     * @param {Integer} index The index of the new FUNCDESC in the type information.
     * @param {Pointer<FUNCDESC>} pFuncDesc A FUNCDESC structure that describes the function. The <b>bstrIDLInfo</b> field in the FUNCDESC should be null.
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
     * <dt><b>S_OK
     * </b></dt>
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
     * <dt><b>E_INVALIDARG
     * </b></dt>
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
     * <dt><b>E_OUTOFMEMORY
     * </b></dt>
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
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot write to the destination.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E_INSUFFICIENTMEMORY
     * </b></dt>
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
     * <dt><b>TYPE_E_WRONGTYPEKIND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Type mismatch.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/oaidl/nf-oaidl-icreatetypeinfo-addfuncdesc
     */
    AddFuncDesc(index, pFuncDesc) {
        result := ComCall(9, this, "uint", index, "ptr", pFuncDesc, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Specifies an inherited interface, or an interface implemented by a component object class (coclass).
     * @remarks
     * To specify an inherited interface, use index = 0. For a dispinterface with Syntax 2, call <b>ICreateTypeInfo::AddImplType</b> twice, once with <i>index</i> = 0 for the inherited <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> and once with <i>index</i> = 1 for the interface that is being wrapped. For a dual interface, call <b>ICreateTypeInfo::AddImplType</b> with <i>index</i> = -1 for the TKIND_INTERFACE type information component of the dual interface.
     * @param {Integer} index The index of the implementation class to be added. Specifies the order of the type relative to the other type.
     * @param {Integer} hRefType A handle to the referenced type description obtained from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nf-oaidl-icreatetypeinfo-addreftypeinfo">AddRefType</a> description.
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
     * <dt><b>S_OK
     * </b></dt>
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
     * <dt><b>E_INVALIDARG
     * </b></dt>
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
     * <dt><b>E_OUTOFMEMORY
     * </b></dt>
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
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot write to the destination.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E_INSUFFICIENTMEMORY
     * </b></dt>
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
     * <dt><b>TYPE_E_WRONGTYPEKIND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Type mismatch.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/oaidl/nf-oaidl-icreatetypeinfo-addimpltype
     */
    AddImplType(index, hRefType) {
        result := ComCall(10, this, "uint", index, "uint", hRefType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the attributes for an implemented or inherited interface of a type.
     * @param {Integer} index The index of the interface for which to set type flags.
     * @param {Integer} implTypeFlags_ IMPLTYPE flags to be set.
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
     * <dt><b>S_OK
     * </b></dt>
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
     * <dt><b>E_INVALIDARG
     * </b></dt>
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
     * <dt><b>E_OUTOFMEMORY
     * </b></dt>
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
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot write to the destination.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E_INSUFFICIENTMEMORY
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/oaidl/nf-oaidl-icreatetypeinfo-setimpltypeflags
     */
    SetImplTypeFlags(index, implTypeFlags_) {
        result := ComCall(11, this, "uint", index, "int", implTypeFlags_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Specifies the data alignment for an item of TYPEKIND=TKIND_RECORD.
     * @remarks
     * The alignment is the minimum of the natural alignment (for example, byte data on byte boundaries, word data on word boundaries, and so on), and the alignment denoted by <i>cbAlignment</i>.
     * @param {Integer} cbAlignment Alignment method for the type. A value of 0 indicates alignment on the 64K boundary; 1 indicates no special alignment. For other values, n indicates alignment on byte <i>n</i>.
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
     * <dt><b>S_OK
     * </b></dt>
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
     * <dt><b>E_OUTOFMEMORY
     * </b></dt>
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
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot write to the destination.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E_INSUFFICIENTMEMORY
     * </b></dt>
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
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/oaidl/nf-oaidl-icreatetypeinfo-setalignment
     */
    SetAlignment(cbAlignment) {
        result := ComCall(12, this, "ushort", cbAlignment, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} pStrSchema 
     * @returns {HRESULT} 
     */
    SetSchema(pStrSchema) {
        pStrSchema := pStrSchema is String ? StrPtr(pStrSchema) : pStrSchema

        result := ComCall(13, this, "ptr", pStrSchema, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds a variable or data member description to the type description.
     * @remarks
     * The index specifies the order of the variables. The first variable has an index of zero. <b>ICreateTypeInfo::AddVarDesc</b> returns an error if the specified index is greater than the number of variables currently in the type information. Calling this function does not pass ownership of the VARDESC structure to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-icreatetypeinfo">ICreateTypeInfo</a>. The instance field (oInst) of the VARDESC structure is ignored. This attribute is set only when <a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/out">ICreateTypeInfo::LayOut</a> is called. Also, the member ID fields within the VARDESCs are ignored unless the TYPEKIND of the class is TKIND_DISPATCH.
     * 
     * Any HREFTYPE fields in the VARDESC structure must have been produced by the same instance of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-itypeinfo">ITypeInfo</a> for which <b>AddVarDesc</b> is called.
     * 
     * 
     * 
     * <b>AddVarDesc</b> ignores the contents of the idldesc field of the ELEMDESC.
     * @param {Integer} index The index of the variable or data member to be added to the type description.
     * @param {Pointer<VARDESC>} pVarDesc A pointer to the variable or data member description to be added.
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
     * <dt><b>S_OK
     * </b></dt>
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
     * <dt><b>E_INVALIDARG
     * </b></dt>
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
     * <dt><b>E_OUTOFMEMORY
     * </b></dt>
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
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot write to the destination.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E_INSUFFICIENTMEMORY
     * </b></dt>
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
     * <dt><b>TYPE_E_WRONGTYPEKIND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Type mismatch.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/oaidl/nf-oaidl-icreatetypeinfo-addvardesc
     */
    AddVarDesc(index, pVarDesc) {
        result := ComCall(14, this, "uint", index, "ptr", pVarDesc, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the name of a function and the names of its parameters to the specified names.
     * @remarks
     * This method must be used once for each property. The last parameter for put and putref accessor functions is unnamed.
     * @param {Integer} index The index of the function whose function name and parameter names are to be set.
     * @param {Pointer<PWSTR>} rgszNames An array of pointers to names. The first element is the function name. Subsequent elements are names of parameters.
     * @param {Integer} cNames The number of elements in the <i>rgszNames</i> array.
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
     * <dt><b>S_OK
     * </b></dt>
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
     * <dt><b>E_INVALIDARG
     * </b></dt>
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
     * <dt><b>E_OUTOFMEMORY
     * </b></dt>
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
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot write to the destination.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E_INSUFFICIENTMEMORY
     * </b></dt>
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
     * <dt><b>TYPE_E_ELEMENTNOTFOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The element cannot be found.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/oaidl/nf-oaidl-icreatetypeinfo-setfuncandparamnames
     */
    SetFuncAndParamNames(index, rgszNames, cNames) {
        rgszNamesMarshal := rgszNames is VarRef ? "ptr*" : "ptr"

        result := ComCall(15, this, "uint", index, rgszNamesMarshal, rgszNames, "uint", cNames, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the name of a variable.
     * @param {Integer} index The index of the variable.
     * @param {PWSTR} szName The name.
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
     * <dt><b>S_OK
     * </b></dt>
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
     * <dt><b>E_OUTOFMEMORY
     * </b></dt>
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
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot write to the destination.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E_INSUFFICIENTMEMORY
     * </b></dt>
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
     * <dt><b>TYPE_E_ELEMENTNOTFOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The element cannot be found.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/oaidl/nf-oaidl-icreatetypeinfo-setvarname
     */
    SetVarName(index, szName) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(16, this, "uint", index, "ptr", szName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the type description for which this type description is an alias, if TYPEKIND=TKIND_ALIAS.
     * @remarks
     * To set the type for an alias, call <b>SetTypeDescAlias</b> for a type description whose TYPEKIND is TKIND_ALIAS.
     * @param {Pointer<TYPEDESC>} pTDescAlias The type description.
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
     * <dt><b>S_OK
     * </b></dt>
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
     * <dt><b>E_INVALIDARG
     * </b></dt>
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
     * <dt><b>E_OUTOFMEMORY
     * </b></dt>
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
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot write to the destination.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E_INSUFFICIENTMEMORY
     * </b></dt>
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
     * <dt><b>TYPE_E_WRONGTYPEKIND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Type mismatch.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/oaidl/nf-oaidl-icreatetypeinfo-settypedescalias
     */
    SetTypeDescAlias(pTDescAlias) {
        result := ComCall(17, this, "ptr", pTDescAlias, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Associates a DLL entry point with the function that has the specified index.
     * @remarks
     * If the high word of <i>szProcName</i> is zero, then the low word must contain the ordinal of the entry point; otherwise, <i>szProcName</i> points to the zero-terminated name of the entry point.
     * @param {Integer} index The index of the function.
     * @param {PWSTR} szDllName The name of the DLL that contains the entry point.
     * @param {PWSTR} szProcName The name of the entry point or an ordinal (if the high word is zero).
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
     * <dt><b>S_OK
     * </b></dt>
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
     * <dt><b>E_INVALIDARG
     * </b></dt>
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
     * <dt><b>E_OUTOFMEMORY
     * </b></dt>
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
     * <dt><b>STG_E_INSUFFICIENTMEMORY
     * </b></dt>
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
     * <dt><b>TYPE_E_ELEMENTNOTFOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The element cannot be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_WRONGTYPEKIND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Type mismatch.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/oaidl/nf-oaidl-icreatetypeinfo-definefuncasdllentry
     */
    DefineFuncAsDllEntry(index, szDllName, szProcName) {
        szDllName := szDllName is String ? StrPtr(szDllName) : szDllName
        szProcName := szProcName is String ? StrPtr(szProcName) : szProcName

        result := ComCall(18, this, "uint", index, "ptr", szDllName, "ptr", szProcName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the documentation string for the function with the specified index.
     * @remarks
     * The documentation string is a brief description of the function intended for use by tools such as type browsers. <b>SetFuncDocString</b> only needs to be used once for each property, because all property accessor functions are identified by one name.
     * @param {Integer} index The index of the function.
     * @param {PWSTR} szDocString The documentation string.
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
     * <dt><b>S_OK
     * </b></dt>
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
     * <dt><b>E_INVALIDARG
     * </b></dt>
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
     * <dt><b>E_OUTOFMEMORY
     * </b></dt>
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
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot write to the destination.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E_INSUFFICIENTMEMORY
     * </b></dt>
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
     * <dt><b>TYPE_E_ELEMENTNOTFOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The element cannot be found.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/oaidl/nf-oaidl-icreatetypeinfo-setfuncdocstring
     */
    SetFuncDocString(index, szDocString) {
        szDocString := szDocString is String ? StrPtr(szDocString) : szDocString

        result := ComCall(19, this, "uint", index, "ptr", szDocString, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the documentation string for the variable with the specified index.
     * @param {Integer} index The index of the variable.
     * @param {PWSTR} szDocString The documentation string.
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
     * <dt><b>S_OK
     * </b></dt>
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
     * <dt><b>E_OUTOFMEMORY
     * </b></dt>
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
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot write to the destination.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E_INSUFFICIENTMEMORY
     * </b></dt>
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
     * <dt><b>TYPE_E_ELEMENTNOTFOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The element cannot be found.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/oaidl/nf-oaidl-icreatetypeinfo-setvardocstring
     */
    SetVarDocString(index, szDocString) {
        szDocString := szDocString is String ? StrPtr(szDocString) : szDocString

        result := ComCall(20, this, "uint", index, "ptr", szDocString, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the Help context ID for the function with the specified index.
     * @remarks
     * <b>SetFuncHelpContext</b> only needs to be set once for each property, because all property accessor functions are identified by one name.
     * @param {Integer} index The index of the function.
     * @param {Integer} dwHelpContext The Help context ID for the Help topic.
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
     * <dt><b>S_OK
     * </b></dt>
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
     * <dt><b>E_INVALIDARG
     * </b></dt>
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
     * <dt><b>E_OUTOFMEMORY
     * </b></dt>
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
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot write to the destination.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E_INSUFFICIENTMEMORY
     * </b></dt>
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
     * <dt><b>TYPE_E_ELEMENTNOTFOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The element cannot be found.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/oaidl/nf-oaidl-icreatetypeinfo-setfunchelpcontext
     */
    SetFuncHelpContext(index, dwHelpContext) {
        result := ComCall(21, this, "uint", index, "uint", dwHelpContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the Help context ID for the variable with the specified index.
     * @param {Integer} index The index of the variable.
     * @param {Integer} dwHelpContext The handle to the Help context ID for the Help topic on the variable.
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
     * <dt><b>S_OK
     * </b></dt>
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
     * <dt><b>E_OUTOFMEMORY
     * </b></dt>
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
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot write to the destination.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E_INSUFFICIENTMEMORY
     * </b></dt>
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
     * <dt><b>TYPE_E_ELEMENTNOTFOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The element cannot be found.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/oaidl/nf-oaidl-icreatetypeinfo-setvarhelpcontext
     */
    SetVarHelpContext(index, dwHelpContext) {
        result := ComCall(22, this, "uint", index, "uint", dwHelpContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the marshaling opcode string associated with the type description or the function.
     * @param {Integer} index The index of the member for which to set the opcode string. If index is –1, sets the opcode string for the type description.
     * @param {BSTR} bstrMops The marshaling opcode string.
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
     * <dt><b>S_OK
     * </b></dt>
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
     * <dt><b>E_INVALIDARG
     * </b></dt>
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
     * <dt><b>E_OUTOFMEMORY
     * </b></dt>
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
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot write to the destination.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E_INSUFFICIENTMEMORY
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/oaidl/nf-oaidl-icreatetypeinfo-setmops
     */
    SetMops(index, bstrMops) {
        if(bstrMops is String) {
            pin := BSTR.Alloc(bstrMops)
            bstrMops := pin.Value
        }

        result := ComCall(23, this, "uint", index, "ptr", bstrMops, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<IDLDESC>} pIdlDesc 
     * @returns {HRESULT} 
     */
    SetTypeIdldesc(pIdlDesc) {
        result := ComCall(24, this, "ptr", pIdlDesc, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Assigns VTBL offsets for virtual functions and instance offsets for per-instance data members, and creates the two type descriptions for dual interfaces.
     * @remarks
     * <b>LayOut</b> also assigns member ID numbers to the functions and variables, unless the TYPEKIND of the class is TKIND_DISPATCH. Call <b>LayOut</b> after all members of the type information are defined, and before the type library is saved.
     * 
     * 
     * 
     * Use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nf-oaidl-icreatetypelib-saveallchanges">ICreateTypeLib::SaveAllChanges</a> to save the type information after calling <b>LayOut</b>. Other members of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-icreatetypeinfo">ICreateTypeInfo</a> interface should not be called after calling <b>LayOut</b>.
     * 
     * <div class="alert"><b>Note</b>  Different implementations of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nf-oaidl-icreatetypelib-saveallchanges">ICreateTypeLib::SaveAllChanges</a> or other interfaces that create type information are free to assign any member ID numbers, provided that all members (including inherited members), have unique IDs. For examples, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-icreatetypeinfo2">ICreateTypeInfo2</a>.
     * </div>
     * <div> </div>
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
     * <dt><b>S_OK
     * </b></dt>
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
     * <dt><b>E_OUTOFMEMORY
     * </b></dt>
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
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot write to the destination.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E_INSUFFICIENTMEMORY
     * </b></dt>
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
     * <dt><b>TYPE_E_UNDEFINEDTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Bound to unrecognized type.
     * 
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
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_WRONGTYPEKIND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Type mismatch.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_ELEMENTNOTFOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The element cannot be found.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_AMBIGUOUSNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * More than one item exists with this name.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_SIZETOOBIG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The type information is too long.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Type mismatch.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/oaidl/nf-oaidl-icreatetypeinfo-layout
     */
    LayOut() {
        result := ComCall(25, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

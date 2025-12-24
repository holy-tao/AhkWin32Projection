#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Parses a displayable name string to convert it into a moniker for custom moniker implementations.
 * @see https://docs.microsoft.com/windows/win32/api//oleidl/nn-oleidl-iparsedisplayname
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IParseDisplayName extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IParseDisplayName
     * @type {Guid}
     */
    static IID => Guid("{0000011a-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ParseDisplayName"]

    /**
     * Parses the specified display name and creates a corresponding moniker.
     * @param {IBindCtx} pbc A pointer to the bind context to be used in this binding operation. See <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a>.
     * @param {PWSTR} pszDisplayName The display name to be parsed.
     * @param {Pointer<Integer>} pchEaten A pointer to a variable that receives the number of characters in the display name that correspond to the <i>ppmkOut</i> moniker.
     * @param {Pointer<IMoniker>} ppmkOut A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> pointer variable that receives the interface pointer to the resulting moniker. If an error occurs, the implementation sets *<i>ppmkOut</i> to <b>NULL</b>. If *<i>ppmkOut</i> is non-<b>NULL</b>, the implementation must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a>; it is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>.
     * @returns {HRESULT} This method can return the standard return values E_OUTOFMEMORY and E_UNEXPECTED, as well as the following values.
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
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MK_E_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is a syntax error in the display name. Parsing failed because <i>pszDisplayName</i> could only be partially resolved into a moniker. In this case, *<i>pchEaten</i> has the number of characters that were successfully parsed into a moniker prefix. The parameter <i>ppmkOut</i> should be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MK_E_NOOBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The display name does not identify a component in this namespace.
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
     * One or more parameters are not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-iparsedisplayname-parsedisplayname
     */
    ParseDisplayName(pbc, pszDisplayName, pchEaten, ppmkOut) {
        pszDisplayName := pszDisplayName is String ? StrPtr(pszDisplayName) : pszDisplayName

        pchEatenMarshal := pchEaten is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pbc, "ptr", pszDisplayName, pchEatenMarshal, pchEaten, "ptr*", ppmkOut, "HRESULT")
        return result
    }
}

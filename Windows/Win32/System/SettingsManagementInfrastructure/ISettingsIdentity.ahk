#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Identifies a namespace to open or use.
 * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nn-wcmconfig-isettingsidentity
 * @namespace Windows.Win32.System.SettingsManagementInfrastructure
 * @version v4.0.30319
 */
class ISettingsIdentity extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISettingsIdentity
     * @type {Guid}
     */
    static IID => Guid("{9f7d7bb6-20b3-11da-81a5-0030f1642e3c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAttribute", "SetAttribute", "GetFlags", "SetFlags"]

    /**
     * 
     * @param {Pointer<Void>} Reserved 
     * @param {PWSTR} Name 
     * @param {Pointer<BSTR>} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsidentity-getattribute
     */
    GetAttribute(Reserved, Name, Value) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(3, this, "ptr", Reserved, "ptr", Name, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Reserved 
     * @param {PWSTR} Name 
     * @param {PWSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsidentity-setattribute
     */
    SetAttribute(Reserved, Name, Value) {
        Name := Name is String ? StrPtr(Name) : Name
        Value := Value is String ? StrPtr(Value) : Value

        result := ComCall(4, this, "ptr", Reserved, "ptr", Name, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsidentity-getflags
     */
    GetFlags(Flags) {
        result := ComCall(5, this, "uint*", Flags, "HRESULT")
        return result
    }

    /**
     * Specifies how the recognizer interprets the ink and determines the result string.Call this function before processing the ink for the first time. Therefore, call the SetFlags function before calling the Process function.
     * @param {Integer} Flags 
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>HRESULT value</th>
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
     * The flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The recognizer does not support this function.
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
     * Unable to allocate memory to complete the operation.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The context is invalid or one of the parameters is an invalid pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//recapis/nf-recapis-setflags
     */
    SetFlags(Flags) {
        result := ComCall(6, this, "uint", Flags, "HRESULT")
        return result
    }
}

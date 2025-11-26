#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * Gets an identity attribute for a namespace identity.
     * @param {Pointer<Void>} Reserved Reserved. Must be <b>NULL</b>.
     * @param {PWSTR} Name The name of the attribute.
     * @returns {BSTR} The value of the attribute.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsidentity-getattribute
     */
    GetAttribute(Reserved, Name) {
        Name := Name is String ? StrPtr(Name) : Name

        ReservedMarshal := Reserved is VarRef ? "ptr" : "ptr"

        Value := BSTR()
        result := ComCall(3, this, ReservedMarshal, Reserved, "ptr", Name, "ptr", Value, "HRESULT")
        return Value
    }

    /**
     * Sets an identity attribute for a namespace identity.
     * @param {Pointer<Void>} Reserved Reserved. Must be <b>NULL</b>.
     * @param {PWSTR} Name The name of the attribute.
     * @param {PWSTR} Value The value of the attribute.
     * @returns {HRESULT} This method returns an HRESULT value. <b>S_OK</b> indicates success. It returns <b>WCM_E_ATTRIBUTENOTALLOWED</b> if the attribute specified by Name is not recognized.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsidentity-setattribute
     */
    SetAttribute(Reserved, Name, Value) {
        Name := Name is String ? StrPtr(Name) : Name
        Value := Value is String ? StrPtr(Value) : Value

        ReservedMarshal := Reserved is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, ReservedMarshal, Reserved, "ptr", Name, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * Returns the flags for a namespace identity.
     * @returns {Integer} The identity flags for the namespace identity.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsidentity-getflags
     */
    GetFlags() {
        result := ComCall(5, this, "uint*", &Flags := 0, "HRESULT")
        return Flags
    }

    /**
     * Sets the identity flags for a namespace identity.
     * @param {Integer} Flags The identity flags.
     * @returns {HRESULT} This method returns an HRESULT value. <b>S_OK</b> indicates success.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsidentity-setflags
     */
    SetFlags(Flags) {
        result := ComCall(6, this, "uint", Flags, "HRESULT")
        return result
    }
}

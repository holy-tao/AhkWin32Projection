#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Provides methods and properties used to manage a list of IDispatch interfaces that can be called by business rule (BizRule) scripts.
 * @see https://docs.microsoft.com/windows/win32/api//azroles/nn-azroles-iazbizruleinterfaces
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class IAzBizRuleInterfaces extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAzBizRuleInterfaces
     * @type {Guid}
     */
    static IID => Guid("{e94128c7-e9da-44cc-b0bd-53036f3aab3d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddInterface", "AddInterfaces", "GetInterfaceValue", "Remove", "RemoveAll", "get_Count"]

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * Adds the specified interface to the list of IDispatch interfaces that can be called by business rule (BizRule) scripts.
     * @param {BSTR} bstrInterfaceName A string that contains the name used by scripts to call the interface specified by the <i>varInterface</i> parameter.
     * @param {Integer} lInterfaceFlag Flags sent to the <a href="https://docs.microsoft.com/scripting/winscript/reference/iactivescript-addnameditem">AddNamedItem</a> method of the <a href="https://docs.microsoft.com/scripting/winscript/reference/iactivescript">IActiveScript</a> interface. The <b>AddNamedItem</b> always behaves as if the <b>SCRIPTITEM_ISVISIBLE</b> flag is set, and the <b>SCRIPTITEM_ISPERSISTENT</b> flag is not set.
     * @param {VARIANT} varInterface The ID of the interface to be added.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazbizruleinterfaces-addinterface
     */
    AddInterface(bstrInterfaceName, lInterfaceFlag, varInterface) {
        bstrInterfaceName := bstrInterfaceName is String ? BSTR.Alloc(bstrInterfaceName).Value : bstrInterfaceName

        result := ComCall(7, this, "ptr", bstrInterfaceName, "int", lInterfaceFlag, "ptr", varInterface, "HRESULT")
        return result
    }

    /**
     * Adds the specified interfaces to the list of IDispatch interfaces that can be called by business rule (BizRule) scripts.
     * @param {VARIANT} varInterfaceNames A <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> that specifies the names that scripts use to call the interfaces specified by the <i>varInterfaces</i> array.
     * @param {VARIANT} varInterfaceFlags A <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> that specifies flags sent to the <a href="https://docs.microsoft.com/scripting/winscript/reference/iactivescript-addnameditem">AddNamedItem</a> method of the <a href="https://docs.microsoft.com/scripting/winscript/reference/iactivescript">IActiveScript</a> interface. The <b>AddNamedItem</b> always behaves as if the <b>SCRIPTITEM_ISVISIBLE</b> flag is set, and the <b>SCRIPTITEM_ISPERSISTENT</b> flag is not set.
     * @param {VARIANT} varInterfaces A <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> that specifies the IDs of the interfaces to be added.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazbizruleinterfaces-addinterfaces
     */
    AddInterfaces(varInterfaceNames, varInterfaceFlags, varInterfaces) {
        result := ComCall(8, this, "ptr", varInterfaceNames, "ptr", varInterfaceFlags, "ptr", varInterfaces, "HRESULT")
        return result
    }

    /**
     * Gets the ID and flags of the interface that corresponds to the specified interface name.
     * @param {BSTR} bstrInterfaceName A string that contains the interface name.
     * @param {Pointer<Integer>} lInterfaceFlag A pointer to the flags associated with the interface name.
     * @param {Pointer<VARIANT>} varInterface A pointer to the ID associated with the interface name.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazbizruleinterfaces-getinterfacevalue
     */
    GetInterfaceValue(bstrInterfaceName, lInterfaceFlag, varInterface) {
        bstrInterfaceName := bstrInterfaceName is String ? BSTR.Alloc(bstrInterfaceName).Value : bstrInterfaceName

        lInterfaceFlagMarshal := lInterfaceFlag is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, "ptr", bstrInterfaceName, lInterfaceFlagMarshal, lInterfaceFlag, "ptr", varInterface, "HRESULT")
        return result
    }

    /**
     * Removes the specified interface from the list of interfaces The number of interfaces in the list of interfaces that can be called by BizRule scripts.
     * @param {BSTR} bstrInterfaceName The name of the interface to remove.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazbizruleinterfaces-remove
     */
    Remove(bstrInterfaceName) {
        bstrInterfaceName := bstrInterfaceName is String ? BSTR.Alloc(bstrInterfaceName).Value : bstrInterfaceName

        result := ComCall(10, this, "ptr", bstrInterfaceName, "HRESULT")
        return result
    }

    /**
     * Removes all interfaces from the list of interfaces that can be called by business rule (BizRule) scripts.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazbizruleinterfaces-removeall
     */
    RemoveAll() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * Specifies the number of interfaces that can be called by business rule (BizRule) scripts.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazbizruleinterfaces-get_count
     */
    get_Count() {
        result := ComCall(12, this, "uint*", &plCount := 0, "HRESULT")
        return plCount
    }
}

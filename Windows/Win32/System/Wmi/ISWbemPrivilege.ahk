#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk
#Include ..\..\Foundation\VARIANT_BOOL.ahk
#Include .\WbemPrivilegeEnum.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 */
class ISWbemPrivilege extends IDispatch {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISWbemPrivilege
     * @type {Guid}
     */
    static IID => Guid("{26ee67bd-5804-11d2-8b4a-00600806d9b6}")

    /**
     * The class identifier for SWbemPrivilege
     * @type {Guid}
     */
    static CLSID => Guid("{26ee67bc-5804-11d2-8b4a-00600806d9b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsEnabled", "put_IsEnabled", "get_Name", "get_DisplayName", "get_Identifier"]

    /**
     * @type {VARIANT_BOOL} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
        set => this.put_IsEnabled(value)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {BSTR} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * @type {WbemPrivilegeEnum} 
     */
    Identifier {
        get => this.get_Identifier()
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsEnabled() {
        result := ComCall(7, this, "short*", &bIsEnabled := 0, "HRESULT")
        return bIsEnabled
    }

    /**
     * 
     * @param {VARIANT_BOOL} bIsEnabled 
     * @returns {HRESULT} 
     */
    put_IsEnabled(bIsEnabled) {
        result := ComCall(8, this, "short", bIsEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        strDisplayName := BSTR({Value: 0}, True)
        result := ComCall(9, this, "ptr", strDisplayName, "HRESULT")
        return strDisplayName
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_DisplayName() {
        strDisplayName := BSTR({Value: 0}, True)
        result := ComCall(10, this, "ptr", strDisplayName, "HRESULT")
        return strDisplayName
    }

    /**
     * 
     * @returns {WbemPrivilegeEnum} 
     */
    get_Identifier() {
        result := ComCall(11, this, "int*", &iPrivilege := 0, "HRESULT")
        return iPrivilege
    }
}

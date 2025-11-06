#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWebWizardHost.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IWebWizardHost2 extends IWebWizardHost{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebWizardHost2
     * @type {Guid}
     */
    static IID => Guid("{f9c013dc-3c23-4041-8e39-cfb402f7ea59}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 16

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SignString"]

    /**
     * 
     * @param {BSTR} value 
     * @returns {BSTR} 
     */
    SignString(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        signedValue := BSTR()
        result := ComCall(16, this, "ptr", value, "ptr", signedValue, "HRESULT")
        return signedValue
    }
}

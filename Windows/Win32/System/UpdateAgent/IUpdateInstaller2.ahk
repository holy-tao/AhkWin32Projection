#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUpdateInstaller.ahk

/**
 * Installs or uninstalls updates on a computer.
 * @remarks
 * 
  * You can create an instance of this interface by using the UpdateInstaller coclass. Use the Microsoft.Update.Installer program identifier to create the object.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iupdateinstaller2
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IUpdateInstaller2 extends IUpdateInstaller{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdateInstaller2
     * @type {Guid}
     */
    static IID => Guid("{3442d4fe-224d-4cee-98cf-30e0c4d229e6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 28

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ForceQuiet", "put_ForceQuiet"]

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller2-get_forcequiet
     */
    get_ForceQuiet() {
        result := ComCall(28, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstaller2-put_forcequiet
     */
    put_ForceQuiet(value) {
        result := ComCall(29, this, "short", value, "HRESULT")
        return result
    }
}

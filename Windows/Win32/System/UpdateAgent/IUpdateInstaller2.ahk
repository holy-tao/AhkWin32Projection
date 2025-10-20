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
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     */
    get_ForceQuiet(retval) {
        result := ComCall(28, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     */
    put_ForceQuiet(value) {
        result := ComCall(29, this, "short", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

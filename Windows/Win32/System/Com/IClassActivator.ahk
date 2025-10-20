#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Specifies a method that retrieves a class object.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-iclassactivator
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IClassActivator extends IUnknown{
    /**
     * The interface identifier for IClassActivator
     * @type {Guid}
     */
    static IID => Guid("{00000140-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Integer} dwClassContext 
     * @param {Integer} locale 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    GetClassObject(rclsid, dwClassContext, locale, riid, ppv) {
        result := ComCall(3, this, "ptr", rclsid, "uint", dwClassContext, "uint", locale, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

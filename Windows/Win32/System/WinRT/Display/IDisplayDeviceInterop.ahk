#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Display
 * @version v4.0.30319
 */
class IDisplayDeviceInterop extends IUnknown{
    /**
     * The interface identifier for IDisplayDeviceInterop
     * @type {Guid}
     */
    static IID => Guid("{64338358-366a-471b-bd56-dd8ef48e439b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IInspectable>} pObject 
     * @param {Pointer<SECURITY_ATTRIBUTES>} pSecurityAttributes 
     * @param {Integer} Access 
     * @param {HSTRING} Name 
     * @param {Pointer<HANDLE>} pHandle 
     * @returns {HRESULT} 
     */
    CreateSharedHandle(pObject, pSecurityAttributes, Access, Name, pHandle) {
        Name := Name is Win32Handle ? NumGet(Name, "ptr") : Name

        result := ComCall(3, this, "ptr", pObject, "ptr", pSecurityAttributes, "uint", Access, "ptr", Name, "ptr", pHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HANDLE} NTHandle 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvObj 
     * @returns {HRESULT} 
     */
    OpenSharedHandle(NTHandle, riid, ppvObj) {
        NTHandle := NTHandle is Win32Handle ? NumGet(NTHandle, "ptr") : NTHandle

        result := ComCall(4, this, "ptr", NTHandle, "ptr", riid, "ptr", ppvObj, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

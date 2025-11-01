#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPPluginEnable interface is implemented by the plug-in. It sets and retrieves a value that represents whether the plug-in has been enabled by Windows Media Player.
 * @see https://docs.microsoft.com/windows/win32/api//wmpservices/nn-wmpservices-iwmppluginenable
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPPluginEnable extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPPluginEnable
     * @type {Guid}
     */
    static IID => Guid("{5fca444c-7ad1-479d-a4ef-40566a5309d6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetEnable", "GetEnable"]

    /**
     * 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmpservices/nf-wmpservices-iwmppluginenable-setenable
     */
    SetEnable(fEnable) {
        result := ComCall(3, this, "int", fEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfEnable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmpservices/nf-wmpservices-iwmppluginenable-getenable
     */
    GetEnable(pfEnable) {
        result := ComCall(4, this, "ptr", pfEnable, "HRESULT")
        return result
    }
}

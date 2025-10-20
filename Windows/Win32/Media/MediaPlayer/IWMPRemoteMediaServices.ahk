#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPRemoteMediaServices interface includes methods that provide services to Windows Media Player from a program that hosts the Player control. These methods are designed to be used with C++, and some methods can only be used with remoting.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpremotemediaservices
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPRemoteMediaServices extends IUnknown{
    /**
     * The interface identifier for IWMPRemoteMediaServices
     * @type {Guid}
     */
    static IID => Guid("{cbb92747-741f-44fe-ab5b-f1a48f3b2a59}")

    /**
     * The class identifier for WMPRemoteMediaServices
     * @type {Guid}
     */
    static CLSID => Guid("{df333473-2cf7-4be2-907f-9aad5661364f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BSTR>} pbstrType 
     * @returns {HRESULT} 
     */
    GetServiceType(pbstrType) {
        result := ComCall(3, this, "ptr", pbstrType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    GetApplicationName(pbstrName) {
        result := ComCall(4, this, "ptr", pbstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @param {Pointer<IDispatch>} ppDispatch 
     * @returns {HRESULT} 
     */
    GetScriptableObject(pbstrName, ppDispatch) {
        result := ComCall(5, this, "ptr", pbstrName, "ptr", ppDispatch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrFile 
     * @returns {HRESULT} 
     */
    GetCustomUIMode(pbstrFile) {
        result := ComCall(6, this, "ptr", pbstrFile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

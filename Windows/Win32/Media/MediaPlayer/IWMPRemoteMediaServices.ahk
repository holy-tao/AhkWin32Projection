#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPRemoteMediaServices interface includes methods that provide services to Windows Media Player from a program that hosts the Player control. These methods are designed to be used with C++, and some methods can only be used with remoting.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpremotemediaservices
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPRemoteMediaServices extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetServiceType", "GetApplicationName", "GetScriptableObject", "GetCustomUIMode"]

    /**
     * 
     * @param {Pointer<BSTR>} pbstrType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpremotemediaservices-getservicetype
     */
    GetServiceType(pbstrType) {
        result := ComCall(3, this, "ptr", pbstrType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpremotemediaservices-getapplicationname
     */
    GetApplicationName(pbstrName) {
        result := ComCall(4, this, "ptr", pbstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {IDispatch} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpremotemediaservices-getscriptableobject
     */
    GetScriptableObject(pbstrName) {
        result := ComCall(5, this, "ptr", pbstrName, "ptr*", &ppDispatch := 0, "HRESULT")
        return IDispatch(ppDispatch)
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrFile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpremotemediaservices-getcustomuimode
     */
    GetCustomUIMode(pbstrFile) {
        result := ComCall(6, this, "ptr", pbstrFile, "HRESULT")
        return result
    }
}

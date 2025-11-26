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
     * The GetServiceType method is called by Windows Media Player to determine whether a host program wants to run its embedded control remotely.
     * @param {Pointer<BSTR>} pbstrType 
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>The method succeeded.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpremotemediaservices-getservicetype
     */
    GetServiceType(pbstrType) {
        result := ComCall(3, this, "ptr", pbstrType, "HRESULT")
        return result
    }

    /**
     * The GetApplicationName method is called by Windows Media Player to retrieve the name of the program that is hosting the remoted control.
     * @param {Pointer<BSTR>} pbstrName Pointer to a <b>BSTR</b> containing the name of the host program.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>The method succeeded.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpremotemediaservices-getapplicationname
     */
    GetApplicationName(pbstrName) {
        result := ComCall(4, this, "ptr", pbstrName, "HRESULT")
        return result
    }

    /**
     * The GetScriptableObject method is called by Windows Media Player to retrieve a name and interface pointer for an object that can be called from the script code within a skin.
     * @param {Pointer<BSTR>} pbstrName Pointer to a <b>BSTR</b> containing the name of the scriptable object.
     * @returns {IDispatch} Pointer to a pointer to the <b>IDispatch</b> interface of the scriptable object.
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpremotemediaservices-getscriptableobject
     */
    GetScriptableObject(pbstrName) {
        result := ComCall(5, this, "ptr", pbstrName, "ptr*", &ppDispatch := 0, "HRESULT")
        return IDispatch(ppDispatch)
    }

    /**
     * The GetCustomUIMode method is called by Windows Media Player to retrieve the location of a skin file to apply to the Windows Media Player control.
     * @param {Pointer<BSTR>} pbstrFile Pointer to a <b>BSTR</b> containing the location of the skin file.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>The method succeeded.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpremotemediaservices-getcustomuimode
     */
    GetCustomUIMode(pbstrFile) {
        result := ComCall(6, this, "ptr", pbstrFile, "HRESULT")
        return result
    }
}

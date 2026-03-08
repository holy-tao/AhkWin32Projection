#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPRemoteMediaServices interface includes methods that provide services to Windows Media Player from a program that hosts the Player control. These methods are designed to be used with C++, and some methods can only be used with remoting.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpremotemediaservices
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
     * @remarks
     * You should avoid keeping a remoted instance of the Player running in the background during times when the control is not in use. Because the remoted Player control instance shares its playback engine with the full mode Player, keeping a background instance running can cause unexpected behavior. For example, the user might close the full mode Player while a file is playing. The user would expect that file playback would completely stop when the Player closes, but audio might continue to play because the playback engine is still active.
     * 
     * For Windows Media Player 10, the values for <i>pbstrType</i> may be used in combination by concatenating multiple values separated by spaces. For example, to use a remoted instance of Windows Media Player 10 that displays no dialog boxes and searches for digital media content, use "Remote NoDialogs FindFolders" as the value for <i>pbstrType</i>.
     * 
     * For Windows Media Player 11, an application that embeds the Player control remotely can specify an exclusive online store. In that case, the service selector is disabled and only the specified online store is available to the user. For more information, see Specifying an Exclusive Online Store in <a href="https://docs.microsoft.com/windows/desktop/WMP/remoting-the-windows-media-player-control">Remoting the Windows Media Player Control</a>.
     * 
     * NoDialogs, FindFolders, and Exclusive:<i>keyname</i> are valid only when combined with Remote. These values are not supported when combined with Local.
     * 
     * The RemoteNoDialogs value is supported for backward compatibility with Windows Media Player 9 Series. (See <a href="https://support.microsoft.com/?id=819756">Microsoft Knowledge Base Article - 819756</a> for more information.) For Windows Media Player 10, the recommended usage is "Remote NoDialogs".
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpremotemediaservices-getservicetype
     */
    GetServiceType(pbstrType) {
        result := ComCall(3, this, "ptr", pbstrType, "HRESULT")
        return result
    }

    /**
     * The GetApplicationName method is called by Windows Media Player to retrieve the name of the program that is hosting the remoted control.
     * @remarks
     * This method is used only when remoting the Windows Media Player control.
     * 
     * The full mode of Windows Media Player displays the program name on the <b>View</b> menu under <b>Switch to Other Program</b>.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpremotemediaservices-getapplicationname
     */
    GetApplicationName(pbstrName) {
        result := ComCall(4, this, "ptr", pbstrName, "HRESULT")
        return result
    }

    /**
     * The GetScriptableObject method is called by Windows Media Player to retrieve a name and interface pointer for an object that can be called from the script code within a skin.
     * @remarks
     * The user interface of an embedded control can be customized by using Windows Media Player skin technology. You must specify a skin file location by using the <b>IWMPRemoteMediaServices::GetCustomUIMode</b> method. Skins used in this way can communicate with the host of the control through a scriptable object retrieved automatically by Windows Media Player through the <b>IWMPRemoteMediaServices::GetScriptableObject</b> method.
     * 
     * The embedded Windows Media Player control does not have to be remoted to use this method.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @param {Pointer<BSTR>} pbstrName Pointer to a <b>BSTR</b> containing the name of the scriptable object.
     * @returns {IDispatch} Pointer to a pointer to the <b>IDispatch</b> interface of the scriptable object.
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpremotemediaservices-getscriptableobject
     */
    GetScriptableObject(pbstrName) {
        result := ComCall(5, this, "ptr", pbstrName, "ptr*", &ppDispatch := 0, "HRESULT")
        return IDispatch(ppDispatch)
    }

    /**
     * The GetCustomUIMode method is called by Windows Media Player to retrieve the location of a skin file to apply to the Windows Media Player control.
     * @remarks
     * This method allows you to customize the user interface of the embedded control by using Windows Media Player skin technology. Skins used in this way can communicate with the host of the control through a scriptable object retrieved automatically by Windows Media Player through the <b>IWMPRemoteMediaServices::GetScriptableObject</b> method.
     * 
     * To apply a skin file to the embedded control, you must call <b>IWMPPlayer.put_uiMode</b> with a value of "custom". Your implementation of <b>GetCustomUIMode</b> must also return a value of "file://" followed by the path and file name of a skin definition file located on the local computer.
     * 
     * The embedded Windows Media Player control does not have to be remoted to use this method.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpremotemediaservices-getcustomuimode
     */
    GetCustomUIMode(pbstrFile) {
        result := ComCall(6, this, "ptr", pbstrFile, "HRESULT")
        return result
    }
}

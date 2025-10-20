#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method which is called when the picture that represents a user account is changed.
 * @remarks
 * 
  * Applications that want to notify users through this interface can add their class identifier (CLSID) strings as values under this key: 
  * 
  * <pre xml:space="preserve"><b>HKEY_LOCAL_MACHINE</b>
  *    <b>SOFTWARE</b>
  *       <b>Microsoft</b>
  *          <b>Windows</b>
  *             <b>CurrentVersion</b>
  *                <b>UserPictureChange</b></pre>
  * 
  * 
  * The values under this key are enumerated to create this callback object.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-iuseraccountchangecallback
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IUserAccountChangeCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserAccountChangeCallback
     * @type {Guid}
     */
    static IID => Guid("{a561e69a-b4b8-4113-91a5-64c6bcca3430}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnPictureChange"]

    /**
     * 
     * @param {PWSTR} pszUserName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iuseraccountchangecallback-onpicturechange
     */
    OnPictureChange(pszUserName) {
        pszUserName := pszUserName is String ? StrPtr(pszUserName) : pszUserName

        result := ComCall(3, this, "ptr", pszUserName, "HRESULT")
        return result
    }
}

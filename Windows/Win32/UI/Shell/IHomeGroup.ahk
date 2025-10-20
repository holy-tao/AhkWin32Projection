#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that determine a computer's HomeGroup membership status and display the sharing wizard.
 * @remarks
 * 
  * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
  * Custom implementations of <b>IHomeGroup</b> are not supported; client applications use the implementation provided in Provsvc.dll.
  * 
  * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
  * Use <b>IHomeGroup</b> when there is a need to determine the local computer's HomeGroup membership status; that is, to check wither the local computer is a member of a HomeGroup.
  * 
  * 
  * 
  * To create an instance of <b>IHomeGroup</b>, call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> and specify <b>CLSID_HomeGroup</b> as the CLSID. <b>CLSID_HomeGroup</b> is defined in Shobjidl.h and Shobjidl.idl.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ihomegroup
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IHomeGroup extends IUnknown{
    /**
     * The interface identifier for IHomeGroup
     * @type {Guid}
     */
    static IID => Guid("{7a3bd1d9-35a9-4fb3-a467-f48cac35e2d0}")

    /**
     * The class identifier for HomeGroup
     * @type {Guid}
     */
    static CLSID => Guid("{de77ba04-3c92-4d11-a1a5-42352a53e0e3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BOOL>} member 
     * @returns {HRESULT} 
     */
    IsMember(member) {
        result := ComCall(3, this, "ptr", member, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} owner 
     * @param {Pointer<Int32>} sharingchoices 
     * @returns {HRESULT} 
     */
    ShowSharingWizard(owner, sharingchoices) {
        owner := owner is Win32Handle ? NumGet(owner, "ptr") : owner

        result := ComCall(4, this, "ptr", owner, "int*", sharingchoices, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

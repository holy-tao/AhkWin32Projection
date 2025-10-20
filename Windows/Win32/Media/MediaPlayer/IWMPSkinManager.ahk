#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPSkinManager interface provides a method used to synchronize the current skin with the current desktop theme in Microsoft Windows XP.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpskinmanager
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPSkinManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPSkinManager
     * @type {Guid}
     */
    static IID => Guid("{076f2fa6-ed30-448b-8cc5-3f3ef3529c7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetVisualStyle"]

    /**
     * 
     * @param {BSTR} bstrPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpskinmanager-setvisualstyle
     */
    SetVisualStyle(bstrPath) {
        bstrPath := bstrPath is String ? BSTR.Alloc(bstrPath).Value : bstrPath

        result := ComCall(3, this, "ptr", bstrPath, "HRESULT")
        return result
    }
}

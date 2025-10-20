#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class IFClipNotificationHelper extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFClipNotificationHelper
     * @type {Guid}
     */
    static IID => Guid("{3d5e3d21-bd41-4c2a-a669-b17ce87fb50b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ShowSystemDialog"]

    /**
     * 
     * @param {BSTR} titleText 
     * @param {BSTR} bodyText 
     * @returns {HRESULT} 
     */
    ShowSystemDialog(titleText, bodyText) {
        titleText := titleText is String ? BSTR.Alloc(titleText).Value : titleText
        bodyText := bodyText is String ? BSTR.Alloc(bodyText).Value : bodyText

        result := ComCall(3, this, "ptr", titleText, "ptr", bodyText, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class IClipServiceNotificationHelper extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IClipServiceNotificationHelper
     * @type {Guid}
     */
    static IID => Guid("{c39948f0-6142-44fd-98ca-e1681a8d68b5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ShowToast"]

    /**
     * 
     * @param {BSTR} titleText 
     * @param {BSTR} bodyText 
     * @param {BSTR} packageName 
     * @param {BSTR} appId 
     * @param {BSTR} launchCommand 
     * @returns {HRESULT} 
     */
    ShowToast(titleText, bodyText, packageName, appId, launchCommand) {
        titleText := titleText is String ? BSTR.Alloc(titleText).Value : titleText
        bodyText := bodyText is String ? BSTR.Alloc(bodyText).Value : bodyText
        packageName := packageName is String ? BSTR.Alloc(packageName).Value : packageName
        appId := appId is String ? BSTR.Alloc(appId).Value : appId
        launchCommand := launchCommand is String ? BSTR.Alloc(launchCommand).Value : launchCommand

        result := ComCall(3, this, "ptr", titleText, "ptr", bodyText, "ptr", packageName, "ptr", appId, "ptr", launchCommand, "HRESULT")
        return result
    }
}

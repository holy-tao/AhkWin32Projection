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
        if(titleText is String) {
            pin := BSTR.Alloc(titleText)
            titleText := pin.Value
        }
        if(bodyText is String) {
            pin := BSTR.Alloc(bodyText)
            bodyText := pin.Value
        }
        if(packageName is String) {
            pin := BSTR.Alloc(packageName)
            packageName := pin.Value
        }
        if(appId is String) {
            pin := BSTR.Alloc(appId)
            appId := pin.Value
        }
        if(launchCommand is String) {
            pin := BSTR.Alloc(launchCommand)
            launchCommand := pin.Value
        }

        result := ComCall(3, this, "ptr", titleText, "ptr", bodyText, "ptr", packageName, "ptr", appId, "ptr", launchCommand, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

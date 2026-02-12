#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\BadgeUpdater.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Data\Xml\Dom\XmlDocument.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class IBadgeUpdateManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBadgeUpdateManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{33400faa-6dd5-4105-aebc-9b50fca492da}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateBadgeUpdaterForApplication", "CreateBadgeUpdaterForApplicationWithId", "CreateBadgeUpdaterForSecondaryTile", "GetTemplateContent"]

    /**
     * 
     * @returns {BadgeUpdater} 
     */
    CreateBadgeUpdaterForApplication() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BadgeUpdater(result_)
    }

    /**
     * 
     * @param {HSTRING} applicationId 
     * @returns {BadgeUpdater} 
     */
    CreateBadgeUpdaterForApplicationWithId(applicationId) {
        if(applicationId is String) {
            pin := HSTRING.Create(applicationId)
            applicationId := pin.Value
        }
        applicationId := applicationId is Win32Handle ? NumGet(applicationId, "ptr") : applicationId

        result := ComCall(7, this, "ptr", applicationId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BadgeUpdater(result_)
    }

    /**
     * 
     * @param {HSTRING} tileId 
     * @returns {BadgeUpdater} 
     */
    CreateBadgeUpdaterForSecondaryTile(tileId) {
        if(tileId is String) {
            pin := HSTRING.Create(tileId)
            tileId := pin.Value
        }
        tileId := tileId is Win32Handle ? NumGet(tileId, "ptr") : tileId

        result := ComCall(8, this, "ptr", tileId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BadgeUpdater(result_)
    }

    /**
     * 
     * @param {Integer} type 
     * @returns {XmlDocument} 
     */
    GetTemplateContent(type) {
        result := ComCall(9, this, "int", type, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XmlDocument(result_)
    }
}

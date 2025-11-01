#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Configures the tracker property for the work that is done when calling either CoCreateActivity or CoEnterServiceDomain.
 * @remarks
 * 
  * The tracker property is a reporting mechanism used by monitoring code to watch which code is running when. It is the reporting mechanism behind the spinning balls in the Component Services administrative tool.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-iservicetrackerconfig
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IServiceTrackerConfig extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IServiceTrackerConfig
     * @type {Guid}
     */
    static IID => Guid("{6c3a3e1d-0ba6-4036-b76f-d0404db816c9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TrackerConfig"]

    /**
     * 
     * @param {Integer} trackerConfig 
     * @param {PWSTR} szTrackerAppName 
     * @param {PWSTR} szTrackerCtxName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicetrackerconfig-trackerconfig
     */
    TrackerConfig(trackerConfig, szTrackerAppName, szTrackerCtxName) {
        szTrackerAppName := szTrackerAppName is String ? StrPtr(szTrackerAppName) : szTrackerAppName
        szTrackerCtxName := szTrackerCtxName is String ? StrPtr(szTrackerCtxName) : szTrackerCtxName

        result := ComCall(3, this, "int", trackerConfig, "ptr", szTrackerAppName, "ptr", szTrackerCtxName, "HRESULT")
        return result
    }
}

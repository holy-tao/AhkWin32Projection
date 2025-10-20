#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IRemoteSystemAdditionalInfoProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteSystemAdditionalInfoProvider
     * @type {Guid}
     */
    static IID => Guid("{eeaa3d5f-ec63-4d27-af38-e86b1d7292cb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAdditionalInfo"]

    /**
     * 
     * @param {Pointer<HSTRING>} deduplicationId 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} mapView 
     * @returns {HRESULT} 
     */
    GetAdditionalInfo(deduplicationId, riid, mapView) {
        result := ComCall(3, this, "ptr", deduplicationId, "ptr", riid, "ptr*", mapView, "HRESULT")
        return result
    }
}

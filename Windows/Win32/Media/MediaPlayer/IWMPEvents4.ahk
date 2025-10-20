#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMPEvents3.ahk

/**
 * The IWMPEvents4 interface provides access to an event originating from the Windows Media Player 12 control so that an application that has this control embedded in it can respond to the event.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpevents4
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPEvents4 extends IWMPEvents3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPEvents4
     * @type {Guid}
     */
    static IID => Guid("{26dabcfa-306b-404d-9a6f-630a8405048d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 65

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DeviceEstimation"]

    /**
     * 
     * @param {IWMPSyncDevice} pDevice 
     * @param {HRESULT} hrResult 
     * @param {Integer} qwEstimatedUsedSpace 
     * @param {Integer} qwEstimatedSpace 
     * @returns {String} Nothing - always returns an empty string
     */
    DeviceEstimation(pDevice, hrResult, qwEstimatedUsedSpace, qwEstimatedSpace) {
        ComCall(65, this, "ptr", pDevice, "int", hrResult, "int64", qwEstimatedUsedSpace, "int64", qwEstimatedSpace)
    }
}

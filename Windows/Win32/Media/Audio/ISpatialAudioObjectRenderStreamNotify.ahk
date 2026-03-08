#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides notifications for spatial audio clients to respond to changes in the state of an ISpatialAudioObjectRenderStream.
 * @see https://learn.microsoft.com/windows/win32/api/spatialaudioclient/nn-spatialaudioclient-ispatialaudioobjectrenderstreamnotify
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class ISpatialAudioObjectRenderStreamNotify extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialAudioObjectRenderStreamNotify
     * @type {Guid}
     */
    static IID => Guid("{dddf83e6-68d7-4c70-883f-a1836afb4a50}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnAvailableDynamicObjectCountChange"]

    /**
     * Notifies the spatial audio client when the rendering capacity for an ISpatialAudioObjectRenderStream is about to change, specifies the time after which the change will occur, and specifies the number of dynamic audio objects that will be available after the change.
     * @remarks
     * A dynamic <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/nn-spatialaudioclient-ispatialaudioobject">ISpatialAudioObject</a> is one that was activated by setting the <i>type</i> parameter to the  <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstream-activatespatialaudioobject">ISpatialAudioObjectRenderStream::ActivateSpatialAudioObject</a> method to <b>AudioObjectType_Dynamic</b>. The client has a limit of the maximum number of dynamic spatial audio objects that can be activated at one time. When the capacity of the audio rendering pipeline changes, the system will dynamically adjust the maximum number of concurrent dynamic spatial audio objects. Before doing so, the system will call <b>OnAvailableDynamicObjectCountChange</b> to notify clients of the resource limit change. 
     * 
     * Call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on an <b>ISpatialAudioObject</b> when it is no longer being used to free up the resource to create new dynamic spatial audio objects.
     * @param {ISpatialAudioObjectRenderStreamBase} sender The spatial audio render stream for which the available dynamic object count is changing.
     * @param {Integer} hnsComplianceDeadlineTime The time after which the spatial resource limit will change, in 100-nanosecond units. A value of  0 means that the change will occur immediately.
     * @param {Integer} availableDynamicObjectCountChange The number of dynamic spatial audio objects that will be available to the stream after <i>hnsComplianceDeadlineTime</i>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstreamnotify-onavailabledynamicobjectcountchange
     */
    OnAvailableDynamicObjectCountChange(sender, hnsComplianceDeadlineTime, availableDynamicObjectCountChange) {
        result := ComCall(3, this, "ptr", sender, "int64", hnsComplianceDeadlineTime, "uint", availableDynamicObjectCountChange, "HRESULT")
        return result
    }
}

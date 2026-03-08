#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Implement this interface to receive notifications of the current write operation. (DDiscFormat2DataEvents)
 * @see https://learn.microsoft.com/windows/win32/api/imapi2/nn-imapi2-ddiscformat2dataevents
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class DDiscFormat2DataEvents extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for DDiscFormat2DataEvents
     * @type {Guid}
     */
    static IID => Guid("{2735413c-7f64-5b0f-8f00-5d77afbe261e}")

    /**
     * The class identifier for DDiscFormat2DataEvents
     * @type {Guid}
     */
    static CLSID => Guid("{2735413c-7f64-5b0f-8f00-5d77afbe261e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Update"]

    /**
     * Implement this method to receive progress notification of the current write operation. (DDiscFormat2DataEvents.Update)
     * @remarks
     * Notifications are sent in response to calling the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2data-write">IDiscFormat2Data::Write</a> method.
     * 
     * Notification is sent when the current action changes:
     * 
     * <ul>
     * <li>Once when initializing the hardware</li>
     * <li>Once when calibrating the power</li>
     * <li>Once when formatting the media, if required by the media type</li>
     * <li>Every 0.5 seconds during the write operation</li>
     * <li>Once after the operation completes</li>
     * </ul>
     * To stop the write process, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2data-cancelwrite">IDiscFormat2Data::CancelWrite</a> method.
     * @param {IDispatch} object_R 
     * @param {IDispatch} progress An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-idiscformat2dataeventargs">IDiscFormat2DataEventArgs</a> interface that you use to determine the progress of the write operation. 
     * 
     * This parameter is a <b>MsftDiscFormat2Data</b> object in script.
     * @returns {HRESULT} Return values are ignored.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-ddiscformat2dataevents-update
     */
    Update(object_R, progress) {
        result := ComCall(7, this, "ptr", object_R, "ptr", progress, "HRESULT")
        return result
    }
}

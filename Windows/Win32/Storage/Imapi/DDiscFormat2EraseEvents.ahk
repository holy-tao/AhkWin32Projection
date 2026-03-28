#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Implement this interface to receive notifications of the current erase operation.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2/nn-imapi2-ddiscformat2eraseevents
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class DDiscFormat2EraseEvents extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for DDiscFormat2EraseEvents
     * @type {Guid}
     */
    static IID => Guid("{2735413a-7f64-5b0f-8f00-5d77afbe261e}")

    /**
     * The class identifier for DDiscFormat2EraseEvents
     * @type {Guid}
     */
    static CLSID => Guid("{2735413a-7f64-5b0f-8f00-5d77afbe261e}")

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
     * Implement this method to receive progress notification of the current erase operation.
     * @remarks
     * Notifications are sent in response to calling the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2erase-erasemedia">IDiscFormat2Erase::EraseMedia</a> method. 
     * 
     * Notification is sent every 0.5 or 1.0 seconds depending on the method required to blank the media.
     * 
     * Total time estimates for a single erasure can vary as the operation progresses. The drive provides updated information that can affect the projected duration of the erasure.
     * @param {IDispatch} _object 
     * @param {Integer} elapsedSeconds Elapsed time, in seconds, of the erase operation.
     * @param {Integer} estimatedTotalSeconds Estimated time, in seconds, to complete the erase operation.
     * @returns {HRESULT} Return values are ignored.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-ddiscformat2eraseevents-update
     */
    Update(_object, elapsedSeconds, estimatedTotalSeconds) {
        result := ComCall(7, this, "ptr", _object, "int", elapsedSeconds, "int", estimatedTotalSeconds, "HRESULT")
        return result
    }
}

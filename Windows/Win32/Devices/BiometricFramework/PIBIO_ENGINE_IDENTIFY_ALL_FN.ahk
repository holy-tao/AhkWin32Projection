#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Determines the identities of any people who are currently in camera frame.
 * @remarks
 * The biometric service calls this method after it sends a new frame of data to the engine adapter.
 * 
 * After processing the data frame, this function should return one <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-presence">WINBIO_PRESENCE</a> element for each presence detected in the data frame.
 * 
 * In the event that the <b>EngineAdapterIdentifyAll</b> function can’t find any faces in frame, it returns an <b>HRESULT</b> of <b>S_OK</b> and sets the <i>PresenceCount</i> and <i>PresenceArray</i> return parameters to zero and <b>NULL</b>, respectively. In other words, a frame that doesn’t contain any human presences is not an error condition. 
 * 
 * The only time <b>EngineAdapterIdentifyAll</b> should return an <b>HRESULT</b> other than <b>S_OK</b> is if it doesn’t want the bio service to use the frame to update the Presence Monitor state. This should be a rare occurrence.
 * The engine adapter is responsible for allocating the array of <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-presence">WINBIO_PRESENCE</a> elements it returns in the <i>PresenceArray</i> parameter. It must allocate this memory from the process heap by using the <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapalloc">HeapAlloc</a> function. After the array is created, it becomes the property of the Windows Biometric Framework. Because the Framework deallocates this memory after using it, your engine adapter must not attempt to deallocate the array or save a pointer to it. Failure to follow this rule will lead to heap corruption and possible crashes of the biometric service.
 * 
 * 
 * The values of the individual <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-presence">WINBIO_PRESENCE</a> items in the <i>PresenceArray</i> will determine the events generated for client applications. See the discussion of the <b>WINBIO_PRESENCE</b> structure for details.
 * @see https://learn.microsoft.com/windows/win32/api//content/winbio_adapter/nc-winbio_adapter-pibio_engine_identify_all_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class PIBIO_ENGINE_IDENTIFY_ALL_FN extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<WINBIO_PIPELINE>} Pipeline 
     * @param {Pointer<Pointer>} PresenceCount 
     * @param {Pointer<Pointer<WINBIO_PRESENCE>>} PresenceArray 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Pipeline, PresenceCount, PresenceArray) {
        PresenceCountMarshal := PresenceCount is VarRef ? "ptr*" : "ptr"
        PresenceArrayMarshal := PresenceArray is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", Pipeline, PresenceCountMarshal, PresenceCount, PresenceArrayMarshal, PresenceArray, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

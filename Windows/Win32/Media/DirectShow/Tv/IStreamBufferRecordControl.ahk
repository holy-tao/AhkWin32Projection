#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IStreamBufferRecordControl interface is used to control stream buffer Recording objects.Use the IStreamBufferSink::CreateRecorder method on the Stream Buffer Sink filter to create new Recording objects.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IStreamBufferRecordControl)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//sbe/nn-sbe-istreambufferrecordcontrol
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IStreamBufferRecordControl extends IUnknown{
    /**
     * The interface identifier for IStreamBufferRecordControl
     * @type {Guid}
     */
    static IID => Guid("{ba9b6c99-f3c7-4ff2-92db-cfdd4851bf31}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int64>} prtStart 
     * @returns {HRESULT} 
     */
    Start(prtStart) {
        result := ComCall(3, this, "int64*", prtStart, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} rtStop 
     * @returns {HRESULT} 
     */
    Stop(rtStop) {
        result := ComCall(4, this, "int64", rtStop, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HRESULT>} phResult 
     * @param {Pointer<BOOL>} pbStarted 
     * @param {Pointer<BOOL>} pbStopped 
     * @returns {HRESULT} 
     */
    GetRecordingStatus(phResult, pbStarted, pbStopped) {
        result := ComCall(5, this, "ptr", phResult, "ptr", pbStarted, "ptr", pbStopped, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IMXReaderControl extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMXReaderControl
     * @type {Guid}
     */
    static IID => Guid("{808f4e35-8d5a-4fbe-8466-33a41279ed30}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["abort", "resume", "suspend"]

    /**
     * Submits an error message to the information queue and terminates the current draw or dispatch call being executed.
     * @remarks
     * This operation does nothing on rasterizers that do not support it.
     * @returns {HRESULT} None
     * 
     * 
     * 
     * This function does not return a value.
     * @see https://learn.microsoft.com/windows/win32/direct3dhlsl/abort
     */
    abort() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * The resume command continues playing or recording on a device that has been paused using the pause command.
     * @returns {HRESULT} <span id="lpszDeviceID"></span><span id="lpszdeviceid"></span><span id="LPSZDEVICEID"></span>*lpszDeviceID*
     * 
     * Identifier of an MCI device. This identifier or alias is assigned when the device is opened.
     * 
     * 
     * <span id="lpszFlags"></span><span id="lpszflags"></span><span id="LPSZFLAGS"></span>*lpszFlags*
     * 
     * Can be "wait", "notify", or both. For digital-video and VCR devices, "test" can also be specified. For more information about these flags, see [The Wait, Notify, and Test Flags](the-wait-notify-and-test-flags.md).
     * 
     * 
     * 
     * Returns zero if successful or an error otherwise.
     * @see https://learn.microsoft.com/windows/win32/Multimedia/resume
     */
    resume() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    suspend() {
        result := ComCall(9, this, "HRESULT")
        return result
    }
}

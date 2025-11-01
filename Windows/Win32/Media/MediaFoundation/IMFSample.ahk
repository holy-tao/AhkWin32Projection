#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFAttributes.ahk

/**
 * Represents a media sample, which is a container object for media data.
 * @remarks
 * 
  * To create a new media sample, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatesample">MFCreateSample</a>.
  * 
  * <div class="alert"><b>Note</b>  <p class="note">When you call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfattributes-copyallitems">CopyAllItems</a>, inherited from the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface, on an <b>IMFSample</b>, the sample time, duration, and flags are not copied to the destination sample. You must copy these values to the new sample manually.
  * 
  * </div>
  * <div> </div>
  * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
  * 
  * <ul>
  * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
  * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
  * </ul>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nn-mfobjects-imfsample
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSample extends IMFAttributes{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFSample
     * @type {Guid}
     */
    static IID => Guid("{c40a00f2-b93a-4d80-ae8c-5a1c634f58e4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 33

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSampleFlags", "SetSampleFlags", "GetSampleTime", "SetSampleTime", "GetSampleDuration", "SetSampleDuration", "GetBufferCount", "GetBufferByIndex", "ConvertToContiguousBuffer", "AddBuffer", "RemoveBufferByIndex", "RemoveAllBuffers", "GetTotalLength", "CopyToBuffer"]

    /**
     * 
     * @param {Pointer<Integer>} pdwSampleFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfsample-getsampleflags
     */
    GetSampleFlags(pdwSampleFlags) {
        result := ComCall(33, this, "uint*", pdwSampleFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSampleFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfsample-setsampleflags
     */
    SetSampleFlags(dwSampleFlags) {
        result := ComCall(34, this, "uint", dwSampleFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} phnsSampleTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfsample-getsampletime
     */
    GetSampleTime(phnsSampleTime) {
        result := ComCall(35, this, "int64*", phnsSampleTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} hnsSampleTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfsample-setsampletime
     */
    SetSampleTime(hnsSampleTime) {
        result := ComCall(36, this, "int64", hnsSampleTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} phnsSampleDuration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfsample-getsampleduration
     */
    GetSampleDuration(phnsSampleDuration) {
        result := ComCall(37, this, "int64*", phnsSampleDuration, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} hnsSampleDuration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfsample-setsampleduration
     */
    SetSampleDuration(hnsSampleDuration) {
        result := ComCall(38, this, "int64", hnsSampleDuration, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwBufferCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfsample-getbuffercount
     */
    GetBufferCount(pdwBufferCount) {
        result := ComCall(39, this, "uint*", pdwBufferCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<IMFMediaBuffer>} ppBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfsample-getbufferbyindex
     */
    GetBufferByIndex(dwIndex, ppBuffer) {
        result := ComCall(40, this, "uint", dwIndex, "ptr*", ppBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMFMediaBuffer>} ppBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfsample-converttocontiguousbuffer
     */
    ConvertToContiguousBuffer(ppBuffer) {
        result := ComCall(41, this, "ptr*", ppBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFMediaBuffer} pBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfsample-addbuffer
     */
    AddBuffer(pBuffer) {
        result := ComCall(42, this, "ptr", pBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfsample-removebufferbyindex
     */
    RemoveBufferByIndex(dwIndex) {
        result := ComCall(43, this, "uint", dwIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfsample-removeallbuffers
     */
    RemoveAllBuffers() {
        result := ComCall(44, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcbTotalLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfsample-gettotallength
     */
    GetTotalLength(pcbTotalLength) {
        result := ComCall(45, this, "uint*", pcbTotalLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFMediaBuffer} pBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfsample-copytobuffer
     */
    CopyToBuffer(pBuffer) {
        result := ComCall(46, this, "ptr", pBuffer, "HRESULT")
        return result
    }
}

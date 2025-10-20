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
     * 
     * @param {Pointer<UInt32>} pdwSampleFlags 
     * @returns {HRESULT} 
     */
    GetSampleFlags(pdwSampleFlags) {
        result := ComCall(33, this, "uint*", pdwSampleFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwSampleFlags 
     * @returns {HRESULT} 
     */
    SetSampleFlags(dwSampleFlags) {
        result := ComCall(34, this, "uint", dwSampleFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int64>} phnsSampleTime 
     * @returns {HRESULT} 
     */
    GetSampleTime(phnsSampleTime) {
        result := ComCall(35, this, "int64*", phnsSampleTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} hnsSampleTime 
     * @returns {HRESULT} 
     */
    SetSampleTime(hnsSampleTime) {
        result := ComCall(36, this, "int64", hnsSampleTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int64>} phnsSampleDuration 
     * @returns {HRESULT} 
     */
    GetSampleDuration(phnsSampleDuration) {
        result := ComCall(37, this, "int64*", phnsSampleDuration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} hnsSampleDuration 
     * @returns {HRESULT} 
     */
    SetSampleDuration(hnsSampleDuration) {
        result := ComCall(38, this, "int64", hnsSampleDuration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwBufferCount 
     * @returns {HRESULT} 
     */
    GetBufferCount(pdwBufferCount) {
        result := ComCall(39, this, "uint*", pdwBufferCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<IMFMediaBuffer>} ppBuffer 
     * @returns {HRESULT} 
     */
    GetBufferByIndex(dwIndex, ppBuffer) {
        result := ComCall(40, this, "uint", dwIndex, "ptr", ppBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFMediaBuffer>} ppBuffer 
     * @returns {HRESULT} 
     */
    ConvertToContiguousBuffer(ppBuffer) {
        result := ComCall(41, this, "ptr", ppBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFMediaBuffer>} pBuffer 
     * @returns {HRESULT} 
     */
    AddBuffer(pBuffer) {
        result := ComCall(42, this, "ptr", pBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @returns {HRESULT} 
     */
    RemoveBufferByIndex(dwIndex) {
        result := ComCall(43, this, "uint", dwIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveAllBuffers() {
        result := ComCall(44, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcbTotalLength 
     * @returns {HRESULT} 
     */
    GetTotalLength(pcbTotalLength) {
        result := ComCall(45, this, "uint*", pcbTotalLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFMediaBuffer>} pBuffer 
     * @returns {HRESULT} 
     */
    CopyToBuffer(pBuffer) {
        result := ComCall(46, this, "ptr", pBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

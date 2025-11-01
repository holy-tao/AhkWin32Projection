#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Gets the time stamp of the next video frame to be decoded.
 * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nn-wmcodecdsp-iwmcodecoutputtimestamp
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IWMCodecOutputTimestamp extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMCodecOutputTimestamp
     * @type {Guid}
     */
    static IID => Guid("{b72adf95-7adc-4a72-bc05-577d8ea6bf68}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNextOutputTime"]

    /**
     * 
     * @param {Pointer<Integer>} prtTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-iwmcodecoutputtimestamp-getnextoutputtime
     */
    GetNextOutputTime(prtTime) {
        result := ComCall(3, this, "int64*", prtTime, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents the data content of a timed-text object.
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nn-mfmediaengine-imftimedtextbinary
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFTimedTextBinary extends IUnknown{
    /**
     * The interface identifier for IMFTimedTextBinary
     * @type {Guid}
     */
    static IID => Guid("{4ae3a412-0545-43c4-bf6f-6b97a5c6c432}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Byte>} data 
     * @param {Pointer<UInt32>} length 
     * @returns {HRESULT} 
     */
    GetData(data, length) {
        result := ComCall(3, this, "char*", data, "uint*", length, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetData"]

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} data 
     * @param {Pointer<Integer>} length 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtextbinary-getdata
     */
    GetData(data, length) {
        dataMarshal := data is VarRef ? "ptr*" : "ptr"
        lengthMarshal := length is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, dataMarshal, data, lengthMarshal, length, "HRESULT")
        return result
    }
}

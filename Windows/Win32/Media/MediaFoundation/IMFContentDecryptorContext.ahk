#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Allows a decryptor to manage hardware keys and decrypt hardware samples.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfcontentdecryptorcontext
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFContentDecryptorContext extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFContentDecryptorContext
     * @type {Guid}
     */
    static IID => Guid("{7ec4b1bd-43fb-4763-85d2-64fcb5c5f4cb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeHardwareKey"]

    /**
     * 
     * @param {Integer} InputPrivateDataByteCount 
     * @param {Pointer<Void>} InputPrivateData 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcontentdecryptorcontext-initializehardwarekey
     */
    InitializeHardwareKey(InputPrivateDataByteCount, InputPrivateData) {
        InputPrivateDataMarshal := InputPrivateData is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "uint", InputPrivateDataByteCount, InputPrivateDataMarshal, InputPrivateData, "uint*", &OutputPrivateData := 0, "HRESULT")
        return OutputPrivateData
    }
}

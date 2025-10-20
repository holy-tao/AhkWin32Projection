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
     * 
     * @param {Integer} InputPrivateDataByteCount 
     * @param {Pointer<Void>} InputPrivateData 
     * @param {Pointer<UInt64>} OutputPrivateData 
     * @returns {HRESULT} 
     */
    InitializeHardwareKey(InputPrivateDataByteCount, InputPrivateData, OutputPrivateData) {
        result := ComCall(3, this, "uint", InputPrivateDataByteCount, "ptr", InputPrivateData, "uint*", OutputPrivateData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

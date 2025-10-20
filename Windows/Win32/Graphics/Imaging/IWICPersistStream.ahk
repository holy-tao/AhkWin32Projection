#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IPersistStream.ahk

/**
 * Exposes methods that provide additional load and save methods that take WICPersistOptions.
 * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nn-wincodecsdk-iwicpersiststream
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICPersistStream extends IPersistStream{
    /**
     * The interface identifier for IWICPersistStream
     * @type {Guid}
     */
    static IID => Guid("{00675040-6908-45f8-86a3-49c7dfd6d9ad}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * 
     * @param {Pointer<IStream>} pIStream 
     * @param {Pointer<Guid>} pguidPreferredVendor 
     * @param {Integer} dwPersistOptions 
     * @returns {HRESULT} 
     */
    LoadEx(pIStream, pguidPreferredVendor, dwPersistOptions) {
        result := ComCall(8, this, "ptr", pIStream, "ptr", pguidPreferredVendor, "uint", dwPersistOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} pIStream 
     * @param {Integer} dwPersistOptions 
     * @param {BOOL} fClearDirty 
     * @returns {HRESULT} 
     */
    SaveEx(pIStream, dwPersistOptions, fClearDirty) {
        result := ComCall(9, this, "ptr", pIStream, "uint", dwPersistOptions, "int", fClearDirty, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

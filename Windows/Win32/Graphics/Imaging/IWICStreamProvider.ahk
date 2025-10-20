#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods for a stream provider.
 * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nn-wincodecsdk-iwicstreamprovider
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICStreamProvider extends IUnknown{
    /**
     * The interface identifier for IWICStreamProvider
     * @type {Guid}
     */
    static IID => Guid("{449494bc-b468-4927-96d7-ba90d31ab505}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IStream>} ppIStream 
     * @returns {HRESULT} 
     */
    GetStream(ppIStream) {
        result := ComCall(3, this, "ptr", ppIStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwPersistOptions 
     * @returns {HRESULT} 
     */
    GetPersistOptions(pdwPersistOptions) {
        result := ComCall(4, this, "uint*", pdwPersistOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidPreferredVendor 
     * @returns {HRESULT} 
     */
    GetPreferredVendorGUID(pguidPreferredVendor) {
        result := ComCall(5, this, "ptr", pguidPreferredVendor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RefreshStream() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

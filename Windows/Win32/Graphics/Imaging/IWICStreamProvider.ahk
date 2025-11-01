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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStream", "GetPersistOptions", "GetPreferredVendorGUID", "RefreshStream"]

    /**
     * 
     * @param {Pointer<IStream>} ppIStream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicstreamprovider-getstream
     */
    GetStream(ppIStream) {
        result := ComCall(3, this, "ptr*", ppIStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwPersistOptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicstreamprovider-getpersistoptions
     */
    GetPersistOptions(pdwPersistOptions) {
        result := ComCall(4, this, "uint*", pdwPersistOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidPreferredVendor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicstreamprovider-getpreferredvendorguid
     */
    GetPreferredVendorGUID(pguidPreferredVendor) {
        result := ComCall(5, this, "ptr", pguidPreferredVendor, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicstreamprovider-refreshstream
     */
    RefreshStream() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}

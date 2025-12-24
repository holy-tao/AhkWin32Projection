#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IStream.ahk
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
     * Gets the stream held by the component.
     * @returns {IStream} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>**</b>
     * 
     * Pointer that receives a pointer to the stream held by the component.
     * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nf-wincodecsdk-iwicstreamprovider-getstream
     */
    GetStream() {
        result := ComCall(3, this, "ptr*", &ppIStream := 0, "HRESULT")
        return IStream(ppIStream)
    }

    /**
     * Gets the persist options used when initializing the component with a stream.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * Pointer that receives the persist options used when initializing the component with a stream. If none were provided, <b>WICPersistOptionDefault</b> is returned.
     * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nf-wincodecsdk-iwicstreamprovider-getpersistoptions
     */
    GetPersistOptions() {
        result := ComCall(4, this, "uint*", &pdwPersistOptions := 0, "HRESULT")
        return pdwPersistOptions
    }

    /**
     * Gets the preferred vendor GUID.
     * @returns {Guid} Type: <b>GUID*</b>
     * 
     * Pointer that receives the preferred vendor GUID.
     * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nf-wincodecsdk-iwicstreamprovider-getpreferredvendorguid
     */
    GetPreferredVendorGUID() {
        pguidPreferredVendor := Guid()
        result := ComCall(5, this, "ptr", pguidPreferredVendor, "HRESULT")
        return pguidPreferredVendor
    }

    /**
     * Informs the component that the content of the stream it's holding onto may have changed. The component should respond by dirtying any cached information from the stream.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nf-wincodecsdk-iwicstreamprovider-refreshstream
     */
    RefreshStream() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}

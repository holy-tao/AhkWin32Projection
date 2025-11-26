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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LoadEx", "SaveEx"]

    /**
     * Loads data from an input stream using the given parameters.
     * @param {IStream} pIStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * Pointer to the input stream.
     * @param {Pointer<Guid>} pguidPreferredVendor Type: <b>const GUID*</b>
     * 
     * Pointer to the GUID of the preferred vendor .
     * @param {Integer} dwPersistOptions Type: <b>DWORD</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/ne-wincodecsdk-wicpersistoptions">WICPersistOptions</a> used to load the stream.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nf-wincodecsdk-iwicpersiststream-loadex
     */
    LoadEx(pIStream, pguidPreferredVendor, dwPersistOptions) {
        result := ComCall(8, this, "ptr", pIStream, "ptr", pguidPreferredVendor, "uint", dwPersistOptions, "HRESULT")
        return result
    }

    /**
     * Saves the IWICPersistStream to the given input IStream using the given parameters.
     * @param {IStream} pIStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * The stream to save to.
     * @param {Integer} dwPersistOptions Type: <b>DWORD</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/ne-wincodecsdk-wicpersistoptions">WICPersistOptions</a>  to use when saving.
     * @param {BOOL} fClearDirty Type: <b>BOOL</b>
     * 
     * Indicates whether the "dirty" value will be cleared from all metadata after saving.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/nf-wincodecsdk-iwicpersiststream-saveex
     */
    SaveEx(pIStream, dwPersistOptions, fClearDirty) {
        result := ComCall(9, this, "ptr", pIStream, "uint", dwPersistOptions, "int", fClearDirty, "HRESULT")
        return result
    }
}

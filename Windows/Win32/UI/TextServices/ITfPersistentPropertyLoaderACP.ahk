#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IStream.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfPersistentPropertyLoaderACP interface is implemented by an application and used by the TSF manager to load properties asynchronously.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfpersistentpropertyloaderacp
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfPersistentPropertyLoaderACP extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfPersistentPropertyLoaderACP
     * @type {Guid}
     */
    static IID => Guid("{4ef89150-0807-11d3-8df0-00105a2799b5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LoadProperty"]

    /**
     * ITfPersistentPropertyLoaderACP::LoadProperty method
     * @param {Pointer<TF_PERSISTENT_PROPERTY_HEADER_ACP>} pHdr Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/msctf/ns-msctf-tf_persistent_property_header_acp">TF_PERSISTENT_PROPERTY_HEADER_ACP</a> structure that identifies the property to load. This structure contains the same data as the structure passed to <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itextstoreacpservices-unserialize">ITextStoreACPServices::Unserialize</a>.
     * @returns {IStream} Pointer to an <b>IStream</b> interface pointer that receives the stream object.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfpersistentpropertyloaderacp-loadproperty
     */
    LoadProperty(pHdr) {
        result := ComCall(3, this, "ptr", pHdr, "ptr*", &ppStream := 0, "HRESULT")
        return IStream(ppStream)
    }
}

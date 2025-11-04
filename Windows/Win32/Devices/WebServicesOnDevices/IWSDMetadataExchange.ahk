#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Is the base class for other objects which access metadata.
 * @see https://docs.microsoft.com/windows/win32/api//wsdclient/nn-wsdclient-iwsdmetadataexchange
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class IWSDMetadataExchange extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSDMetadataExchange
     * @type {Guid}
     */
    static IID => Guid("{06996d57-1d67-4928-9307-3d7833fdb846}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMetadata"]

    /**
     * 
     * @param {Pointer<Pointer<WSD_METADATA_SECTION_LIST>>} MetadataOut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdmetadataexchange-getmetadata
     */
    GetMetadata(MetadataOut) {
        MetadataOutMarshal := MetadataOut is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, MetadataOutMarshal, MetadataOut, "HRESULT")
        return result
    }
}

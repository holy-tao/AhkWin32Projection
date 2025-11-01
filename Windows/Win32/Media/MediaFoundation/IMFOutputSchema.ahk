#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFAttributes.ahk

/**
 * Encapsulates information about an output protection system and its corresponding configuration data.
 * @remarks
 * 
  * If the configuration information for the output protection system does not require more than a <b>DWORD</b> of space, the configuration information is retrieved in the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfoutputschema-getconfigurationdata">GetConfigurationData</a> method. If more than a <b>DWORD</b> of configuration information is needed, it is stored using the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfoutputschema
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFOutputSchema extends IMFAttributes{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFOutputSchema
     * @type {Guid}
     */
    static IID => Guid("{7be0fc5b-abd9-44fb-a5c8-f50136e71599}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 33

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSchemaType", "GetConfigurationData", "GetOriginatorID"]

    /**
     * 
     * @param {Pointer<Guid>} pguidSchemaType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfoutputschema-getschematype
     */
    GetSchemaType(pguidSchemaType) {
        result := ComCall(33, this, "ptr", pguidSchemaType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfoutputschema-getconfigurationdata
     */
    GetConfigurationData(pdwVal) {
        result := ComCall(34, this, "uint*", pdwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidOriginatorID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfoutputschema-getoriginatorid
     */
    GetOriginatorID(pguidOriginatorID) {
        result := ComCall(35, this, "ptr", pguidOriginatorID, "HRESULT")
        return result
    }
}

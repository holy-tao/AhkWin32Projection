#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFCollection.ahk
#Include .\IMFAttributes.ahk

/**
 * Encapsulates a usage policy from an input trust authority (ITA).
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfoutputpolicy
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFOutputPolicy extends IMFAttributes{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFOutputPolicy
     * @type {Guid}
     */
    static IID => Guid("{7f00f10a-daed-41af-ab26-5fdfa4dfba3c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 33

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GenerateRequiredSchemas", "GetOriginatorID", "GetMinimumGRLVersion"]

    /**
     * Retrieves a list of the output protection systems that the output trust authority (OTA) must enforce, along with configuration data for each protection system.
     * @param {Integer} dwAttributes Describes the output that is represented by the OTA calling this method. This value is a bitwise OR of zero or more of the following flags.
     *           
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFOUTPUTATTRIBUTE_BUS"></a><a id="mfoutputattribute_bus"></a><dl>
     * <dt><b>MFOUTPUTATTRIBUTE_BUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Hardware bus.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFOUTPUTATTRIBUTE_COMPRESSED"></a><a id="mfoutputattribute_compressed"></a><dl>
     * <dt><b>MFOUTPUTATTRIBUTE_COMPRESSED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The output sends compressed data. If this flag is absent, the output sends uncompressed data.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFOUTPUTATTRIBUTE_BUSIMPLEMENTATION"></a><a id="mfoutputattribute_busimplementation"></a><dl>
     * <dt><b>MFOUTPUTATTRIBUTE_BUSIMPLEMENTATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reserved. Do not use.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFOUTPUTATTRIBUTE_DIGITAL"></a><a id="mfoutputattribute_digital"></a><dl>
     * <dt><b>MFOUTPUTATTRIBUTE_DIGITAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The output sends a digital signal. If this flag is absent, the output sends an analog signal.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFOUTPUTATTRIBUTE_NONSTANDARDIMPLEMENTATION"></a><a id="mfoutputattribute_nonstandardimplementation"></a><dl>
     * <dt><b>MFOUTPUTATTRIBUTE_NONSTANDARDIMPLEMENTATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reserved. Do not use.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFOUTPUTATTRIBUTE_SOFTWARE"></a><a id="mfoutputattribute_software"></a><dl>
     * <dt><b>MFOUTPUTATTRIBUTE_SOFTWARE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reserved. Do not use.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFOUTPUTATTRIBUTE_VIDEO"></a><a id="mfoutputattribute_video"></a><dl>
     * <dt><b>MFOUTPUTATTRIBUTE_VIDEO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The output sends video data. If this flag is absent, the output sends audio data.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Guid} guidOutputSubType Indicates a specific family of output connectors that is represented by the OTA calling this method. Possible values include the following.
     *           
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFCONNECTOR_AGP"></a><a id="mfconnector_agp"></a><dl>
     * <dt><b>MFCONNECTOR_AGP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * AGP bus.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFCONNECTOR_COMPONENT"></a><a id="mfconnector_component"></a><dl>
     * <dt><b>MFCONNECTOR_COMPONENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Component video.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFCONNECTOR_COMPOSITE"></a><a id="mfconnector_composite"></a><dl>
     * <dt><b>MFCONNECTOR_COMPOSITE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Composite video.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFCONNECTOR_D_JPN"></a><a id="mfconnector_d_jpn"></a><dl>
     * <dt><b>MFCONNECTOR_D_JPN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Japanese D connector. (Connector conforming to the EIAJ RC-5237 standard.)
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFCONNECTOR_DISPLAYPORT_EMBEDDED"></a><a id="mfconnector_displayport_embedded"></a><dl>
     * <dt><b>MFCONNECTOR_DISPLAYPORT_EMBEDDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Embedded DisplayPort connector.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFCONNECTOR_DISPLAYPORT_EXTERNAL"></a><a id="mfconnector_displayport_external"></a><dl>
     * <dt><b>MFCONNECTOR_DISPLAYPORT_EXTERNAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * External DisplayPort connector.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFCONNECTOR_DVI"></a><a id="mfconnector_dvi"></a><dl>
     * <dt><b>MFCONNECTOR_DVI</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Digital video interface (DVI) connector.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFCONNECTOR_HDMI"></a><a id="mfconnector_hdmi"></a><dl>
     * <dt><b>MFCONNECTOR_HDMI</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * High-definition multimedia interface (HDMI) connector.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFCONNECTOR_LVDS"></a><a id="mfconnector_lvds"></a><dl>
     * <dt><b>MFCONNECTOR_LVDS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Low voltage differential signaling (LVDS) connector.
     * 
     * A connector using the LVDS interface to connect internally to a display device. The connection between the graphics adapter and the display device is permanent and not accessible to the user. Applications should not enable High-Bandwidth Digital Content Protection (HDCP) for this connector.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFCONNECTOR_PCI"></a><a id="mfconnector_pci"></a><dl>
     * <dt><b>MFCONNECTOR_PCI</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * PCI bus.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFCONNECTOR_PCI_Express"></a><a id="mfconnector_pci_express"></a><a id="MFCONNECTOR_PCI_EXPRESS"></a><dl>
     * <dt><b>MFCONNECTOR_PCI_Express</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * PCI Express bus.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFCONNECTOR_PCIX"></a><a id="mfconnector_pcix"></a><dl>
     * <dt><b>MFCONNECTOR_PCIX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * PCI-X bus.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFCONNECTOR_SDI"></a><a id="mfconnector_sdi"></a><dl>
     * <dt><b>MFCONNECTOR_SDI</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Audio data sent over a connector via S/PDIF.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFCONNECTOR_SPDIF"></a><a id="mfconnector_spdif"></a><dl>
     * <dt><b>MFCONNECTOR_SPDIF</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Serial digital interface connector.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFCONNECTOR_SVIDEO"></a><a id="mfconnector_svideo"></a><dl>
     * <dt><b>MFCONNECTOR_SVIDEO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * S-Video connector.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFCONNECTOR_UDI_EMBEDDED"></a><a id="mfconnector_udi_embedded"></a><dl>
     * <dt><b>MFCONNECTOR_UDI_EMBEDDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Embedded Unified Display Interface (UDI).
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFCONNECTOR_UDI_EXTERNAL"></a><a id="mfconnector_udi_external"></a><dl>
     * <dt><b>MFCONNECTOR_UDI_EXTERNAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * External UDI.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFCONNECTOR_UNKNOWN"></a><a id="mfconnector_unknown"></a><dl>
     * <dt><b>MFCONNECTOR_UNKNOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unknown connector type. See Remarks.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFCONNECTOR_VGA"></a><a id="mfconnector_vga"></a><dl>
     * <dt><b>MFCONNECTOR_VGA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * VGA connector.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="_MFCONNECTOR_MIRACAST"></a><a id="_mfconnector_miracast"></a><dl>
     * <dt><b> MFCONNECTOR_MIRACAST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Miracast wireless connector.
     *               
     * 
     * Supported in Windows 8.1 and later.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Guid>} rgGuidProtectionSchemasSupported Pointer to an array of GUID values that specify which output protection systems are supported by the OTA that is calling this method.
     * @param {Integer} cProtectionSchemasSupported Number of elements in the <i>rgGuidProtectionSchemasSupported</i> array.
     * @returns {IMFCollection} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfcollection">IMFCollection</a> interface of a collection object. The caller must release the interface. Each object in the collection is an <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfoutputschema">IMFOutputSchema</a> pointer. Each <b>IMFOutputSchema</b> pointer defines an output protection system that the OTA must enforce.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfoutputpolicy-generaterequiredschemas
     */
    GenerateRequiredSchemas(dwAttributes, guidOutputSubType, rgGuidProtectionSchemasSupported, cProtectionSchemasSupported) {
        result := ComCall(33, this, "uint", dwAttributes, "ptr", guidOutputSubType, "ptr", rgGuidProtectionSchemasSupported, "uint", cProtectionSchemasSupported, "ptr*", &ppRequiredProtectionSchemas := 0, "HRESULT")
        return IMFCollection(ppRequiredProtectionSchemas)
    }

    /**
     * Retrieives a GUID identifying the input trust authority (ITA) that created this output policy object.
     * @returns {Guid} Receives a GUID that identifies the originating ITA.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfoutputpolicy-getoriginatorid
     */
    GetOriginatorID() {
        pguidOriginatorID := Guid()
        result := ComCall(34, this, "ptr", pguidOriginatorID, "HRESULT")
        return pguidOriginatorID
    }

    /**
     * Retrieves the minimum version of the global revocation list (GRL) that must be enforced by the protected environment for this policy.
     * @returns {Integer} Receives the minimum GRL version.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfoutputpolicy-getminimumgrlversion
     */
    GetMinimumGRLVersion() {
        result := ComCall(35, this, "uint*", &pdwMinimumGRLVersion := 0, "HRESULT")
        return pdwMinimumGRLVersion
    }
}

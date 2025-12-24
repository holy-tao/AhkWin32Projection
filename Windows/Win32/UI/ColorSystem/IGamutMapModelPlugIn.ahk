#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\JChColorF.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Describes the methods that are defined for the IGamutMapModelPlugIn Component Object Model (COM) interface.
 * @see https://docs.microsoft.com/windows/win32/api//wcsplugin/nn-wcsplugin-igamutmapmodelplugin
 * @namespace Windows.Win32.UI.ColorSystem
 * @version v4.0.30319
 */
class IGamutMapModelPlugIn extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGamutMapModelPlugIn
     * @type {Guid}
     */
    static IID => Guid("{2dd80115-ad1e-41f6-a219-a4f4b583d1f9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "SourceToDestinationAppearanceColors"]

    /**
     * Initializes a gamut map model profile (GMMP) by using the specified source and destination gamut boundary descriptions and optional source and destination device model plug-ins.
     * @param {BSTR} bstrXml A string that contains the BSTR XML GMMP profile. This is little-endian Unicode XML, but without the leading bytes to tag it as such. Also, the encoding keyword in the XML may not reflect this format.
     * @param {IDeviceModelPlugIn} pSrcPlugIn A pointer to a source <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcsplugin/nn-wcsplugin-idevicemodelplugin">IDeviceModelPlugIn</a>. If <b>NULL</b>, it indicates the source device model profile is not a plug-in profile.
     * @param {IDeviceModelPlugIn} pDestPlugIn A pointer to a destination <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcsplugin/nn-wcsplugin-idevicemodelplugin">IDeviceModelPlugIn</a>. If <b>NULL</b>, it indicates the destination device model profile is not a plug-in profile.
     * @param {Pointer<GamutBoundaryDescription>} pSrcGBD A pointer to a source <a href="https://docs.microsoft.com/windows/desktop/api/wcsplugin/ns-wcsplugin-gamutboundarydescription">GamutBoundaryDescription</a>.
     * @param {Pointer<GamutBoundaryDescription>} pDestGBD A pointer to a destination <a href="https://docs.microsoft.com/windows/desktop/api/wcsplugin/ns-wcsplugin-gamutboundarydescription">GamutBoundaryDescription</a>.
     * @returns {HRESULT} If this function succeeds, the return value is S_OK.
     * 
     * If this function fails, the return value is E_FAIL.
     * @see https://docs.microsoft.com/windows/win32/api//wcsplugin/nf-wcsplugin-igamutmapmodelplugin-initialize
     */
    Initialize(bstrXml, pSrcPlugIn, pDestPlugIn, pSrcGBD, pDestGBD) {
        bstrXml := bstrXml is String ? BSTR.Alloc(bstrXml).Value : bstrXml

        result := ComCall(3, this, "ptr", bstrXml, "ptr", pSrcPlugIn, "ptr", pDestPlugIn, "ptr", pSrcGBD, "ptr", pDestGBD, "HRESULT")
        return result
    }

    /**
     * Returns the appropriate gamut-mapped appearance colors in response to the specified number of colors and the CIEJCh colors.
     * @param {Integer} cColors The number of colors in the <i>pXYZColors</i> and <i>pDeviceValues</i> arrays.
     * @param {Pointer<JChColorF>} pInputColors A pointer to the array of incoming colors to be gamut mapped.
     * @returns {JChColorF} A pointer to the array of outgoing colors.
     * @see https://docs.microsoft.com/windows/win32/api//wcsplugin/nf-wcsplugin-igamutmapmodelplugin-sourcetodestinationappearancecolors
     */
    SourceToDestinationAppearanceColors(cColors, pInputColors) {
        pOutputColors := JChColorF()
        result := ComCall(4, this, "uint", cColors, "ptr", pInputColors, "ptr", pOutputColors, "HRESULT")
        return pOutputColors
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\XYZColorF.ahk
#Include .\PrimaryXYZColors.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Describes the methods that are defined for the IDeviceModelPlugIn Component Object Model (COM) interface.
 * @see https://docs.microsoft.com/windows/win32/api//wcsplugin/nn-wcsplugin-idevicemodelplugin
 * @namespace Windows.Win32.UI.ColorSystem
 * @version v4.0.30319
 */
class IDeviceModelPlugIn extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDeviceModelPlugIn
     * @type {Guid}
     */
    static IID => Guid("{1cd63475-07c4-46fe-a903-d655316d11fd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetNumChannels", "DeviceToColorimetricColors", "ColorimetricToDeviceColors", "ColorimetricToDeviceColorsWithBlack", "SetTransformDeviceModelInfo", "GetPrimarySamples", "GetGamutBoundaryMeshSize", "GetGamutBoundaryMesh", "GetNeutralAxisSize", "GetNeutralAxis"]

    /**
     * Takes a pointer to a Stream that contains the whole device model plug-in as input, and initializes any internal parameters required by the plug-in.
     * @param {BSTR} bstrXml A string that contains the BSTR XML device model plug-in profile. This parameter stores data as little-endian Unicode XML; however, it may have no leading bytes to tag it as such. Also, the encoding keyword in the XML may not reflect that this is formatted as little-endian Unicode. Furthermore, due to the action of the MSXML engine, the BSTR XML file is processed and might not have exactly the same contents as the original XML file.
     * @param {Integer} cNumModels The number of total models in the transform sequence.
     * @param {Integer} iModelPosition The one-based model position of the other device model in the workflow of <i>uiNumModels</i> as provided in the <b>Initialize</b> function.
     * @returns {HRESULT} If this function succeeds, the return value is S_OK.
     * 
     * If this function fails, the return value is E_FAIL.
     * @see https://docs.microsoft.com/windows/win32/api//wcsplugin/nf-wcsplugin-idevicemodelplugin-initialize
     */
    Initialize(bstrXml, cNumModels, iModelPosition) {
        bstrXml := bstrXml is String ? BSTR.Alloc(bstrXml).Value : bstrXml

        result := ComCall(3, this, "ptr", bstrXml, "uint", cNumModels, "uint", iModelPosition, "HRESULT")
        return result
    }

    /**
     * Returns the number of device channels in the parameter pNumChannels.
     * @returns {Integer} A pointer to an unsigned integer representing the number of color channels for your device.
     * @see https://docs.microsoft.com/windows/win32/api//wcsplugin/nf-wcsplugin-idevicemodelplugin-getnumchannels
     */
    GetNumChannels() {
        result := ComCall(4, this, "uint*", &pNumChannels := 0, "HRESULT")
        return pNumChannels
    }

    /**
     * Returns the appropriate XYZ colors in response to the specified number of colors, channels, device colors and the proprietary plug-in algorithms.
     * @param {Integer} cColors The number of colors in the <i>pXYZColors</i> and <i>pDeviceValues</i> arrays.
     * @param {Integer} cChannels The number of color channels in the <i>pDeviceValues</i> arrays.
     * @param {Pointer<Float>} pDeviceValues A pointer to the array of outgoing XYZColors.
     * @returns {XYZColorF} A pointer to the array of incoming device colors to convert to XYZColors.
     * @see https://docs.microsoft.com/windows/win32/api//wcsplugin/nf-wcsplugin-idevicemodelplugin-devicetocolorimetriccolors
     */
    DeviceToColorimetricColors(cColors, cChannels, pDeviceValues) {
        pDeviceValuesMarshal := pDeviceValues is VarRef ? "float*" : "ptr"

        pXYZColors := XYZColorF()
        result := ComCall(5, this, "uint", cColors, "uint", cChannels, pDeviceValuesMarshal, pDeviceValues, "ptr", pXYZColors, "HRESULT")
        return pXYZColors
    }

    /**
     * Returns the appropriate XYZ colors in response to the specified number of colors, channels, device colors and the proprietary plug-in algorithms.
     * @param {Integer} cColors The number of colors in the <i>pXYZColors</i> and <i>pDeviceValues</i> arrays.
     * @param {Integer} cChannels The number of color channels in the <i>pDeviceValues</i> arrays.
     * @param {Pointer<XYZColorF>} pXYZColors The pointer to the array of incoming XYZColors to convert to device colors.
     * @returns {Float} The pointer to an array that contains the resulting outgoing device color values.
     * @see https://docs.microsoft.com/windows/win32/api//wcsplugin/nf-wcsplugin-idevicemodelplugin-colorimetrictodevicecolors
     */
    ColorimetricToDeviceColors(cColors, cChannels, pXYZColors) {
        result := ComCall(6, this, "uint", cColors, "uint", cChannels, "ptr", pXYZColors, "float*", &pDeviceValues := 0, "HRESULT")
        return pDeviceValues
    }

    /**
     * Returns the appropriate device colors in response to the incoming number of colors, channels, black information, Commission Internationale l'Eclairge XYZ (CIEXYZ) colors and the proprietary plug-in algorithms.
     * @param {Integer} cColors The number of colors in the <i>pXYZColors</i> and <i>pDeviceValues</i> arrays.
     * @param {Integer} cChannels The number of color channels in the <i>pDeviceValues</i> arrays.
     * @param {Pointer<XYZColorF>} pXYZColors A pointer to the array of outgoing <a href="https://docs.microsoft.com/windows/win32/api/wcsplugin/ns-wcsplugin-xyzcolorf">XYZColorF</a> structures.
     * @param {Pointer<BlackInformation>} pBlackInformation A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wcsplugin/ns-wcsplugin-blackinformation">BlackInformation</a>.
     * @returns {Float} A pointer to the array of incoming device colors that are to be converted to <a href="https://docs.microsoft.com/windows/win32/api/wcsplugin/ns-wcsplugin-xyzcolorf">XYZColorF</a> structures.
     * @see https://docs.microsoft.com/windows/win32/api//wcsplugin/nf-wcsplugin-idevicemodelplugin-colorimetrictodevicecolorswithblack
     */
    ColorimetricToDeviceColorsWithBlack(cColors, cChannels, pXYZColors, pBlackInformation) {
        result := ComCall(7, this, "uint", cColors, "uint", cChannels, "ptr", pXYZColors, "ptr", pBlackInformation, "float*", &pDeviceValues := 0, "HRESULT")
        return pDeviceValues
    }

    /**
     * Provides the plug-in with parameters to determine where in the transform sequence the specific plug-in occurs.
     * @param {Integer} iModelPosition The one-based model position of the other device model in the workflow of <i>uiNumModels</i>, as provided in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcsplugin/nf-wcsplugin-idevicemodelplugin-initialize">Initialize</a> function.
     * @param {IDeviceModelPlugIn} pIDeviceModelOther A pointer to a <b>IDeviceModelPlugIn</b> interface that contains the other device model in the transform sequence.
     * @returns {HRESULT} If this function succeeds, the return value is S_OK.
     * 
     * If this function fails, the return value is E_FAIL.
     * @see https://docs.microsoft.com/windows/win32/api//wcsplugin/nf-wcsplugin-idevicemodelplugin-settransformdevicemodelinfo
     */
    SetTransformDeviceModelInfo(iModelPosition, pIDeviceModelOther) {
        result := ComCall(8, this, "uint", iModelPosition, "ptr", pIDeviceModelOther, "HRESULT")
        return result
    }

    /**
     * Returns the measurement color for the primary sample.
     * @returns {PrimaryXYZColors} The primary color type, which is determined by using the hue circle order. If the plugin device model does not natively support primaries for red, yellow, green, cyan, blue, magenta, black and white, it must still return virtual primary data.
     * @see https://docs.microsoft.com/windows/win32/api//wcsplugin/nf-wcsplugin-idevicemodelplugin-getprimarysamples
     */
    GetPrimarySamples() {
        pPrimaryColor := PrimaryXYZColors()
        result := ComCall(9, this, "ptr", pPrimaryColor, "HRESULT")
        return pPrimaryColor
    }

    /**
     * Returns the required data structure sizes for the GetGamutBoundaryMesh function.
     * @param {Pointer<Integer>} pNumVertices The required number of vertices.
     * @param {Pointer<Integer>} pNumTriangles The required number of triangles.
     * @returns {HRESULT} If this function succeeds, the return value is S_OK.
     * 
     * If the plug-in device model wants WCS to compute its gamut boundary mesh, the return value is S_FALSE.
     * 
     * If this function fails, the return value is E_FAIL.
     * @see https://docs.microsoft.com/windows/win32/api//wcsplugin/nf-wcsplugin-idevicemodelplugin-getgamutboundarymeshsize
     */
    GetGamutBoundaryMeshSize(pNumVertices, pNumTriangles) {
        pNumVerticesMarshal := pNumVertices is VarRef ? "uint*" : "ptr"
        pNumTrianglesMarshal := pNumTriangles is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, pNumVerticesMarshal, pNumVertices, pNumTrianglesMarshal, pNumTriangles, "HRESULT")
        return result
    }

    /**
     * Returns the triangular mesh from the plug-in. This function is used to compute the GamutBoundaryDescription.
     * @param {Integer} cChannels The number of channels.
     * @param {Integer} cVertices The number of vertices.
     * @param {Integer} cTriangles The number of triangles.
     * @param {Pointer<Float>} pVertices A pointer to the array of vertices in the plug-in model gamut shell.
     * @param {Pointer<GamutShellTriangle>} pTriangles A pointer to the array of triangles in the plug-in model gamut shell.
     * @returns {HRESULT} If this function succeeds, the return value is S_OK.
     * 
     * If this function fails, the return value is E_FAIL.
     * @see https://docs.microsoft.com/windows/win32/api//wcsplugin/nf-wcsplugin-idevicemodelplugin-getgamutboundarymesh
     */
    GetGamutBoundaryMesh(cChannels, cVertices, cTriangles, pVertices, pTriangles) {
        pVerticesMarshal := pVertices is VarRef ? "float*" : "ptr"

        result := ComCall(11, this, "uint", cChannels, "uint", cVertices, "uint", cTriangles, pVerticesMarshal, pVertices, "ptr", pTriangles, "HRESULT")
        return result
    }

    /**
     * The IDeviceModelPlugIn::GetNeutralAxisSize function returns the number of data points along the neutral axis that are returned by the GetNeutralAxis function.
     * @returns {Integer} The number of points that will be returned by a call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcsplugin/nf-wcsplugin-idevicemodelplugin-getneutralaxis">GetNeutralAxis</a>. Minimum is 2 (black and white).
     * @see https://docs.microsoft.com/windows/win32/api//wcsplugin/nf-wcsplugin-idevicemodelplugin-getneutralaxissize
     */
    GetNeutralAxisSize() {
        result := ComCall(12, this, "uint*", &pcColors := 0, "HRESULT")
        return pcColors
    }

    /**
     * The IDeviceModelPlugIn::GetNeutralAxis return the XYZ colorimetry of sample points along the device's neutral axis.
     * @param {Integer} cColors The number of points that are returned.
     * @returns {XYZColorF} A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wcsplugin/ns-wcsplugin-xyzcolorf">XYZColorF</a> structures.
     * @see https://docs.microsoft.com/windows/win32/api//wcsplugin/nf-wcsplugin-idevicemodelplugin-getneutralaxis
     */
    GetNeutralAxis(cColors) {
        pXYZColors := XYZColorF()
        result := ComCall(13, this, "uint", cColors, "ptr", pXYZColors, "HRESULT")
        return pXYZColors
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\GamutShellTriangle.ahk" { GamutShellTriangle }
#Import ".\BlackInformation.ahk" { BlackInformation }
#Import ".\XYZColorF.ahk" { XYZColorF }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\PrimaryXYZColors.ahk" { PrimaryXYZColors }

/**
 * Describes the methods that are defined for the IDeviceModelPlugIn Component Object Model (COM) interface.
 * @see https://learn.microsoft.com/windows/win32/api/wcsplugin/nn-wcsplugin-idevicemodelplugin
 * @namespace Windows.Win32.UI.ColorSystem
 */
export default struct IDeviceModelPlugIn extends IUnknown {
    /**
     * The interface identifier for IDeviceModelPlugIn
     * @type {Guid}
     */
    static IID := Guid("{1cd63475-07c4-46fe-a903-d655316d11fd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDeviceModelPlugIn interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize                          : IntPtr
        GetNumChannels                      : IntPtr
        DeviceToColorimetricColors          : IntPtr
        ColorimetricToDeviceColors          : IntPtr
        ColorimetricToDeviceColorsWithBlack : IntPtr
        SetTransformDeviceModelInfo         : IntPtr
        GetPrimarySamples                   : IntPtr
        GetGamutBoundaryMeshSize            : IntPtr
        GetGamutBoundaryMesh                : IntPtr
        GetNeutralAxisSize                  : IntPtr
        GetNeutralAxis                      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDeviceModelPlugIn.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Takes a pointer to a Stream that contains the whole device model plug-in as input, and initializes any internal parameters required by the plug-in.
     * @remarks
     * If this function is called more than once, subsequent calls release any allocated memory and reinitialize according to the new <i>bstrXml</i> parameter.
     * @param {BSTR} bstrXml A string that contains the BSTR XML device model plug-in profile. This parameter stores data as little-endian Unicode XML; however, it may have no leading bytes to tag it as such. Also, the encoding keyword in the XML may not reflect that this is formatted as little-endian Unicode. Furthermore, due to the action of the MSXML engine, the BSTR XML file is processed and might not have exactly the same contents as the original XML file.
     * @param {Integer} cNumModels The number of total models in the transform sequence.
     * @param {Integer} iModelPosition The one-based model position of the other device model in the workflow of <i>uiNumModels</i> as provided in the <b>Initialize</b> function.
     * @returns {HRESULT} If this function succeeds, the return value is S_OK.
     * 
     * If this function fails, the return value is E_FAIL.
     * @see https://learn.microsoft.com/windows/win32/api/wcsplugin/nf-wcsplugin-idevicemodelplugin-initialize
     */
    Initialize(bstrXml, cNumModels, iModelPosition) {
        bstrXml := bstrXml is String ? BSTR.Alloc(bstrXml).Value : bstrXml

        result := ComCall(3, this, BSTR, bstrXml, "uint", cNumModels, "uint", iModelPosition, "HRESULT")
        return result
    }

    /**
     * Returns the number of device channels in the parameter pNumChannels.
     * @returns {Integer} A pointer to an unsigned integer representing the number of color channels for your device.
     * @see https://learn.microsoft.com/windows/win32/api/wcsplugin/nf-wcsplugin-idevicemodelplugin-getnumchannels
     */
    GetNumChannels() {
        result := ComCall(4, this, "uint*", &pNumChannels := 0, "HRESULT")
        return pNumChannels
    }

    /**
     * Returns the appropriate XYZ colors in response to the specified number of colors, channels, device colors and the proprietary plug-in algorithms. (IDeviceModelPlugIn.DeviceToColorimetricColors)
     * @remarks
     * If <i>cColors</i> or <i>cChannels</i> is zero, the return value is E_FAIL.
     * @param {Integer} cColors The number of colors in the <i>pXYZColors</i> and <i>pDeviceValues</i> arrays.
     * @param {Integer} cChannels The number of color channels in the <i>pDeviceValues</i> arrays.
     * @param {Pointer<Float>} pDeviceValues A pointer to the array of outgoing XYZColors.
     * @returns {XYZColorF} A pointer to the array of incoming device colors to convert to XYZColors.
     * @see https://learn.microsoft.com/windows/win32/api/wcsplugin/nf-wcsplugin-idevicemodelplugin-devicetocolorimetriccolors
     */
    DeviceToColorimetricColors(cColors, cChannels, pDeviceValues) {
        pDeviceValuesMarshal := pDeviceValues is VarRef ? "float*" : "ptr"

        pXYZColors := XYZColorF()
        result := ComCall(5, this, "uint", cColors, "uint", cChannels, pDeviceValuesMarshal, pDeviceValues, XYZColorF.Ptr, pXYZColors, "HRESULT")
        return pXYZColors
    }

    /**
     * Returns the appropriate XYZ colors in response to the specified number of colors, channels, device colors and the proprietary plug-in algorithms. (IDeviceModelPlugIn.ColorimetricToDeviceColors)
     * @remarks
     * If <i>cColors</i> or <i>cChannels</i> is zero, the return value is E_FAIL. If there are invalid or out of gamut colors (which may occur if there has been prior processing of the gamut map model), then the return value is E_FAIL.
     * @param {Integer} cColors The number of colors in the <i>pXYZColors</i> and <i>pDeviceValues</i> arrays.
     * @param {Integer} cChannels The number of color channels in the <i>pDeviceValues</i> arrays.
     * @param {Pointer<XYZColorF>} pXYZColors The pointer to the array of incoming XYZColors to convert to device colors.
     * @returns {Float} The pointer to an array that contains the resulting outgoing device color values.
     * @see https://learn.microsoft.com/windows/win32/api/wcsplugin/nf-wcsplugin-idevicemodelplugin-colorimetrictodevicecolors
     */
    ColorimetricToDeviceColors(cColors, cChannels, pXYZColors) {
        result := ComCall(6, this, "uint", cColors, "uint", cChannels, XYZColorF.Ptr, pXYZColors, "float*", &pDeviceValues := 0, "HRESULT")
        return pDeviceValues
    }

    /**
     * Returns the appropriate device colors in response to the incoming number of colors, channels, black information, Commission Internationale l'Eclairge XYZ (CIEXYZ) colors and the proprietary plug-in algorithms.
     * @remarks
     * If <i>cColors</i> or <i>cChannels</i> is zero, the return value is E_FAIL.
     * @param {Integer} cColors The number of colors in the <i>pXYZColors</i> and <i>pDeviceValues</i> arrays.
     * @param {Integer} cChannels The number of color channels in the <i>pDeviceValues</i> arrays.
     * @param {Pointer<XYZColorF>} pXYZColors A pointer to the array of outgoing <a href="https://docs.microsoft.com/windows/win32/api/wcsplugin/ns-wcsplugin-xyzcolorf">XYZColorF</a> structures.
     * @param {Pointer<BlackInformation>} pBlackInformation A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wcsplugin/ns-wcsplugin-blackinformation">BlackInformation</a>.
     * @returns {Float} A pointer to the array of incoming device colors that are to be converted to <a href="https://docs.microsoft.com/windows/win32/api/wcsplugin/ns-wcsplugin-xyzcolorf">XYZColorF</a> structures.
     * @see https://learn.microsoft.com/windows/win32/api/wcsplugin/nf-wcsplugin-idevicemodelplugin-colorimetrictodevicecolorswithblack
     */
    ColorimetricToDeviceColorsWithBlack(cColors, cChannels, pXYZColors, pBlackInformation) {
        result := ComCall(7, this, "uint", cColors, "uint", cChannels, XYZColorF.Ptr, pXYZColors, BlackInformation.Ptr, pBlackInformation, "float*", &pDeviceValues := 0, "HRESULT")
        return pDeviceValues
    }

    /**
     * Provides the plug-in with parameters to determine where in the transform sequence the specific plug-in occurs.
     * @remarks
     * This function is called by the [CreateMultiProfileTransform](/windows/win32/api/icm/nf-icm-createmultiprofiletransform) function, which is responsible for calling <b>AddRef</b> and <b>Release</b> as appropriate. The function enables plug-in device models to exchange information in a proprietary manner by accessing proprietary plug-in interface functions.
     * 
     * This function will fail if the other device model is a baseline device model, because such models are not plugins and thus inter-plugin communication is not supported.
     * @param {Integer} iModelPosition The one-based model position of the other device model in the workflow of <i>uiNumModels</i>, as provided in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcsplugin/nf-wcsplugin-idevicemodelplugin-initialize">Initialize</a> function.
     * @param {IDeviceModelPlugIn} pIDeviceModelOther A pointer to a <b>IDeviceModelPlugIn</b> interface that contains the other device model in the transform sequence.
     * @returns {HRESULT} If this function succeeds, the return value is S_OK.
     * 
     * If this function fails, the return value is E_FAIL.
     * @see https://learn.microsoft.com/windows/win32/api/wcsplugin/nf-wcsplugin-idevicemodelplugin-settransformdevicemodelinfo
     */
    SetTransformDeviceModelInfo(iModelPosition, pIDeviceModelOther) {
        result := ComCall(8, this, "uint", iModelPosition, "ptr", pIDeviceModelOther, "HRESULT")
        return result
    }

    /**
     * Returns the measurement color for the primary sample.
     * @returns {PrimaryXYZColors} The primary color type, which is determined by using the hue circle order. If the plugin device model does not natively support primaries for red, yellow, green, cyan, blue, magenta, black and white, it must still return virtual primary data.
     * @see https://learn.microsoft.com/windows/win32/api/wcsplugin/nf-wcsplugin-idevicemodelplugin-getprimarysamples
     */
    GetPrimarySamples() {
        pPrimaryColor := PrimaryXYZColors()
        result := ComCall(9, this, PrimaryXYZColors.Ptr, pPrimaryColor, "HRESULT")
        return pPrimaryColor
    }

    /**
     * Returns the required data structure sizes for the GetGamutBoundaryMesh function.
     * @remarks
     * This function is called by the [CreateMultiProfileTransform](/windows/win32/api/icm/nf-icm-createmultiprofiletransform) function.
     * @param {Pointer<Integer>} pNumVertices The required number of vertices.
     * @param {Pointer<Integer>} pNumTriangles The required number of triangles.
     * @returns {HRESULT} If this function succeeds, the return value is S_OK.
     * 
     * If the plug-in device model wants WCS to compute its gamut boundary mesh, the return value is S_FALSE.
     * 
     * If this function fails, the return value is E_FAIL.
     * @see https://learn.microsoft.com/windows/win32/api/wcsplugin/nf-wcsplugin-idevicemodelplugin-getgamutboundarymeshsize
     */
    GetGamutBoundaryMeshSize(pNumVertices, pNumTriangles) {
        pNumVerticesMarshal := pNumVertices is VarRef ? "uint*" : "ptr"
        pNumTrianglesMarshal := pNumTriangles is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, pNumVerticesMarshal, pNumVertices, pNumTrianglesMarshal, pNumTriangles, "HRESULT")
        return result
    }

    /**
     * Returns the triangular mesh from the plug-in. This function is used to compute the GamutBoundaryDescription.
     * @remarks
     * This function is called by the [CreateMultiProfileTransform](/windows/win32/api/icm/nf-icm-createmultiprofiletransform) function.
     * @param {Integer} cChannels The number of channels.
     * @param {Integer} cVertices The number of vertices.
     * @param {Integer} cTriangles The number of triangles.
     * @param {Pointer<Float>} pVertices A pointer to the array of vertices in the plug-in model gamut shell.
     * @param {Pointer<GamutShellTriangle>} pTriangles A pointer to the array of triangles in the plug-in model gamut shell.
     * @returns {HRESULT} If this function succeeds, the return value is S_OK.
     * 
     * If this function fails, the return value is E_FAIL.
     * @see https://learn.microsoft.com/windows/win32/api/wcsplugin/nf-wcsplugin-idevicemodelplugin-getgamutboundarymesh
     */
    GetGamutBoundaryMesh(cChannels, cVertices, cTriangles, pVertices, pTriangles) {
        pVerticesMarshal := pVertices is VarRef ? "float*" : "ptr"

        result := ComCall(11, this, "uint", cChannels, "uint", cVertices, "uint", cTriangles, pVerticesMarshal, pVertices, GamutShellTriangle.Ptr, pTriangles, "HRESULT")
        return result
    }

    /**
     * The IDeviceModelPlugIn::GetNeutralAxisSize function returns the number of data points along the neutral axis that are returned by the GetNeutralAxis function.
     * @returns {Integer} The number of points that will be returned by a call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcsplugin/nf-wcsplugin-idevicemodelplugin-getneutralaxis">GetNeutralAxis</a>. Minimum is 2 (black and white).
     * @see https://learn.microsoft.com/windows/win32/api/wcsplugin/nf-wcsplugin-idevicemodelplugin-getneutralaxissize
     */
    GetNeutralAxisSize() {
        result := ComCall(12, this, "uint*", &pcColors := 0, "HRESULT")
        return pcColors
    }

    /**
     * The IDeviceModelPlugIn::GetNeutralAxis return the XYZ colorimetry of sample points along the device's neutral axis.
     * @remarks
     * You should define "neutral axis" in a way that is appropriate for your device. Usually, it is points made by the device's gray values. This might be R=G=B, or C=M=Y=0 and any value of K. For some devices, the most pleasing gray may be one that uses a different combination of colorants, such as M=Y=0 and C=K. The plug-in is responsible for determining the colorimetry of a sampling of the neutral axis values and returning them. The sampling may be as sparse as two points (white and black) or as dense as desired.
     * 
     * There is no requirement that the samples be uniformly spaced in any color space.
     * @param {Integer} cColors The number of points that are returned.
     * @returns {XYZColorF} A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wcsplugin/ns-wcsplugin-xyzcolorf">XYZColorF</a> structures.
     * @see https://learn.microsoft.com/windows/win32/api/wcsplugin/nf-wcsplugin-idevicemodelplugin-getneutralaxis
     */
    GetNeutralAxis(cColors) {
        pXYZColors := XYZColorF()
        result := ComCall(13, this, "uint", cColors, XYZColorF.Ptr, pXYZColors, "HRESULT")
        return pXYZColors
    }

    Query(iid) {
        if (IDeviceModelPlugIn.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 4)
        this.vtbl.GetNumChannels := CallbackCreate(GetMethod(implObj, "GetNumChannels"), flags, 2)
        this.vtbl.DeviceToColorimetricColors := CallbackCreate(GetMethod(implObj, "DeviceToColorimetricColors"), flags, 5)
        this.vtbl.ColorimetricToDeviceColors := CallbackCreate(GetMethod(implObj, "ColorimetricToDeviceColors"), flags, 5)
        this.vtbl.ColorimetricToDeviceColorsWithBlack := CallbackCreate(GetMethod(implObj, "ColorimetricToDeviceColorsWithBlack"), flags, 6)
        this.vtbl.SetTransformDeviceModelInfo := CallbackCreate(GetMethod(implObj, "SetTransformDeviceModelInfo"), flags, 3)
        this.vtbl.GetPrimarySamples := CallbackCreate(GetMethod(implObj, "GetPrimarySamples"), flags, 2)
        this.vtbl.GetGamutBoundaryMeshSize := CallbackCreate(GetMethod(implObj, "GetGamutBoundaryMeshSize"), flags, 3)
        this.vtbl.GetGamutBoundaryMesh := CallbackCreate(GetMethod(implObj, "GetGamutBoundaryMesh"), flags, 6)
        this.vtbl.GetNeutralAxisSize := CallbackCreate(GetMethod(implObj, "GetNeutralAxisSize"), flags, 2)
        this.vtbl.GetNeutralAxis := CallbackCreate(GetMethod(implObj, "GetNeutralAxis"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.GetNumChannels)
        CallbackFree(this.vtbl.DeviceToColorimetricColors)
        CallbackFree(this.vtbl.ColorimetricToDeviceColors)
        CallbackFree(this.vtbl.ColorimetricToDeviceColorsWithBlack)
        CallbackFree(this.vtbl.SetTransformDeviceModelInfo)
        CallbackFree(this.vtbl.GetPrimarySamples)
        CallbackFree(this.vtbl.GetGamutBoundaryMeshSize)
        CallbackFree(this.vtbl.GetGamutBoundaryMesh)
        CallbackFree(this.vtbl.GetNeutralAxisSize)
        CallbackFree(this.vtbl.GetNeutralAxis)
    }
}

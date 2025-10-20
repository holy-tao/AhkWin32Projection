#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * Initializes a thread to use Windows Runtime APIs.
     * @param {BSTR} bstrXml 
     * @param {Integer} cNumModels 
     * @param {Integer} iModelPosition 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(bstrXml, cNumModels, iModelPosition) {
        bstrXml := bstrXml is String ? BSTR.Alloc(bstrXml).Value : bstrXml

        result := ComCall(3, this, "ptr", bstrXml, "uint", cNumModels, "uint", iModelPosition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pNumChannels 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcsplugin/nf-wcsplugin-idevicemodelplugin-getnumchannels
     */
    GetNumChannels(pNumChannels) {
        result := ComCall(4, this, "uint*", pNumChannels, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cColors 
     * @param {Integer} cChannels 
     * @param {Pointer<Float>} pDeviceValues 
     * @param {Pointer<XYZColorF>} pXYZColors 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcsplugin/nf-wcsplugin-idevicemodelplugin-devicetocolorimetriccolors
     */
    DeviceToColorimetricColors(cColors, cChannels, pDeviceValues, pXYZColors) {
        result := ComCall(5, this, "uint", cColors, "uint", cChannels, "float*", pDeviceValues, "ptr", pXYZColors, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cColors 
     * @param {Integer} cChannels 
     * @param {Pointer<XYZColorF>} pXYZColors 
     * @param {Pointer<Float>} pDeviceValues 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcsplugin/nf-wcsplugin-idevicemodelplugin-colorimetrictodevicecolors
     */
    ColorimetricToDeviceColors(cColors, cChannels, pXYZColors, pDeviceValues) {
        result := ComCall(6, this, "uint", cColors, "uint", cChannels, "ptr", pXYZColors, "float*", pDeviceValues, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cColors 
     * @param {Integer} cChannels 
     * @param {Pointer<XYZColorF>} pXYZColors 
     * @param {Pointer<BlackInformation>} pBlackInformation 
     * @param {Pointer<Float>} pDeviceValues 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcsplugin/nf-wcsplugin-idevicemodelplugin-colorimetrictodevicecolorswithblack
     */
    ColorimetricToDeviceColorsWithBlack(cColors, cChannels, pXYZColors, pBlackInformation, pDeviceValues) {
        result := ComCall(7, this, "uint", cColors, "uint", cChannels, "ptr", pXYZColors, "ptr", pBlackInformation, "float*", pDeviceValues, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iModelPosition 
     * @param {IDeviceModelPlugIn} pIDeviceModelOther 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcsplugin/nf-wcsplugin-idevicemodelplugin-settransformdevicemodelinfo
     */
    SetTransformDeviceModelInfo(iModelPosition, pIDeviceModelOther) {
        result := ComCall(8, this, "uint", iModelPosition, "ptr", pIDeviceModelOther, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PrimaryXYZColors>} pPrimaryColor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcsplugin/nf-wcsplugin-idevicemodelplugin-getprimarysamples
     */
    GetPrimarySamples(pPrimaryColor) {
        result := ComCall(9, this, "ptr", pPrimaryColor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pNumVertices 
     * @param {Pointer<Integer>} pNumTriangles 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcsplugin/nf-wcsplugin-idevicemodelplugin-getgamutboundarymeshsize
     */
    GetGamutBoundaryMeshSize(pNumVertices, pNumTriangles) {
        result := ComCall(10, this, "uint*", pNumVertices, "uint*", pNumTriangles, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cChannels 
     * @param {Integer} cVertices 
     * @param {Integer} cTriangles 
     * @param {Pointer<Float>} pVertices 
     * @param {Pointer<GamutShellTriangle>} pTriangles 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcsplugin/nf-wcsplugin-idevicemodelplugin-getgamutboundarymesh
     */
    GetGamutBoundaryMesh(cChannels, cVertices, cTriangles, pVertices, pTriangles) {
        result := ComCall(11, this, "uint", cChannels, "uint", cVertices, "uint", cTriangles, "float*", pVertices, "ptr", pTriangles, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcColors 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcsplugin/nf-wcsplugin-idevicemodelplugin-getneutralaxissize
     */
    GetNeutralAxisSize(pcColors) {
        result := ComCall(12, this, "uint*", pcColors, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cColors 
     * @param {Pointer<XYZColorF>} pXYZColors 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcsplugin/nf-wcsplugin-idevicemodelplugin-getneutralaxis
     */
    GetNeutralAxis(cColors, pXYZColors) {
        result := ComCall(13, this, "uint", cColors, "ptr", pXYZColors, "HRESULT")
        return result
    }
}

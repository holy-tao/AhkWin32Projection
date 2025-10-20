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

        result := ComCall(3, this, "ptr", bstrXml, "uint", cNumModels, "uint", iModelPosition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pNumChannels 
     * @returns {HRESULT} 
     */
    GetNumChannels(pNumChannels) {
        result := ComCall(4, this, "uint*", pNumChannels, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cColors 
     * @param {Integer} cChannels 
     * @param {Pointer<Single>} pDeviceValues 
     * @param {Pointer<XYZColorF>} pXYZColors 
     * @returns {HRESULT} 
     */
    DeviceToColorimetricColors(cColors, cChannels, pDeviceValues, pXYZColors) {
        result := ComCall(5, this, "uint", cColors, "uint", cChannels, "float*", pDeviceValues, "ptr", pXYZColors, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cColors 
     * @param {Integer} cChannels 
     * @param {Pointer<XYZColorF>} pXYZColors 
     * @param {Pointer<Single>} pDeviceValues 
     * @returns {HRESULT} 
     */
    ColorimetricToDeviceColors(cColors, cChannels, pXYZColors, pDeviceValues) {
        result := ComCall(6, this, "uint", cColors, "uint", cChannels, "ptr", pXYZColors, "float*", pDeviceValues, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cColors 
     * @param {Integer} cChannels 
     * @param {Pointer<XYZColorF>} pXYZColors 
     * @param {Pointer<BlackInformation>} pBlackInformation 
     * @param {Pointer<Single>} pDeviceValues 
     * @returns {HRESULT} 
     */
    ColorimetricToDeviceColorsWithBlack(cColors, cChannels, pXYZColors, pBlackInformation, pDeviceValues) {
        result := ComCall(7, this, "uint", cColors, "uint", cChannels, "ptr", pXYZColors, "ptr", pBlackInformation, "float*", pDeviceValues, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iModelPosition 
     * @param {Pointer<IDeviceModelPlugIn>} pIDeviceModelOther 
     * @returns {HRESULT} 
     */
    SetTransformDeviceModelInfo(iModelPosition, pIDeviceModelOther) {
        result := ComCall(8, this, "uint", iModelPosition, "ptr", pIDeviceModelOther, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PrimaryXYZColors>} pPrimaryColor 
     * @returns {HRESULT} 
     */
    GetPrimarySamples(pPrimaryColor) {
        result := ComCall(9, this, "ptr", pPrimaryColor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pNumVertices 
     * @param {Pointer<UInt32>} pNumTriangles 
     * @returns {HRESULT} 
     */
    GetGamutBoundaryMeshSize(pNumVertices, pNumTriangles) {
        result := ComCall(10, this, "uint*", pNumVertices, "uint*", pNumTriangles, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cChannels 
     * @param {Integer} cVertices 
     * @param {Integer} cTriangles 
     * @param {Pointer<Single>} pVertices 
     * @param {Pointer<GamutShellTriangle>} pTriangles 
     * @returns {HRESULT} 
     */
    GetGamutBoundaryMesh(cChannels, cVertices, cTriangles, pVertices, pTriangles) {
        result := ComCall(11, this, "uint", cChannels, "uint", cVertices, "uint", cTriangles, "float*", pVertices, "ptr", pTriangles, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcColors 
     * @returns {HRESULT} 
     */
    GetNeutralAxisSize(pcColors) {
        result := ComCall(12, this, "uint*", pcColors, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cColors 
     * @param {Pointer<XYZColorF>} pXYZColors 
     * @returns {HRESULT} 
     */
    GetNeutralAxis(cColors, pXYZColors) {
        result := ComCall(13, this, "uint", cColors, "ptr", pXYZColors, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IDeviceModelPlugIn.ahk" { IDeviceModelPlugIn }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\JChColorF.ahk" { JChColorF }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\GamutBoundaryDescription.ahk" { GamutBoundaryDescription }

/**
 * Describes the methods that are defined for the IGamutMapModelPlugIn Component Object Model (COM) interface.
 * @see https://learn.microsoft.com/windows/win32/api/wcsplugin/nn-wcsplugin-igamutmapmodelplugin
 * @namespace Windows.Win32.UI.ColorSystem
 */
export default struct IGamutMapModelPlugIn extends IUnknown {
    /**
     * The interface identifier for IGamutMapModelPlugIn
     * @type {Guid}
     */
    static IID := Guid("{2dd80115-ad1e-41f6-a219-a4f4b583d1f9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGamutMapModelPlugIn interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize                          : IntPtr
        SourceToDestinationAppearanceColors : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGamutMapModelPlugIn.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/wcsplugin/nf-wcsplugin-igamutmapmodelplugin-initialize
     */
    Initialize(bstrXml, pSrcPlugIn, pDestPlugIn, pSrcGBD, pDestGBD) {
        bstrXml := bstrXml is String ? BSTR.Alloc(bstrXml).Value : bstrXml

        result := ComCall(3, this, BSTR, bstrXml, "ptr", pSrcPlugIn, "ptr", pDestPlugIn, GamutBoundaryDescription.Ptr, pSrcGBD, GamutBoundaryDescription.Ptr, pDestGBD, "HRESULT")
        return result
    }

    /**
     * Returns the appropriate gamut-mapped appearance colors in response to the specified number of colors and the CIEJCh colors.
     * @param {Integer} cColors The number of colors in the <i>pXYZColors</i> and <i>pDeviceValues</i> arrays.
     * @param {Pointer<JChColorF>} pInputColors A pointer to the array of incoming colors to be gamut mapped.
     * @returns {JChColorF} A pointer to the array of outgoing colors.
     * @see https://learn.microsoft.com/windows/win32/api/wcsplugin/nf-wcsplugin-igamutmapmodelplugin-sourcetodestinationappearancecolors
     */
    SourceToDestinationAppearanceColors(cColors, pInputColors) {
        pOutputColors := JChColorF()
        result := ComCall(4, this, "uint", cColors, JChColorF.Ptr, pInputColors, JChColorF.Ptr, pOutputColors, "HRESULT")
        return pOutputColors
    }

    Query(iid) {
        if (IGamutMapModelPlugIn.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 6)
        this.vtbl.SourceToDestinationAppearanceColors := CallbackCreate(GetMethod(implObj, "SourceToDestinationAppearanceColors"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.SourceToDestinationAppearanceColors)
    }
}

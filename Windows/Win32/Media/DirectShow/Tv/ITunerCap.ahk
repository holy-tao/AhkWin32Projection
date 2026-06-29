#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005. The ITunerCap interface provides information about the capabilities of a BDA device filter that represents a TV tuner.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(ITunerCap)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-itunercap
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct ITunerCap extends IUnknown {
    /**
     * The interface identifier for ITunerCap
     * @type {Guid}
     */
    static IID := Guid("{e60dfa45-8d56-4e65-a8ab-d6be9412c249}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITunerCap interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_SupportedNetworkTypes : IntPtr
        get_SupportedVideoFormats : IntPtr
        get_AuxInputCount         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITunerCap.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
     * @param {Integer} ulcNetworkTypesMax The maximum number of network-type GUIDs that the <i>pguidNetworkTypes</i> buffer can hold.
     * @param {Pointer<Guid>} pguidNetworkTypes Receives an array of network-type GUIDs. For the list of valid network-type GUIDs, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/default-tuning-spaces">Default Tuning Spaces</a>.
     * @returns {Integer} Receives a count of the number of network-type GUIDs actually written to the <i>pguidNetworkTypes</i> buffer.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-itunercap-get_supportednetworktypes
     */
    get_SupportedNetworkTypes(ulcNetworkTypesMax, pguidNetworkTypes) {
        result := ComCall(3, this, "uint", ulcNetworkTypesMax, "uint*", &pulcNetworkTypes := 0, Guid.Ptr, pguidNetworkTypes, "HRESULT")
        return pulcNetworkTypes
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
     * @param {Pointer<Integer>} pulAMTunerModeType Receives a bitmask that indicates the frequency ranges that are supported by the BDA device filter. For a list of valid mask bits, see <a href="https://docs.microsoft.com/previous-versions/ms778981(v=vs.85)">AMTunerModeType Enumeration</a>.
     * @param {Pointer<Integer>} pulAnalogVideoStandard Receives a bitmask that indicates the analog television signal formats that are supported by the BDA device filter. For a list of valid mask bits, see <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-analogvideostandard">AnalogVideoStandard Enumeration</a>.
     * @returns {HRESULT} When the method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-itunercap-get_supportedvideoformats
     */
    get_SupportedVideoFormats(pulAMTunerModeType, pulAnalogVideoStandard) {
        pulAMTunerModeTypeMarshal := pulAMTunerModeType is VarRef ? "uint*" : "ptr"
        pulAnalogVideoStandardMarshal := pulAnalogVideoStandard is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pulAMTunerModeTypeMarshal, pulAMTunerModeType, pulAnalogVideoStandardMarshal, pulAnalogVideoStandard, "HRESULT")
        return result
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
     * @remarks
     * <div class="alert"><b>Note</b>  The <i>pulCompositeCount</i> and <i>pulSvideoCount</i> parameters are marked in the IDL file as [in, out] but are used as [out] parameters. To preserve binary compatibility with previous versions, they have not been changed.</div>
     * <div> </div>
     * @param {Pointer<Integer>} pulCompositeCount Receives a count of the number of composite-video input connectors on the device.
     * @param {Pointer<Integer>} pulSvideoCount Receives a count of the number of S-video input connectors on the device.
     * @returns {HRESULT} When the method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-itunercap-get_auxinputcount
     */
    get_AuxInputCount(pulCompositeCount, pulSvideoCount) {
        pulCompositeCountMarshal := pulCompositeCount is VarRef ? "uint*" : "ptr"
        pulSvideoCountMarshal := pulSvideoCount is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pulCompositeCountMarshal, pulCompositeCount, pulSvideoCountMarshal, pulSvideoCount, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITunerCap.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_SupportedNetworkTypes := CallbackCreate(GetMethod(implObj, "get_SupportedNetworkTypes"), flags, 4)
        this.vtbl.get_SupportedVideoFormats := CallbackCreate(GetMethod(implObj, "get_SupportedVideoFormats"), flags, 3)
        this.vtbl.get_AuxInputCount := CallbackCreate(GetMethod(implObj, "get_AuxInputCount"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_SupportedNetworkTypes)
        CallbackFree(this.vtbl.get_SupportedVideoFormats)
        CallbackFree(this.vtbl.get_AuxInputCount)
    }
}

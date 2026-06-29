#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IBDA_AutoDemodulate.ahk" { IBDA_AutoDemodulate }

/**
 * The IBDA_AutoDemodulateEx interface extends IBDA_AutoDemodulate.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_AutoDemodulateEx)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nn-bdaiface-ibda_autodemodulateex
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IBDA_AutoDemodulateEx extends IBDA_AutoDemodulate {
    /**
     * The interface identifier for IBDA_AutoDemodulateEx
     * @type {Guid}
     */
    static IID := Guid("{34518d13-1182-48e6-b28f-b24987787326}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBDA_AutoDemodulateEx interfaces
    */
    struct Vtbl extends IBDA_AutoDemodulate.Vtbl {
        get_SupportedDeviceNodeTypes : IntPtr
        get_SupportedVideoFormats    : IntPtr
        get_AuxInputCount            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBDA_AutoDemodulateEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The get_SupportedDeviceNodeTypes method retrieves a list of the device node types that the demodulator supports.
     * @remarks
     * If <i>pguidDeviceNodeTypes</i> is <b>NULL</b>, the method returns the number of supported node types in the <i>pulcDeviceNodeTypes</i> parameter. Otherwise, the method copies the node types into the <i>pguidDeviceNodeTypes</i> array, up to a maximum of <i>ulcDeviceNodeTypesMax</i>.
     * @param {Integer} ulcDeviceNodeTypesMax Specifies the size of the <i>pguidDeviceNodeTypes</i> array.
     * @param {Pointer<Guid>} pguidDeviceNodeTypes Pointer to an array of GUIDs, or <b>NULL</b>.
     * @returns {Integer} If <i>pguidDeviceNodeTypes</i> is <b>NULL</b>, receives the number of device node types that the demodulator supports. If <i>pguidDeviceNodeTypes</i> is not <b>NULL</b>, receives the number of node types that were copied into the <i>pguidDeviceNodeTypes</i> array.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_autodemodulateex-get_supporteddevicenodetypes
     */
    get_SupportedDeviceNodeTypes(ulcDeviceNodeTypesMax, pguidDeviceNodeTypes) {
        result := ComCall(4, this, "uint", ulcDeviceNodeTypesMax, "uint*", &pulcDeviceNodeTypes := 0, Guid.Ptr, pguidDeviceNodeTypes, "HRESULT")
        return pulcDeviceNodeTypes
    }

    /**
     * The get_SupportedVideoFormats method retrieves the video formats that are supported by the demodulator.
     * @param {Pointer<Integer>} pulAMTunerModeType Pointer to a variable that receives a mask that indicates the frequency ranges that are supported by the BDA device filter. For a list of valid mask bits, see <a href="https://docs.microsoft.com/previous-versions/ms778981(v=vs.85)">AMTunerModeType Enumeration</a>.
     * @param {Pointer<Integer>} pulAnalogVideoStandard Pointer to a variable that receives a mask that indicates the analog television signal formats that are supported by the BDA device filter. For a list of valid mask bits, see <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-analogvideostandard">AnalogVideoStandard Enumeration</a>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_autodemodulateex-get_supportedvideoformats
     */
    get_SupportedVideoFormats(pulAMTunerModeType, pulAnalogVideoStandard) {
        pulAMTunerModeTypeMarshal := pulAMTunerModeType is VarRef ? "uint*" : "ptr"
        pulAnalogVideoStandardMarshal := pulAnalogVideoStandard is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pulAMTunerModeTypeMarshal, pulAMTunerModeType, pulAnalogVideoStandardMarshal, pulAnalogVideoStandard, "HRESULT")
        return result
    }

    /**
     * The get_AuxInputCount method retrieves a count of the number of auxiliary inputs on the demodulator.
     * @remarks
     * <div class="alert"><b>Note</b>  The <i>pulCompositeCount</i> and <i>pulSvideoCount</i> parameters are marked in the IDL file as [in, out] but are used as [out] parameters. To preserve binary compatibility with previous versions, they have not been changed.</div>
     * <div> </div>
     * @param {Pointer<Integer>} pulCompositeCount Pointer to a variable that receives a count of the number of composite-video input connectors on the device.
     * @param {Pointer<Integer>} pulSvideoCount Pointer to a variable that receives a count of the number of S-Video input connectors on the device.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_autodemodulateex-get_auxinputcount
     */
    get_AuxInputCount(pulCompositeCount, pulSvideoCount) {
        pulCompositeCountMarshal := pulCompositeCount is VarRef ? "uint*" : "ptr"
        pulSvideoCountMarshal := pulSvideoCount is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pulCompositeCountMarshal, pulCompositeCount, pulSvideoCountMarshal, pulSvideoCount, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBDA_AutoDemodulateEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_SupportedDeviceNodeTypes := CallbackCreate(GetMethod(implObj, "get_SupportedDeviceNodeTypes"), flags, 4)
        this.vtbl.get_SupportedVideoFormats := CallbackCreate(GetMethod(implObj, "get_SupportedVideoFormats"), flags, 3)
        this.vtbl.get_AuxInputCount := CallbackCreate(GetMethod(implObj, "get_AuxInputCount"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_SupportedDeviceNodeTypes)
        CallbackFree(this.vtbl.get_SupportedVideoFormats)
        CallbackFree(this.vtbl.get_AuxInputCount)
    }
}

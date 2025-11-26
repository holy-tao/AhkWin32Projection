#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IVPBaseConfig.ahk

/**
 * The IVPConfig interface must be implemented by any filter that wraps a hardware decoder with a video port.
 * @remarks
 * 
 * Include Dvp.h and Vptype.h before Vpconfig.h.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vpconfig/nn-vpconfig-ivpconfig
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVPConfig extends IVPBaseConfig{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVPConfig
     * @type {Guid}
     */
    static IID => Guid("{bc29a660-30e3-11d0-9e69-00c04fd7c15b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 16

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsVPDecimationAllowed", "SetScalingFactors"]

    /**
     * The IsVPDecimationAllowed method, given the context, retrieves whether scaling at the video port is possible.
     * @param {Pointer<BOOL>} pbIsDecimationAllowed Receives a Boolean value indicating whether decimation is possible.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vpconfig/nf-vpconfig-ivpconfig-isvpdecimationallowed
     */
    IsVPDecimationAllowed(pbIsDecimationAllowed) {
        pbIsDecimationAllowedMarshal := pbIsDecimationAllowed is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, pbIsDecimationAllowedMarshal, pbIsDecimationAllowed, "HRESULT")
        return result
    }

    /**
     * The SetScalingFactors method sets the factors by which the decoder should scale the video stream.
     * @param {Pointer<AMVPSIZE>} pamvpSize Pointer to the new scaling size structure (<a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vptype/ns-vptype-amvpsize">AMVPSIZE</a>) to use to specify the width and height.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vpconfig/nf-vpconfig-ivpconfig-setscalingfactors
     */
    SetScalingFactors(pamvpSize) {
        result := ComCall(17, this, "ptr", pamvpSize, "HRESULT")
        return result
    }
}

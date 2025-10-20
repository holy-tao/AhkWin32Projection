#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005. The ITunerCap interface provides information about the capabilities of a BDA device filter that represents a TV tuner.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(ITunerCap)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-itunercap
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class ITunerCap extends IUnknown{
    /**
     * The interface identifier for ITunerCap
     * @type {Guid}
     */
    static IID => Guid("{e60dfa45-8d56-4e65-a8ab-d6be9412c249}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} ulcNetworkTypesMax 
     * @param {Pointer<UInt32>} pulcNetworkTypes 
     * @param {Pointer<Guid>} pguidNetworkTypes 
     * @returns {HRESULT} 
     */
    get_SupportedNetworkTypes(ulcNetworkTypesMax, pulcNetworkTypes, pguidNetworkTypes) {
        result := ComCall(3, this, "uint", ulcNetworkTypesMax, "uint*", pulcNetworkTypes, "ptr", pguidNetworkTypes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulAMTunerModeType 
     * @param {Pointer<UInt32>} pulAnalogVideoStandard 
     * @returns {HRESULT} 
     */
    get_SupportedVideoFormats(pulAMTunerModeType, pulAnalogVideoStandard) {
        result := ComCall(4, this, "uint*", pulAMTunerModeType, "uint*", pulAnalogVideoStandard, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulCompositeCount 
     * @param {Pointer<UInt32>} pulSvideoCount 
     * @returns {HRESULT} 
     */
    get_AuxInputCount(pulCompositeCount, pulSvideoCount) {
        result := ComCall(5, this, "uint*", pulCompositeCount, "uint*", pulSvideoCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

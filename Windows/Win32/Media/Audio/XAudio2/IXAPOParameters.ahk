#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * An optional interface that allows an XAPO to use effect-specific parameters.
 * @remarks
 * 
  * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
  * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//xapo/nn-xapo-ixapoparameters
 * @namespace Windows.Win32.Media.Audio.XAudio2
 * @version v4.0.30319
 */
class IXAPOParameters extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXAPOParameters
     * @type {Guid}
     */
    static IID => Guid("{26d95c66-80f2-499a-ad54-5ae7f01c6d98}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetParameters", "GetParameters"]

    /**
     * 
     * @param {Pointer} pParameters 
     * @param {Integer} ParameterByteSize 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/xapo/nf-xapo-ixapoparameters-setparameters
     */
    SetParameters(pParameters, ParameterByteSize) {
        ComCall(3, this, "ptr", pParameters, "uint", ParameterByteSize)
    }

    /**
     * 
     * @param {Pointer} pParameters 
     * @param {Integer} ParameterByteSize 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/xapo/nf-xapo-ixapoparameters-getparameters
     */
    GetParameters(pParameters, ParameterByteSize) {
        ComCall(4, this, "ptr", pParameters, "uint", ParameterByteSize)
    }
}

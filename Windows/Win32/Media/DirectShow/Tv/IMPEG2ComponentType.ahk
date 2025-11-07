#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ILanguageComponentType.ahk

/**
 * The IMPEG2ComponentType interface is implemented on MPEG2ComponentType objects. It enables applications to set and retrieve information about MPEG2 stream types.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMPEG2ComponentType)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-impeg2componenttype
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMPEG2ComponentType extends ILanguageComponentType{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMPEG2ComponentType
     * @type {Guid}
     */
    static IID => Guid("{2c073d84-b51c-48c9-aa9f-68971e1f6e38}")

    /**
     * The class identifier for MPEG2ComponentType
     * @type {Guid}
     */
    static CLSID => Guid("{418008f3-cf67-4668-9628-10dc52be1d08}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 26

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_StreamType", "put_StreamType"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-impeg2componenttype-get_streamtype
     */
    get_StreamType() {
        result := ComCall(26, this, "int*", &MP2StreamType := 0, "HRESULT")
        return MP2StreamType
    }

    /**
     * 
     * @param {Integer} MP2StreamType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-impeg2componenttype-put_streamtype
     */
    put_StreamType(MP2StreamType) {
        result := ComCall(27, this, "int", MP2StreamType, "HRESULT")
        return result
    }
}
